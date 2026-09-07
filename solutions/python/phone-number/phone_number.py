class PhoneNumber:

    def __init__(self, raw):

        if any(c.isalpha() for c in raw):
            raise ValueError("letters not permitted")

        allowed = set("0123456789()+-. ")
        if any(not c.isalnum() and c not in allowed for c in raw):
            raise ValueError("punctuations not permitted")

        digits = "".join(c for c in raw if c.isdigit())

        if len(digits) < 10:
            raise ValueError("must not be fewer than 10 digits")
        if len(digits) > 11:
            raise ValueError("must not be greater than 11 digits")

        if len(digits) == 11:
            if digits[0] != "1":
                raise ValueError("11 digits must start with 1")
            digits = digits[1:]

        if digits[0] == "0":
            raise ValueError("area code cannot start with zero")
        if digits[0] == "1":
            raise ValueError("area code cannot start with one")

        if digits[3] == "0":
            raise ValueError("exchange code cannot start with zero")
        if digits[3] == "1":
            raise ValueError("exchange code cannot start with one")

        self.number = digits

    @property
    def area_code(self):
        return self.number[:3]

    def pretty(self):
        return f"({self.number[:3]})-{self.number[3:6]}-{self.number[6:]}"
