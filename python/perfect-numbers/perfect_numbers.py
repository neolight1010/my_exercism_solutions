from enum import Enum
from math import ceil
from typing import Set


class Categories(Enum):
    PERFECT = "perfect"
    ABUNDANT = "abundant"
    DEFICIENT = "deficient"


def get_factors(number: int) -> Set[int]:
    factors: Set[int] = set()

    for n in range(1, ceil(number ** (1/2))):
        if number != n and number % n == 0:
            factors.add(n)

            if (fac2 := int(number / n)) != number:
                factors.add(fac2)

    return factors


def classify(number: int):
    if number < 1:
        raise ValueError(
            f"Classification is only possible for positive integers.")

    factors = get_factors(number)
    aliquot = sum(factors)

    if aliquot == number:
        return Categories.PERFECT.value
    if aliquot > number:
        return Categories.ABUNDANT.value
    if aliquot < number:
        return Categories.DEFICIENT.value
