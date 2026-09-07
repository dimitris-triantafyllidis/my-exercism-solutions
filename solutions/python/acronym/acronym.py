def abbreviate(phrase):

    words = "".join([c for c in phrase if c.isalpha() or c.isspace() or c == "-"])

    words = words.replace("-", " ")
    words = words.split()

    return "".join([word[0].upper() for word in words])
