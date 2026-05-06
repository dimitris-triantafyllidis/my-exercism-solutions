def is_triangle(sides):
    a, b, c = sides
    return (a != 0) and (b != 0) and (c != 0) and (a + b > c) and (b + c > a) and (c + a > b)

def equilateral(sides):
    a, b, c = sides
    return is_triangle(sides) and (a == b == c)

def isosceles(sides):
    a, b, c = sides
    return is_triangle(sides) and ((a == b) or (b == c) or (c == a))

def scalene(sides):
    a, b, c = sides
    return is_triangle(sides) and (not equilateral(sides)) and (not isosceles(sides))
