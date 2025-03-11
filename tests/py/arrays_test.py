import unittest
from latest.arrays.arrays import array

class TestArrayFunction(unittest.TestCase):

    def test_array(self):
        result = array()
        
        self.assertIsInstance(result, list)
        self.assertEqual(len(result), 5)       
        self.assertTrue(all(x is None for x in result))

if __name__ == "__main__":
    unittest.main()
