class Allergies:
    allergy_names = {
        1: "eggs",
        2: "peanuts",
        4: "shellfish",
        8: "strawberries",
        16: "tomatoes",
        32: "chocolate",
        64: "pollen",
        128: "cats"
    }

    def __init__(self, score: int):
        self.allergy_values: list[int] = [] # List of allergy values from score

        while score > sum(Allergies.allergy_names.keys()):
            score -= 256

        for n in sorted(Allergies.allergy_names.keys(), reverse=True):
            if score >= n:
                self.allergy_values.append(n)
                score -= n

    def allergic_to(self, item: str) -> bool:
        return item in self.lst

    @property
    def lst(self) -> list[str]:
        return [Allergies.allergy_names[value] for value in self.allergy_values]


print(Allergies(509).lst)
