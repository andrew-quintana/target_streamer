#include "homography_handler.h"
#include <iostream>
#include <opencv2/core/eigen.hpp>

// calculate homography for corresponding points via SVD 
// https://cseweb.ucsd.edu/classes/wi07/cse252a/homography_estimation/homography_estimation.pdf
Eigen::Matrix3d HomographyHandler::findFourPointTransform(const std::vector<Eigen::Vector2d>& srcPoints,
                                                          const std::vector<Eigen::Vector2d>& dstPoints) {
    

    // check for equal sized vectors and create the constraint matrix
    int svd_dim = 2 * srcPoints.size();
    Eigen::MatrixXd A(svd_dim, 9);
    for (int i = 0; i < dstPoints.size(); ++i) {
        double x = srcPoints[i].x();
        double y = srcPoints[i].y();
        double xPrime = dstPoints[i].x();
        double yPrime = dstPoints[i].y();

        A.row(2 * i) << x, y, 1, 0, 0, 0, -xPrime * x, -xPrime * y, -xPrime;
        A.row(2 * i + 1) << 0, 0, 0, x, y, 1, -yPrime * x, -yPrime * y, -yPrime;
    }

    // solve linear least squares via SVD
    Eigen::JacobiSVD<Eigen::MatrixXd> svd(A, Eigen::ComputeFullV);
    Eigen::VectorXd h = svd.matrixV().col(8);

    Eigen::Matrix3d homography;
    homography << h(0), h(1), h(2),
                  h(3), h(4), h(5),
                  h(6), h(7), h(8);

    return homography;
}

// find point correspondences
Eigen::Vector2d HomographyHandler::correspondences(double x, double y, const Eigen::Matrix3d& eig) {
    Eigen::Vector3d point(x, y, 1.0);
    Eigen::Vector3d transformed = eig * point;

    double x_t = transformed(0) / transformed(2);
    double y_t = transformed(1) / transformed(2);

    return Eigen::Vector2d(x_t, y_t);
}

// apply homography and warp image
cv::Mat HomographyHandler::applyHomography(const cv::Mat& image, const Eigen::Matrix3d& homography,
                                           int width, int height) {
    // copy Eigen matrix to OpenCV matrix
    cv::Mat warpMat(3, 3, CV_64F);
    cv::eigen2cv(homography, warpMat);

    cv::Mat output;
    cv::warpPerspective(image, output, warpMat, cv::Size(width, height));

    return output;
}

// crop image to bounding box defined by points
cv::Mat HomographyHandler::cropToBoundingBox(const cv::Mat& image, const Eigen::Vector2d& tlPoint, const Eigen::Vector2d& brPoint) {
    // Convert points to integer coordinates
    int x_min = static_cast<int>(std::round(tlPoint.x()));
    int y_min = static_cast<int>(std::round(tlPoint.y()));
    int x_max = static_cast<int>(std::round(brPoint.x()));
    int y_max = static_cast<int>(std::round(brPoint.y()));

    // Ensure the bounding box is within the image dimensions
    x_min = std::max(0, x_min);
    y_min = std::max(0, y_min);
    x_max = std::min(image.cols, x_max);
    y_max = std::min(image.rows, y_max);

    // Create the ROI (Region of Interest) rectangle
    cv::Rect roi(cv::Point(x_min, y_min), cv::Point(x_max, y_max));

    // Crop and return the ROI from the image
    return image(roi).clone(); // Use .clone() to ensure a deep copy
}