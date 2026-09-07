def commands(binary_str):

    actions = []

    if binary_str[4] == "1":
        actions += ["wink"]
    if binary_str[3] == "1":
        actions += ["double blink"]
    if binary_str[2] == "1":
        actions += ["close your eyes"]
    if binary_str[1] == "1":
        actions += ["jump"]

    if binary_str[0] == "1":
        actions.reverse()

    return actions
