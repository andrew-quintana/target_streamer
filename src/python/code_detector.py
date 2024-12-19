import cv2
import os

def qr_code_detector(image_path, output_dir, save_annotated=True):
    """
    Detect QR codes using OpenCV and save results in YOLO format.

    Args:
        image_path (str): Path to the input image.
        output_dir (str): Directory to save results (images and labels).
        save_annotated (bool): If True, save the annotated image with QR code detections.
    """
    # Create output directories for images and labels
    os.makedirs(f"{output_dir}/images", exist_ok=True)
    os.makedirs(f"{output_dir}/labels", exist_ok=True)
    
    # Load the image
    image = cv2.imread(image_path)
    image = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    if image is None:
        raise ValueError(f"Error: Could not load image at {image_path}")
    h, w = image.shape[:2]
    image_name = os.path.splitext(os.path.basename(image_path))[0]  # Extract name without extension
    
    # Initialize QR Code detector
    qr_detector = cv2.QRCodeDetector()

    # Detect and decode QR codes
    data, _, vertices, _ = qr_detector.detectAndDecodeMulti(image)

    labels = []  # Store YOLO-format labels
    if vertices is not None:
        for i, points in enumerate(vertices):
            # Calculate bounding box center, width, and height
            x_min = points[:, 0].min()
            y_min = points[:, 1].min()
            x_max = points[:, 0].max()
            y_max = points[:, 1].max()

            x_center = (x_min + x_max) / 2 / w  # Normalize by image width
            y_center = (y_min + y_max) / 2 / h  # Normalize by image height
            width = (x_max - x_min) / w         # Normalize width
            height = (y_max - y_min) / h        # Normalize height

            labels.append([0, x_center, y_center, width, height])  # Assuming class_id = 0 for QR codes

            # Draw bounding box on the image
            if save_annotated:
                points = points.astype(int)
                cv2.polylines(image, [points], isClosed=True, color=(0, 255, 0), thickness=2)
                cv2.putText(image, f"QR {i}", tuple(points[0]), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
    else:
        print(f"No QR codes detected in {image_path}")

    # Save YOLO labels
    label_path = f"{output_dir}/labels/{image_name}.txt"
    with open(label_path, "w") as f:
        for label in labels:
            f.write(" ".join(map(str, label)) + "\n")
    print(f"Saved YOLO label file: {label_path}")

    # Save annotated image
    if save_annotated:
        annotated_image_path = f"{output_dir}/images/{image_name}_result.jpg"
        cv2.imwrite(annotated_image_path, image)
        print(f"Saved annotated image: {annotated_image_path}")