function acronym(phrase)

    phrase = filter(c -> isletter(c) || isspace(c) || c == '-', phrase)

    return join([uppercase(word[1]) for word in split(phrase, [' ', '-']) if word != ""])

end

