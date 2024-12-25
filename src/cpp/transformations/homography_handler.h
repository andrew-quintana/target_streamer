#ifndef HOMOGRAPHY_HANDLER_H
#define HOMOGRAPHY_HANDLER_H

#include <opencv2/opencv.hpp>
#include <Eigen/Dense>
#include <vector>
#include "utilities.h"

class HomographyHandler {
public:
    Eigen::Matrix3d findFourPointTransform(const std::vector<Eigen::Vector2d>& srcPoints,
                                           const std::vector<Eigen::Vector2d>& dstPoints);
    cv::Mat applyHomography(const cv::Mat& image, const Eigen::Matrix3d& homography,
                            int width, int height);
    cv::Mat cropToBoundingBox(const cv::Mat& image, const Eigen::Vector2d& tlPoint, const Eigen::Vector2d& brPoint);

    Eigen::Vector2d correspondences(double x, double y, const Eigen::Matrix3d& eig);
};

#endif // HOMOGRAPHY_HANDLER_H