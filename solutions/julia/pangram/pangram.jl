"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    length(intersect(Set(c for c in lowercase(input)), Set(l for l in 'a':'z')))== 26
end

