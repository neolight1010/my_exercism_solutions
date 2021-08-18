def convert(number: int) -> str:
    result = ""

    result += "Pling" if number % 3 == 0 else ""
    result += "Plang" if number % 5 == 0 else ""
    result += "Plong" if number % 7 == 0 else ""

    return result if result else str(number)
