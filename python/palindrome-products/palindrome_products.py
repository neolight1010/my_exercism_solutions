from typing import Any, Callable, Iterator, Union


Comparator = Callable[[Any, Any], bool]
"""
A Comparator comparates two objects according to the following criteria:
x > y: True
x <= y: False

The definition of "greater/less than" may be specific to the domain and is not
necessarily associated with its mathematical definition.
"""


def get_all_pairs(min_factor: int, max_factor: int) -> Iterator[tuple[int, int]]:
    for i in range(min_factor, max_factor + 1):
        for j in range(i, max_factor + 1):
            yield (i, j)


def is_palindrome(number: int) -> bool:
    return str(number) == str(number)[::-1]


def palindrome_products_with_compare(min_factor: int, max_factor: int, is_better: Comparator) -> tuple[Union[int, None], list[tuple[int, int]]]:
    if min_factor > max_factor:
        raise ValueError("min must be <= max")

    initial_best = -1

    best_palindrome: int = initial_best
    palindromes: dict[int, list[tuple[int, int]]] = {}

    for factors in get_all_pairs(min_factor, max_factor):
        product = factors[0] * factors[1]

        if is_palindrome(product):
            if is_better(product, best_palindrome) or best_palindrome == initial_best:
                best_palindrome = product

            if not product in palindromes:
                palindromes[product] = []

            palindromes[product].append(factors)

    if palindromes:
        return best_palindrome, palindromes[best_palindrome]

    return None, []


def largest(min_factor: int, max_factor: int) -> tuple[Union[int, None], list[tuple[int, int]]]:
    def is_larger(x, y): return x > y
    return palindrome_products_with_compare(min_factor, max_factor, is_larger)


def smallest(min_factor: int, max_factor: int) -> tuple[Union[int, None], list[tuple[int, int]]]:
    def is_smaller(x, y): return x < y
    return palindrome_products_with_compare(min_factor, max_factor, is_smaller)
