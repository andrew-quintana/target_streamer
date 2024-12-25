#ifndef QR_DETECTOR_H
#define QR_DETECTOR_H

#include <opencv2/opencv.hpp>
#include <vector>
#include <vector>
#include <Eigen/Dense>
#include <utilities.h>

class QRDetectorCV {
public:
    QRDetectorCV(std::vector<Eigen::Vector2d> srcPoints = {
        Eigen::Vector2d(2455.5, 1739.0),
        Eigen::Vector2d(3487.5, 1761.0),
        Eigen::Vector2d(3437.0, 2747.0),
        Eigen::Vector2d(2417.5, 2599.0)
    });
    ~QRDetectorCV();
    std::vector<Detection> detect(const cv::Mat& image);
    
    const std::vector<Eigen::Vector2d>& getSrcPoints() const {
        return srcPoints_;
    }

private:
    cv::QRCodeDetector cvDetector;
    std::vector<Eigen::Vector2d> srcPoints_;
};

#endif // QR_DETECTOR_H