def is_pangram(sentence):
    letters = { c.lower() for c in sentence if c.isalpha() }
    return len(letters) == 26
