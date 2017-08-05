import faces

from skimage import data_dir
from os import path

def test_smoke():
    pass


def test_load_image():
    img = faces.load_image(path.join(data_dir, 'camera.png'))
    assert img.shape == (512, 512)

