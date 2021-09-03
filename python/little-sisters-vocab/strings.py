import re


def add_prefix_un(word: str) -> str:
    '''

    :param word: str of a root word
    :return:  str of root word with un prefix

    This function takes `word` as a parameter and
    returns a new word with an 'un' prefix.
    '''
    return "un" + word


def make_word_groups(vocab_words: list[str]) -> str:
    '''

    :param vocab_words: list of vocabulary words with a prefix
                        in the form [prefix, word1, word2, ...]
    :return: str of prefix followed by vocabulary words with
             prefix applied, separated by ' :: '.

    This function takes a `vocab_words` list and returns a string
    with the prefix  and the words with prefix applied, separated
     by ' :: '.
    '''
    prefix = vocab_words[0]
    return f"{prefix} :: " + " :: ".join([prefix + word for word in vocab_words[1:]])


def remove_suffix_ness(word) -> str:
    '''

    :param word: str of word to remove suffix from.
    :return: str of word with suffix removed & spelling adjusted.

    This function takes in a word and returns the base word with `ness` removed.
    '''
    VOWELS = set(['a', 'e', 'i', 'o', 'u'])
    ness_len = len("ness")

    if word[-ness_len:] != "ness":
        raise ValueError("Word must end in 'ness'.")

    root_word = word[:-ness_len]

    if root_word[-1] == 'i' and root_word[-2] not in VOWELS:
        root_word = root_word[:-1] + "y"

    return root_word


def noun_to_verb(sentence: str, index: int):
    '''

    :param sentence: str that uses the word in sentence
    :param index:  index of the word to remove and transform
    :return:  str word that changes the extracted adjective to a verb.

    A function takes a `sentence` using the
    vocabulary word, and the `index` of the word once that sentence
    is split apart.  The function should return the extracted
    adjective as a verb.
    '''
    clean_sentence = re.sub(r"[^\w\s]", '', sentence)

    return clean_sentence.split()[index] + "en"

