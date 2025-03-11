import unittest
from latest.search.search import linear_search, binary_search, two_crystal_balls

class TestSearchFunctions(unittest.TestCase):

    def test_linear_search(self):
        array = [2, 4, 6, 8, 10]
        
        self.assertEqual(linear_search(array, 6), 2)
        self.assertEqual(linear_search(array, 2), 0)
        self.assertEqual(linear_search(array, 10), 4)
        
        self.assertEqual(linear_search(array, 5), -1)
        self.assertEqual(linear_search(array, 11), -1)
        
        self.assertEqual(linear_search([], 3), -1)
        
        self.assertEqual(linear_search([7], 7), 0)
        self.assertEqual(linear_search([7], 2), -1)

    def test_binary_search(self):
        array = [1, 3, 5, 7, 9]
        
        self.assertEqual(binary_search(array, 5), 2)
        self.assertEqual(binary_search(array, 1), 0)
        self.assertEqual(binary_search(array, 9), 4)
        
        self.assertEqual(binary_search(array, 4), -1)
        self.assertEqual(binary_search(array, 10), -1)
        
        self.assertEqual(binary_search([], 3), -1)
        
        self.assertEqual(binary_search([5], 5), 0)
        self.assertEqual(binary_search([5], 1), -1)
    
    def test_two_crystal_balls(self):
        assert two_crystal_balls([False, False, False, True, True]) == 3
        assert two_crystal_balls([False] * 50 + [True] * 50) == 50
        assert two_crystal_balls([True] * 100) == 0
        assert two_crystal_balls([False] * 100) == -1

if __name__ == "__main__":
    unittest.main()
