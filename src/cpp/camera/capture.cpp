#include <iostream>
#include <fstream>
#include <libcamera/libcamera.h>
#include <libcamera/camera_manager.h>
#include <libcamera/framebuffer_allocator.h>
#include <libcamera/request.h>
#include <libcamera/stream.h>
#include <libcamera/control_ids.h>

using namespace libcamera;

int main() {
    // Initialize Camera Manager
    CameraManager cm;
    cm.start();

    // Get the first available camera
    if (cm.cameras().empty()) {
        std::cerr << "No cameras available" << std::endl;
        return -1;
    }
    std::shared_ptr<Camera> camera = cm.cameras()[0];

    // Acquire and configure the camera
    camera->acquire();
    std::unique_ptr<CameraConfiguration> config = camera->generateConfiguration({ StreamRole::StillCapture });
    config->at(0).pixelFormat = formats::RGB888;
    config->at(0).size = { 640, 480 }; // Set desired resolution
    config->validate();
    camera->configure(config.get());

    // Allocate buffers
    FrameBufferAllocator allocator(camera);
    for (StreamConfiguration &cfg : *config) {
        allocator.allocate(cfg.stream());
    }

    // Create a request
    std::unique_ptr<Request> request = camera->createRequest();
    if (!request) {
        std::cerr << "Failed to create request" << std::endl;
        return -1;
    }

    // Add a buffer to the request
    const std::unique_ptr<FrameBuffer> &buffer = allocator.buffers(config->at(0).stream())[0];
    request->addBuffer(config->at(0).stream(), buffer.get());

    // Start the camera
    camera->start();

    // Queue the request
    camera->queueRequest(request.get());

    // Wait for the request to complete
    camera->waitForIdle();

    // Retrieve the buffer and save the image
    const FrameMetadata &metadata = buffer->metadata();
    const FrameBuffer::Plane &plane = buffer->planes()[0];
    std::ofstream file("image.rgb", std::ios::binary);
    file.write(static_cast<char *>(plane.mem()), metadata.size);
    file.close();

    // Stop the camera and release resources
    camera->stop();
    camera->release();
    cm.stop();

    std::cout << "Image captured and saved as 'image.rgb'" << std::endl;
    return 0;
}