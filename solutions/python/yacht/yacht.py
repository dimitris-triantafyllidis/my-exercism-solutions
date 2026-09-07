YACHT = object()
ONES = object()
TWOS = object()
THREES = object()
FOURS = object()
FIVES = object()
SIXES = object()
FULL_HOUSE = object()
FOUR_OF_A_KIND = object()
LITTLE_STRAIGHT = object()
BIG_STRAIGHT = object()
CHOICE = object()

def score(dice, category):

    if category == ONES:
        return sum(1 for n in dice if n == 1)
    elif category == TWOS:
        return sum(2 for n in dice if n == 2)
    elif category == THREES:
        return sum(3 for n in dice if n == 3)
    elif category == FOURS:
        return sum(4 for n in dice if n == 4)
    elif category == FIVES:
        return sum(5 for n in dice if n == 5)
    elif category == SIXES:
        return sum(6 for n in dice if n == 6)
    elif category == LITTLE_STRAIGHT and set(dice) == {1, 2, 3, 4, 5}:
        return 30
    elif category == BIG_STRAIGHT and set(dice) == {2, 3, 4, 5, 6}:
        return 30
    elif category == CHOICE:
        return sum(dice)
    elif category == YACHT and len(set(dice)) == 1:
        return 50
    elif category == FOUR_OF_A_KIND:
        counts = { n: dice.count(n) for n in range(1, 7) }
        for face, cnt in counts.items():
            if cnt >= 4:
                return face * 4
        return 0
    elif category == FULL_HOUSE:
        dice_sorted = sorted(dice)
        a, b, c, d, e = dice_sorted

        is_three_two = (
            (a == b == c and d == e) or
            (a == b and c == d == e)
        )

        if is_three_two and len(set(dice_sorted)) == 2:
            return sum(dice_sorted)
        else:
            return 0
    else:
        return 0
