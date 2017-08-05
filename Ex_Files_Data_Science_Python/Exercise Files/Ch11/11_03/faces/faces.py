"""Face detection (even with glasses)"""

import cv2

def load_image(path):
    """Load image from path, return in grayscale"""
    img = cv2.imread(path)
    return cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
