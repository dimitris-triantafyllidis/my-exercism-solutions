function is_triangle(sides)
    return sides[1] + sides[2] > sides[3] && sides[2] + sides[3] > sides[1] && sides[3] + sides[1] > sides[2]
end

function is_equilateral(sides)
    return is_triangle(sides) && (sides[1] == sides[2]) && (sides[2] == sides[3])
end

function is_isosceles(sides)
    return is_triangle(sides) && (sides[1] == sides[2] || sides[2] == sides[3] || sides[3] == sides[1])
end

function is_scalene(sides)
    return is_triangle(sides) && !is_isosceles(sides) && !is_equilateral(sides)
end
