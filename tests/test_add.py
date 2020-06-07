# test_add.py
from src.calculator import add


def test_add():
    result = add(1, 1)
    assert result == 2


def test_add_failure():
    result = add(1, 1)
    assert result == 3
