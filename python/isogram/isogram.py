def is_isogram(string: str) -> bool:
    string = string.lower()

    found_ch: list[str] = []

    for ch in string:
        if ch in found_ch:
            return False

        if ch.isalpha():
            found_ch.append(ch)

    return True
