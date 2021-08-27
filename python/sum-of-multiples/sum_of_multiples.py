from itertools import count


def sum_of_multiples(limit: int, base_multiples: list[int]) -> int:
    base_multiples = [x for x in base_multiples if x != 0]
    if not base_multiples: return 0

    multiples: set[int] = set()

    for m in base_multiples:
        for n in count(1):
            product = m * n

            if product >= limit:
                break

            multiples.add(product)

    return sum(multiples)
