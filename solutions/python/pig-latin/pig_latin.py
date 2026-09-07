vowels = ["a", "e", "i", "o", "u"]
consonants = [c for c in "abcdefghijklmnopqrstuvwxyz" if c not in vowels]

def initial_consonants(word):

    result = ""

    for i, ch in enumerate(word):
        if i < 1 and ch in consonants:
            result += ch
        elif ch in consonants and ch != "y":
            result += ch
        else:
            return result

    return result

def translate_word(word):

    ic = initial_consonants(word)

    if word[0] in vowels or word[:2] in ["xr", "yt"]:
        return word + "ay"

    if ic and ic[-1] == "q" and len(word) > len(ic) and word[len(ic)] == "u":
        return word[len(ic) + 1:] + ic + "uay"

    if ic and len(word) > len(ic) and word[len(ic)] == "y":
        return word[len(ic):] + ic + "ay"

    if word[0] in consonants:
        return word[len(ic):] + ic + "ay"

    return word

def translate(text):
    return " ".join(translate_word(w) for w in text.split())
