def find_anagrams(word: str, candidates: list[str]):
    anagrams: list[str] = []

    for candidate in candidates:
        is_same_word = candidate.lower() == word.lower()

        if sorted(candidate.lower()) == sorted(word.lower()) and not is_same_word:
            anagrams.append(candidate)
    
    return anagrams
