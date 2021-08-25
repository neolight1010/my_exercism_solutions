from itertools import count


def steps(number: int) -> int: 
    if number < 1:
        raise ValueError("Number must be a positive integer.")
    
    for i in count():
        if number == 1:
            return i

        if number % 2 == 0:
            number //= 2
        else:
            number = (3 * number) + 1

    # If Collatz Conjecture is right, then there is no
    # way this function returns -1
    return -1
