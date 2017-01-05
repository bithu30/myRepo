import unittest
from Calculate import Calculate

class TestCalculate(unittest.TestCase):

    def setUp(self):
        self.calc = Calculate()

    def test_add_method_returns_correct(self):
        self.assertEqual(4,self.calc.add(2,2))

    def test_add_method_raises_error(self):
        self.assertRaises(TypeError,self.calc.add,"hello","world")

if __name__ == '__main__':

    unittest.main()