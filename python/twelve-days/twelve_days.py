def first_sentence(day: int) -> str:
    ordinal_numbers = ["first", "second", "third", "fourth", "fifth",
                       "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]

    return f"On the {ordinal_numbers[day - 1]} day of Christmas my true love gave to me: "


def recite(start_verse: int, end_verse: int) -> list[str]:
    if start_verse > end_verse:
        raise ValueError("start_verse must be less than or equal to end_verse.")

    if start_verse < 1:
        raise ValueError("start_verse must be an integer from 1 to 12.")

    if end_verse > 12:
        raise ValueError("end_verse must be an integer from 1 to 12.")

    gifts = [
        "a Partridge in a Pear Tree",
        "two Turtle Doves",
        "three French Hens",
        "four Calling Birds",
        "five Gold Rings",
        "six Geese-a-Laying",
        "seven Swans-a-Swimming",
        "eight Maids-a-Milking",
        "nine Ladies Dancing",
        "ten Lords-a-Leaping",
        "eleven Pipers Piping",
        "twelve Drummers Drumming"
    ]

    verse = first_sentence(start_verse)

    if start_verse > 1:
        verse += ", ".join(gifts[1:start_verse][::-1])
        verse += f", and {gifts[0]}."
    else:
        verse += gifts[0] + "."

    result = [verse]

    if start_verse == end_verse:
        return result

    result += recite(start_verse + 1, end_verse)
    return result
