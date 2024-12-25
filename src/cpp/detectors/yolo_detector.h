#ifndef YOLO_DETECTOR_H
#define YOLO_DETECTOR_H

#include <torch/script.h>
#include <opencv2/opencv.hpp>
#include <vector>
#include <Eigen/Dense>

class YOLODetector {
public:
    YOLODetector(const std::string& modelPath, float confThreshold = 0.5, float iouThreshold = 0.4);
    ~YOLODetector();
    std::vector<Detection> detect(const cv::Mat& image) ;

private:
    torch::jit::script::Module model;
    float confidenceThreshold;
    float iouThreshold;

    std::vector<std::string> classNames;

    // helper functions
    std::vector<cv::Rect> nonMaxSuppression(const std::vector<cv::Rect>& boxes, const std::vector<float>& confidences);
};

#endif // YOLO_DETECTOR_H