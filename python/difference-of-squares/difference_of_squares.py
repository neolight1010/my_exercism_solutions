def square_of_sum(number: int) -> int:
    # sum of natural numbers from 1 to number
    initial_sum = (number * (number + 1)) // 2
    return initial_sum ** 2


def sum_of_squares(number: int) -> int:
    result = 0

    for n in range(1, number + 1):
        result += n ** 2

    return result


def difference_of_squares(number: int) -> int:
    return square_of_sum(number) - sum_of_squares(number)
