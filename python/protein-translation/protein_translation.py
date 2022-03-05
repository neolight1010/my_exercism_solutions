from enum import Enum


class Protein(Enum):
    METHIONINE = "Methionine"
    PHENYLALANINE = "Phenylalanine"
    LEUCINE = "Leucine"
    SERINE = "Serine"
    CYSTEINE = "Cysteine"
    TRYPTOPHAN = "Tryptophan"
    TYROSINE = "Tyrosine"
    STOP = "STOP"


CODON_PROTEINS = {
    "AUG": Protein.METHIONINE,
    "UUU": Protein.PHENYLALANINE,
    "UUC": Protein.PHENYLALANINE,
    "UUA": Protein.LEUCINE,
    "UUG": Protein.LEUCINE,
    "UCU": Protein.SERINE,
    "UCC": Protein.SERINE,
    "UCA": Protein.SERINE,
    "UCG": Protein.SERINE,
    "UAU": Protein.TYROSINE,
    "UAC": Protein.TYROSINE,
    "UGU": Protein.CYSTEINE,
    "UGC": Protein.CYSTEINE,
    "UGG": Protein.TRYPTOPHAN,
    "UAA": Protein.STOP,
    "UAG": Protein.STOP,
    "UGA": Protein.STOP,
}


def proteins(strand: str) -> list[str]:
    result: list[str] = []

    for i in range(0, len(strand), 3):
        codon = strand[i : i+3]
        translation = CODON_PROTEINS[codon]

        if translation == Protein.STOP:
            break

        result.append(translation.value)

    return result
