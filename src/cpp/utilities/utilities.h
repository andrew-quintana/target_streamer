#ifndef UTILITIES_H
#define UTILITIES_H

#include <opencv2/opencv.hpp>
#include <Eigen/Dense>
#include <filesystem>
#include <string>
#include <vector>

struct Detection {
    int x_min=-1;
    int y_min=-1;
    int x_max=-1;
    int y_max=-1;
    double confidence=-1;

    Detection(int x1, int y1, int x2, int y2, double conf = 1.0)
        : x_min(x1), y_min(y1), x_max(x2), y_max(y2), confidence(conf) {}

    // Convert to cv::Rect
    cv::Rect toCvRect() const {
        return cv::Rect(x_min, y_min, x_max - x_min, y_max - y_min);
    }

    // Static factory method to create a Detection from points
    static Detection fromCvDetection(const std::vector<cv::Point2f>& points,
                                     double confidence = 1.0) {
        if (points.size() != 4) {
            throw std::invalid_argument("fromPoints: QR code does not have exactly 4 points.");
        }

        // Calculate bounding box
        int x_min = static_cast<int>(std::min({points[0].x, points[1].x, points[2].x, points[3].x}));
        int y_min = static_cast<int>(std::min({points[0].y, points[1].y, points[2].y, points[3].y}));
        int x_max = static_cast<int>(std::max({points[0].x, points[1].x, points[2].x, points[3].x}));
        int y_max = static_cast<int>(std::max({points[0].y, points[1].y, points[2].y, points[3].y}));

        return Detection(x_min, y_min, x_max, y_max, confidence);
    }

    Eigen::Vector2d toEigenVector2d() const {
        return Eigen::Vector2d(
            (x_max - x_min) / 2,
            (y_max - y_min) / 2
        );
    }
};

void saveAnnotatedImage(const cv::Mat& image, const std::vector<Detection>& detections, 
                        const std::string& output_dir, const std::string& image_name, 
                        const std::string& suffix = "");

std::vector<cv::Rect> vector2DtoRects(const std::vector<Eigen::Vector2d>& eigenPoints,
                                      int rectWidth, int rectHeight);



Detection decodeDetections(const std::vector<cv::Point2f>& points, const std::string& decodedText, double confidence = 1.0);

#endif // UTILITIES_H