def factors(value: int, search_start: int = 2) -> list[int]:
    if value == 1:
        return []

    result: list[int] = []
    for i in range(search_start, value + 1):
        if value % i == 0:
            result += [i, *factors(value // i, i)]
            break

    return result
