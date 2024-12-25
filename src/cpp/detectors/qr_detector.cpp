#include "qr_detector.h"
#include <iostream>

QRDetectorCV::QRDetectorCV(std::vector<Eigen::Vector2d> srcPoints)
    : srcPoints_(std::move(srcPoints)) {
        std::cout << "OpenCV QR Detector prepared." << std::endl;
}

QRDetectorCV::~QRDetectorCV() {}

std::vector<Detection> QRDetectorCV::detect(const cv::Mat& image) {
    std::vector<Detection> detectedPoints;

    // check if the image is valid
    if (image.empty()) {
        std::cerr << "Error: Input image is empty." << std::endl;
        return detectedPoints;
    }

    // points placeholder
    std::vector<std::vector<cv::Point2f>> points;

    // detect multiple QR codes
    bool found = cvDetector.detect(image, points);
    if (!found || points.empty()) {
        std::cout << "No QR codes found!" << std::endl;
        return detectedPoints;
    }

    // decode each QR code
    for (const auto& pointSet : points) {
        try {
            // create a Detection object for each QR code
            Detection detection = Detection::fromCvDetection(pointSet, 1.0);
            detectedPoints.push_back(detection);

        } catch (const std::exception& e) {
            std::cerr << "Error: " << e.what() << std::endl;
        }
    }

    return detectedPoints;
}