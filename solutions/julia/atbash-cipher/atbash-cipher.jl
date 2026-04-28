function encode(input)
    input = filter(c -> !ispunct(c) && !isspace(c), lowercase(input))
    input = String([isnumeric(c) ? c : ('z' - c) % 26 + 'a' for c in input])
    input = join([input[i:min(i+5-1, end)] for i in 1:5:length(input)], " ")
    return input
end

function decode(input)
    input = filter(c -> !isspace(c), input)
    input = String([isnumeric(c) ? c : ('z' - c) % 26 + 'a' for c in input])
    return input
end

