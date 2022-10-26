"""
arquivp de testa do modulocArea
"""
import unittest
from cArea import area

class TestArea(unittest.TestCase):
    def test_area_poritivo(self):
        ar = area(10,10)
        self.assertEqual(ar,100)

if __name__ == '__main__':
    