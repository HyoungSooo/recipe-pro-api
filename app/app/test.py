"""
sample test
"""

from django.test import SimpleTestCase

from app import calc


class CalcTests(SimpleTestCase):

    def test_add_numbers(self):
        """test add two numbers"""
        self.assertEqual(4, calc.add(2, 2))
        self.assertEqual(10, calc.add(5, 5))

    def test_subtract_numbers(self):
        """test subtract two numbers"""
        self.assertEqual(2, calc.subtract(4, 2))
        self.assertEqual(5, calc.subtract(10, 5))
