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

    palindromes: dict[int, list[list[int]]] = {} 
    for a, b in get_all_pairs(min_factor, max_factor):
        if is_palindrome(a * b):
            if a * b in palindromes:
                palindromes[a * b].append([a, b])
            else:
                palindromes[a * b] = [[a, b]]

    if palindromes:
        max_palindrome = max(palindromes.keys())
        return max_palindrome, palindromes[max_palindrome]

    return None, []


def smallest(min_factor: int, max_factor: int) -> tuple[Union[int, None], list[list[int]]]:
    if min_factor > max_factor:
        raise ValueError("min_factor must be greater than max_factor.")

    palindromes: dict[int, list[list[int]]] = {}
    for a, b in get_all_pairs(min_factor, max_factor):
        if is_palindrome(a * b):
            if a * b in palindromes:
                palindromes[a * b].append([a, b])
            else:
                palindromes[a * b] = [[a, b]]

    if palindromes:
        min_palindrome = min(palindromes.keys())

        return min_palindrome, palindromes[min_palindrome]

    return None, []
