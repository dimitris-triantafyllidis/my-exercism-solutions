class Luhn:

    card_num = 0

    def __init__(self, card_num):
        self.card_num = card_num

    def valid(self):

        f = [c for c in self.card_num if not c.isspace()]

        for c in f:
            if not c.isdigit():
                return False

        if len(f) <= 1:
            return False
        else:
            odd = f[-1::-2]
            even = f[-2::-2]

            odd_ints = [int(c) for c in odd]
            even_ints = [int(c) for c in even]

            for i in range(0, len(even_ints)):
                if (2 * even_ints[i]) > 9:
                    even_ints[i] = 2 * even_ints[i] - 9
                else:
                    even_ints[i] = 2 * even_ints[i]

            return (sum(odd_ints) + sum(even_ints)) % 10 == 0
