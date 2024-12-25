#include "validator.h"
#include <opencv2/imgproc.hpp>
#include <iostream>

Validator::Validator(int pyramidLevels, double threshold)
    : pyramidLevels(pyramidLevels), threshold(threshold) {
        std::cout << "Validator prepared." << std::endl;
}

std::vector<Detection> Validator::validateAndRedetect(const cv::Mat& image,
                                                            const std::vector<Detection>& detections,
                                                            const cv::Mat& templateImg) {
    std::vector<Detection> updatedDetections;
    int h = image.rows;
    int w = image.cols;

    // create Laplacian pyramid for the image
    std::vector<cv::Mat> imagePyramid = {image};
    for (int i = 1; i < pyramidLevels; ++i) {
        cv::Mat downsampled;
        cv::pyrDown(imagePyramid.back(), downsampled);
        imagePyramid.push_back(downsampled);
    }

    // process each detection
    for (const auto& detection : detections) {
        int x_min = std::max(0, detection.x_min);
        int y_min = std::max(0, detection.y_min);
        int x_max = std::min(w, detection.x_max);
        int y_max = std::min(h, detection.y_max);

        cv::Rect roiRect(x_min, y_min, x_max - x_min, y_max - y_min);
        cv::Mat roi = image(roiRect);

        // resize the template to match ROI dimensions
        cv::Mat resizedTemplate;
        cv::resize(templateImg, resizedTemplate, roi.size());

        // template matching
        cv::Mat result;
        cv::matchTemplate(roi, resizedTemplate, result, cv::TM_CCOEFF_NORMED);

        double minVal, maxVal;
        cv::Point minLoc, maxLoc;
        cv::minMaxLoc(result, &minVal, &maxVal, &minLoc, &maxLoc);

        std::cout << "Match result: " << maxVal << std::endl;

        if (maxVal >= threshold) {
            updatedDetections.emplace_back(x_min, y_min, x_max, y_max, maxVal);
        }
    }

    return updatedDetections;
}