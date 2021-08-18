from functools import reduce


def is_armstrong_number(number: int) -> bool:
    digits = [int(x) for x in str(number)]
    n = len(digits)  # Number of digits

    return number == reduce(lambda x, y: x + y,
                            map(lambda x: x**n, digits))
