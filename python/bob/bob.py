def response(hey_bob: str) -> str:
    hey_bob = hey_bob.strip()

    if not hey_bob: return "Fine. Be that way!"

    if hey_bob[-1] == "?":
        # If hey_bob is a question.
        if hey_bob.isupper():
            return "Calm down, I know what I'm doing!"

        return "Sure."

    if hey_bob.isupper():
        return "Whoa, chill out!"

    return "Whatever."
