def is_valid(isbn: str) -> bool:
    temp_isbn = "".join([x for i, x in enumerate(
        isbn) if x.isdigit() or (x == "X" and i == len(isbn) - 1)])

    clean = [int(x) if x.isdigit() else 10 for x in temp_isbn]

    if len(clean) != 10:
        return False

    check_sum = 0
    for x, n in zip(clean, range(10, 0, -1)):
        check_sum += x * n

    return check_sum % 11 == 0
