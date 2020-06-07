#
def add(a, b):
    check_parameters(a, b)
    return a + b


def check_parameters(a, b):
    if not isinstance(a, (int, float)) or not isinstance(b, (int, float)):
        raise TypeError("Either input parameters must be int or float")
