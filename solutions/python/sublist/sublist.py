SUBLIST = 0
SUPERLIST = 1
EQUAL = 2
UNEQUAL = 3

def sublist(list_one, list_two):
    if len(list_one) == len(list_two):
        if list_one == list_two:
            return EQUAL
        else:
            return UNEQUAL
    elif list_one == [] and list_two != []:
        return SUBLIST
    elif list_one != [] and list_two == []:
        return SUPERLIST
    elif len(list_one) < len(list_two):
        for i in range(0, len(list_two) - len(list_one) + 1):
            if list_two[i : i + len(list_one)] == list_one:
                return SUBLIST
    elif len(list_one) > len(list_two):
        for i in range(0, len(list_one) - len(list_two) + 1):
            if list_one[i : i + len(list_two)] == list_two:
                return SUPERLIST

    return UNEQUAL
