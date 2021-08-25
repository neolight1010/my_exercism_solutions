def square(number: int) -> int:
    if number < 1 or number > 64:
        raise ValueError("number must be >= 1 and <= 64.")

    return 2 ** (number - 1)


def total() -> int:
    return sum([square(i) for i in range(1, 65)])
