from picamera2 import Picamera2
import time
import cv2
from code_detector import qr_code_detector


# Initialize Picamera2
picam2 = Picamera2()
print("Camera initialized")

# Create a configuration with the desired format
config = picam2.create_still_configuration()
print("Camera configured")

# Apply the configuration
picam2.configure(config)
print("Camera configuration applied")

# Start the camera
picam2.start()
print("Starting camera")

# Capture an image
image = picam2.capture_array()
print("Taking picture")
image = cv2.cvtColor(image, cv2.COLOR_BGRA2BGR)
cv2.imwrite("image.jpg",image)
print("Saving Picture")
picam2.stop()
print("Stopping camera")

qr_code_detector("image.jpg","../data/rpi_testing/initial/")
print("Image captured and saved as 'annotated_image.jpg'")