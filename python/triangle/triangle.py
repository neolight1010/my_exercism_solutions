from itertools import permutations


def is_triangle(sides: list[int]) -> bool:
    """
    Checks for the Triangle Inequality Theorem to
    determine if the sides form a triangle.
    """
    for a, b, c in permutations(sides):
        if a + b <= c:
            return False

    return True


def equilateral(sides: list[int]) -> bool:
    if not is_triangle(sides):
        return False
    return len(set(sides)) == 1


def isosceles(sides: list[int]) -> bool:
    if not is_triangle(sides):
        return False
    return len(set(sides)) <= 2


def scalene(sides: list[int]) -> bool:
    if not is_triangle(sides):
        return False
    return len(set(sides)) == 3
