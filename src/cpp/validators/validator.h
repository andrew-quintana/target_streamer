#ifndef VALIDATOR_H
#define VALIDATOR_H

#include <opencv2/opencv.hpp>
#include "utilities.h"
#include <Eigen/Dense>
#include <vector>

class Validator {
public:
    Validator(int pyramidLevels = 3, double threshold = -0.01);
    std::vector<Detection> validateAndRedetect(const cv::Mat& image,
                                                const std::vector<Detection>& detections,
                                                const cv::Mat& templateImg);

private:
    int pyramidLevels;
    double threshold;
};

#endif // VALIDATOR_H