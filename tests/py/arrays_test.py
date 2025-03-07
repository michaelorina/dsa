import unittest
from latest.arrays.arrays import static_array, dynamic_array 

class TestArrayFunctions(unittest.TestCase):

    def test_static_array(self):
        result = static_array()

        self.assertIsInstance(result, list)

        self.assertEqual(len(result), 5)
        
        self.assertTrue(all(x is None for x in result))

    def test_dynamic_array(self):
        result = dynamic_array()
        
        self.assertIsInstance(result, list)
        
        self.assertEqual(len(result), 5)
        
        self.assertTrue(all(x is None for x in result))

if __name__ == "__main__":
    unittest.main()
