def is_isogram(string: str) -> bool:
    found_letters: list[str] = []

    for letter in string:
        letter = letter.lower()

        if letter in found_letters:
            return False

        if letter != " " and letter != "-":
            found_letters.append(letter)

    return True
