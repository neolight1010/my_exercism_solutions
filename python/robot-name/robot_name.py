import string
import random
from random import choice, randint


class Robot:
    def __init__(self):
        self.name: str
        self.reset()

    def reset(self) -> None:
        random.seed()

        alphabet = list(string.ascii_uppercase)
        
        new_name: str = choice(alphabet) + choice(alphabet)
        for _ in range(3):
            new_name += str(randint(0, 9))
        
        self.name = new_name
