#include <iostream>
#include <filesystem>
#include <opencv2/opencv.hpp>
#include "qr_detector.h"
#include "homography_handler.h"
#include "validator.h"
#include "utilities.h"
#include <unistd.h> // For getcwd()

namespace fs = std::filesystem;

int main() {
    // get working directory
    char cwd[1024];
    std::string workingDir;
    if (getcwd(cwd, sizeof(cwd)) != nullptr) {
        workingDir = cwd;
        std::string dirTitle = "target_streamer";
        std::size_t pos = workingDir.find(dirTitle);
        if (pos != std::string::npos) {
            // truncate the string at the position of "target_streamer"
            workingDir = workingDir.substr(0, pos + dirTitle.size());
        }
    }
    else {
        perror("getcwd");
        return -1;
    }
    std::cout << "Working Directory: " << workingDir << std::endl;
    
    // paths for test data, output directory, and the QR code template
    std::string testDir = workingDir + "/data/test/samples/";
    std::string outputDir = workingDir + "/data/test/cpp/sandbox_run/cv2";
    std::string templatePath = workingDir + "/data/qr_codes/qr_tr.png";

    // initialize the QR code detector and validator
    QRDetectorCV qrDetector;
    Validator v;

    // load the template image for validation
    cv::Mat template_image = cv::imread(templatePath);
    if (template_image.empty()) {
        std::cerr << "Error: Could not load template image at " << templatePath << std::endl;
        return -1;
    }
    std::cout << "Template image prepared" << std::endl;

    // iterate through test directory
    for (const auto& entry : fs::directory_iterator(testDir)) {
        std::string filepath = entry.path().string();
        std::string image_name = entry.path().stem().string();
        std::cout << "Processing: " << filepath << std::endl;

        // load the test image
        cv::Mat image = cv::imread(filepath);
        if (image.empty()) {
            std::cerr << "Error: Could not load image at " << filepath << std::endl;
            continue;
        }

        // get size of image
        int h = image.rows;
        int w = image.cols;

        // step 1: Detect QR codes
        auto detections = qrDetector.detect(image);
        if (detections.empty()) { continue; }
        saveAnnotatedImage(image, detections, outputDir, image_name);

        // step 2: Validate detections with template matching
        auto validated_detections = v.validateAndRedetect(image, detections, template_image);
        if (validated_detections.empty()) { continue; }
        saveAnnotatedImage(image, validated_detections, outputDir, image_name, "_tmatch");

        // step 3: Ensure there are exactly 4 detections
        if (validated_detections.size() != 4) {
            std::cerr << "Error: Detections need to find 4 codes but found " 
                      << validated_detections.size() << std::endl;
            continue;
        }

        // step 4: Format detections for transformation
        std::vector<Eigen::Vector2d> dst_points, tl, tr, bl, br;
        Eigen::Vector2d tlPoint, brPoint;
        for (auto const& detection : validated_detections) {
            Eigen::Vector2d center = detection.toEigenVector2d();

            // assign to quadrants
            if (center.x() < w / 2 && center.y() < h / 2) {
                tl.emplace_back(center.x(), center.y());
                tlPoint << detection.x_min, detection.y_min;
            }
            else if (center.x() >= w / 2 && center.y() < h / 2) {
                tr.emplace_back(center.x(), center.y());
            }
            else if (center.x() < w / 2 && center.y() >= h / 2) {
                bl.emplace_back(center.x(), center.y());
            }
            else {
                br.emplace_back(center.x(), center.y());
                brPoint << detection.x_min, detection.y_min;
            }
        };

        // verify one per quadrant
        if (tl.size() != 1 || tr.size() != 1 || br.size() != 1 || bl.size() != 1) {
            std::cerr << "Error: Four QR codes (one in each quadrant) are required for the transform." << std::endl;
        }
        
        // prepare point order
        dst_points.push_back(tl[0]);
        dst_points.push_back(tr[0]);
        dst_points.push_back(br[0]);
        dst_points.push_back(bl[0]);

        // step 5: Compute homography
        HomographyHandler homography_handler;
        auto homography = homography_handler.findFourPointTransform(qrDetector.getSrcPoints(), dst_points);

        // step 6: Warp and crop the image
        cv::Mat warped_image = homography_handler.applyHomography(image, homography, image.cols, image.rows);
        cv::Mat cropped_image = homography_handler.cropToBoundingBox(warped_image, tlPoint, brPoint);

        // step 7: Save the final output
        fs::create_directories(outputDir + "/images/");
        std::string output_path = outputDir + "/images/" + image_name + "_output.jpg";
        if (cv::imwrite(output_path, cropped_image)) {
            std::cout << "Final cropped image saved to " << output_path << std::endl;
        } else {
            std::cerr << "Error: Failed to save final cropped image to " << output_path << std::endl;
        }
    }

    return 0;
}