import pytest

def suma(a, b):
    return a + b

def test_suma():
    assert suma(1, 2) == 3
    assert suma(2, 3) == 5
    assert suma(3, 4) == 7

def test_suma_fail():
    assert suma(1, 2) == 4

print("test")

