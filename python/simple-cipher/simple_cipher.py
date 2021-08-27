from math import ceil
from random import randint
from typing import Literal


def char_pos(char: str) -> int:
    """
    Returns the position of `char` in the
    alphabet (0-base index).
    """
    if len(char) != 1:
        raise ValueError("char must be of length 1.")

    return ord(char) - ord("a")


def char_from_pos(pos: int) -> str:
    """
    Returns the char in the pos-th position
    in the alphabet (0-base index).
    """
    return chr(pos + ord("a"))


class Cipher:
    def __init__(self, key: str = None):
        if not key:
            key_chars: list[str] = []

            for _ in range(100):
                rand_char = char_from_pos(randint(char_pos("a"), char_pos("z")))
                key_chars.append(rand_char)

            key = "".join(key_chars)

        self.key = key

    def _ec_dc_(self, text: str, mode: Literal["encode", "decode"]):
        """Performs encoding or decoding depending on the value of
        `direction`."""
        long_key = self.key * ceil(len(text) / len(self.key))

        encoded = ""
        for key, char in zip(long_key, text):
            offset = char_pos(key)

            if mode == "decode":
                offset *= -1

            new_pos = (char_pos(char) + offset) % (char_pos("z") + 1)

            encoded += char_from_pos(new_pos)
        return encoded

    def encode(self, text: str) -> str:
        return self._ec_dc_(text, "encode")

    def decode(self, text: str) -> str:
        return self._ec_dc_(text, "decode")
