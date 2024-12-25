#include "yolo_detector.h"
#include <iostream>

YOLODetector::YOLODetector(const std::string& modelPath, float confThreshold, float iouThreshold)
    : confidenceThreshold(confThreshold), iouThreshold(iouThreshold) {
    try {
        model = torch::jit::load(modelPath);
        model.to(torch::kCPU);
    } catch (const c10::Error& e) {
        std::cerr << "Error loading YOLO model from " << modelPath << ": " << e.what() << std::endl;
        throw;
    }
}

YOLODetector::~YOLODetector() = default;

std::vector<Eigen::Vector2d> YOLODetector::detect(const cv::Mat& image) {
    std::vector<Eigen::Vector2d> detectedPoints;

    // preprocess the image
    cv::Mat inputBlob;
    cv::resize(image, inputBlob, cv::Size(640, 640)); // resize to YOLO's input size
    inputBlob.convertTo(inputBlob, CV_32F, 1.0 / 255.0); // normalize
    torch::Tensor inputTensor = torch::from_blob(inputBlob.data, {1, inputBlob.rows, inputBlob.cols, 3}, torch::kFloat);
    inputTensor = inputTensor.permute({0, 3, 1, 2}); // convert to CxHxW

    // forward pass
    std::vector<torch::jit::IValue> inputs;
    inputs.push_back(inputTensor);
    torch::Tensor output = model.forward(inputs).toTensor();

    // postprocess output
    auto detections = output.squeeze(0); // Remove batch dimension
    for (int i = 0; i < detections.size(0); ++i) {
        auto detection = detections[i];
        float confidence = detection[4].item<float>();
        if (confidence > confidenceThreshold) {
            // extract box coordinates
            float x = detection[0].item<float>();
            float y = detection[1].item<float>();
            float width = detection[2].item<float>();
            float height = detection[3].item<float>();

            // convert box to Eigen::Vector2d
            detectedPoints.emplace_back(x - width / 2, y - height / 2); // top-left
            detectedPoints.emplace_back(x + width / 2, y + height / 2); // bottom-right
        }
    }

    return detectedPoints;
}

std::vector<cv::Rect> YOLODetector::nonMaxSuppression(const std::vector<cv::Rect>& boxes, const std::vector<float>& confidences) {
    std::vector<int> indices;
    cv::dnn::NMSBoxes(boxes, confidences, confidenceThreshold, iouThreshold, indices);

    std::vector<cv::Rect> result;
    for (int idx : indices) {
        result.push_back(boxes[idx]);
    }
    return result;
}