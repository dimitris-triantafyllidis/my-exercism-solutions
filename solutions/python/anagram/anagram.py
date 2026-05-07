def find_anagrams(word, candidates):

    anagrams = []

    for candidate in candidates:
        if ((candidate.lower() != word.lower()) and ("".join(sorted(candidate.lower())) == "".join(sorted(word.lower())))):
            anagrams += [candidate]

    return anagrams
