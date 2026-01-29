import pytest

def multiplicar(a, b):
    return a * b

def test_multiplicar():
    assert multiplicar(2, 3) == 6
    assert multiplicar(5, 5) == 25