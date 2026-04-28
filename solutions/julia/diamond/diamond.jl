function rows(letter)
    n = letter[1] - 'A' + 1
    quadrant = [ " "^m * ('A' + m) * " "^(n-m-1) for m in 0:n-1 ]
    top = [ reverse(s) * s[2:end] for s in quadrant ]
    return vcat(top, reverse(top)[2:end])
end

