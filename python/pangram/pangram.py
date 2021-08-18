def get_alphabet() -> list[str]:
    return [chr(u) for u in range(ord("a"), ord("a") + 26)]

def is_pangram(sentence: str) -> bool:
    sentence = sentence.lower()

    alphabet = get_alphabet()
    for c in alphabet:
        if c not in sentence: return False

    return True
