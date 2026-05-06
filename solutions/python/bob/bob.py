def response(hey_bob):

    hey_bob = hey_bob.strip()

    is_silence       = hey_bob == ""
    is_question      = hey_bob.endswith('?') and (not hey_bob.startswith('?'))
    contains_letters = any(c.isalpha() for c in hey_bob)
    is_yelling       = contains_letters and hey_bob.upper() == hey_bob

    if is_silence:
        return "Fine. Be that way!"
    elif is_question and is_yelling:
        return "Calm down, I know what I'm doing!"
    elif is_question:
        return "Sure."
    elif is_yelling:
        return "Whoa, chill out!"
    else:
        return "Whatever."
