def is_armstrong_number(number):
    digits = [int(c) for c in str(number)]
    return sum(pow(digit, len(digits)) for digit in digits) == number
