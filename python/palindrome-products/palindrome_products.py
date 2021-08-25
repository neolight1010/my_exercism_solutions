from typing import Iterator, Union
from functools import reduce


def get_all_pairs(min_factor: int, max_factor: int) -> Iterator[tuple[int, int]]:
    for i in range(min_factor, max_factor + 1):
        for j in range(min_factor, max_factor + 1):
            yield (i, j)


def is_palindrome(number: int) -> bool:
    return str(number) == str(number)[::-1]


def largest(min_factor: int, max_factor: int) -> tuple[Union[int, None], list[list[int]]]:
    if min_factor > max_factor:
        raise ValueError("min_factor must be greater than max_factor.")

    factors: list[list[int]] = []

    palindromes: list[int] = []
    for a, b in get_all_pairs(min_factor, max_factor):
        if is_palindrome(a * b):
            palindromes.append(a * b)
            factors.append([a, b])

    if palindromes:
        max_palindrome = max(palindromes)
        max_factors = [fac for fac in factors if reduce(lambda x, y: x * y, fac) == max_palindrome]

        return max_palindrome, max_factors

    return None, []


def smallest(min_factor: int, max_factor: int) -> tuple[Union[int, None], list[list[int]]]:
    if min_factor > max_factor:
        raise ValueError("min_factor must be greater than max_factor.")

    factors: list[list[int]] = []

    palindromes: list[int] = []
    for a, b in get_all_pairs(min_factor, max_factor):
        if is_palindrome(a * b):
            palindromes.append(a * b)
            factors.append([a, b])

    if palindromes:
        min_palindrome = min(palindromes)
        min_factors = [fac for fac in factors if reduce(lambda x, y: x * y, fac) == min_palindrome]

        return min_palindrome, min_factors

    return None, []
