import cv2
from matplotlib import pyplot as plt
import os
import torch
import numpy as np
import time

def save_yolo_results(model, image_path, output_dir):
    """
    Perform inference with YOLOv5 and save the results as annotated images and YOLO labels.

    Args:
        model: Loaded YOLOv5 model.
        image_path (str): Path to the input image.
        output_dir (str): Directory to save results (images and labels).
    """
    # Create output directories for images and labels
    os.makedirs(f"{output_dir}/images", exist_ok=True)
    os.makedirs(f"{output_dir}/labels", exist_ok=True)
    
    # Load the image
    image = cv2.imread(image_path)
    image_name = os.path.splitext(os.path.basename(image_path))[0]  # Extract name without extension
    
    # Perform inference
    results = model(image)

    # Save annotated image
    rendered_image = results.render()[0]  # Renders the detections
    rendered_image = cv2.cvtColor(rendered_image, cv2.COLOR_RGB2BGR)  # Convert to BGR
    rendered_image = np.ascontiguousarray(rendered_image, dtype=np.uint8)  # Ensure data type and memory

    # Save annotated image
    image_name = os.path.splitext(os.path.basename(image_path))[0]
    annotated_image_path = f"{output_dir}/images/{image_name}_result.jpg"
    cv2.imwrite(annotated_image_path, rendered_image)
    print(f"Saved annotated image: {annotated_image_path}")
    
    # Save detection labels in YOLO format
    label_path = f"{output_dir}/labels/{image_name}.txt"
    detections = results.pandas().xywh[0]  # Get results as DataFrame
    
    with open(label_path, "w") as f:
        for _, row in detections.iterrows():
            class_id = row['class']
            x_center = row['xcenter'] / image.shape[1]  # Normalize x center
            y_center = row['ycenter'] / image.shape[0]  # Normalize y center
            width = row['width'] / image.shape[1]       # Normalize width
            height = row['height'] / image.shape[0]     # Normalize height
            
            f.write(f"{class_id} {x_center} {y_center} {width} {height}\n")
    
    print(f"Saved YOLO label file: {label_path}")

if __name__ == "__main__":
    # Load the model
    model = torch.hub.load('ultralytics/yolov5', 'custom', path='../models/yolov5n_best.pt')

    # Verify the model is loaded
    print("Model loaded successfully!")

    # Input and output paths
    test_dir = "../data/test/samples/"
    output_dir = "../results/yolov5n"

    # Run inference and save results
    for filename in os.listdir(test_dir):
        if "out" not in filename and filename[0] != ".":
            filepath = os.path.join(test_dir, filename)
            print(filepath)
            start_time = time.time()
            save_yolo_results(model, filepath, output_dir)
            print(f"Time Elapsed = {time.time() - start_time}")