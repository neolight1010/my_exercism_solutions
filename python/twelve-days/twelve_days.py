ORDINAL_NUMBERS = ["first", "second", "third", "fourth", "fifth",
                   "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]


GIFTS = [
    "a Partridge in a Pear Tree.",
    "two Turtle Doves, and",
    "three French Hens,",
    "four Calling Birds,",
    "five Gold Rings,",
    "six Geese-a-Laying,",
    "seven Swans-a-Swimming,",
    "eight Maids-a-Milking,",
    "nine Ladies Dancing,",
    "ten Lords-a-Leaping,",
    "eleven Pipers Piping,",
    "twelve Drummers Drumming,"
]


def validate_day(day: int) -> None:
    if day < 1 or day > 12:
        raise ValueError("day number must be an integer from 1 to 12.")


def first_sentence(day: int) -> str:
    validate_day(day)

    return f"On the {ORDINAL_NUMBERS[day - 1]} day of Christmas my true love gave to me: "


def gift_list_sentence(day: int) -> str:
    validate_day(day)

    day_i = day - 1
    sentences: list[str] = GIFTS[day_i::-1]

    return " ".join(sentences)


def recite(start_verse: int, end_verse: int) -> list[str]:
    if start_verse > end_verse:
        raise ValueError("start_verse must be less than or equal to end_verse.")

    validate_day(start_verse)
    validate_day(end_verse)

    verse = first_sentence(start_verse)
    verse += gift_list_sentence(start_verse)

    result = [verse]

    if start_verse == end_verse:
        return result

    result += recite(start_verse + 1, end_verse)
    return result
