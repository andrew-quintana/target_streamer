#include "utilities.h"
#include <vector>
#include <string>
#include <iostream>

void saveAnnotatedImage(const cv::Mat& image, const std::vector<Detection>& detections, 
                        const std::string& output_dir, const std::string& image_name, 
                        const std::string& suffix) {
    cv::Mat annotated = image.clone();

    // draw bounding boxes
    for (const auto& d : detections) {
        cv::Rect rect = d.toCvRect();
        cv::rectangle(annotated, rect, cv::Scalar(0, 255, 0), 2);
    }

    // ensure the output directory exists
    std::filesystem::create_directories(output_dir);

    // save the annotated image
    std::string output_path = output_dir + "/" + image_name + suffix + ".jpg";
    if (!cv::imwrite(output_path, annotated)) {
        std::cerr << "Error: Failed to save image to " << output_path << std::endl;
    } else {
        std::cout << "Annotated image saved to " << output_path << std::endl;
    }
}


// CONVERTSIONS

std::vector<cv::Rect> vector2DtoRects(const std::vector<Eigen::Vector2d>& points) {
    std::vector<cv::Rect> rects;

    for (const auto& point : points) {
        // Create a rectangle with the point as the top-left corner and a size of 1x1
        rects.emplace_back(cv::Rect(static_cast<int>(point.x()), static_cast<int>(point.y()), 1, 1));
    }

    return rects;
}