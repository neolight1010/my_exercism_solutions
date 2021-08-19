from enum import Enum
from functools import reduce
from math import ceil


class Categories(Enum):
    PERFECT = "perfect"
    ABUNDANT = "abundant"
    DEFICIENT = "deficient"


def classify(number: int):
    if number < 1: raise ValueError(f"{number} is not a natural number.")

    factors = [0]

    for n in range(1, ceil(number ** (1/2))):
        if number != n and number % n == 0:
            factors += [n]

            if (fac2 := (number / n)) not in factors and fac2 != number:
                factors += [int(fac2)]
    
    aliquot = reduce(lambda x, y: x + y, factors)

    if aliquot == number: return Categories.PERFECT.value
    if aliquot > number: return Categories.ABUNDANT.value
    if aliquot < number: return Categories.DEFICIENT.value
