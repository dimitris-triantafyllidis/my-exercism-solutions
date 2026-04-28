function rotate(n, c::Char)

    alphabet_rotated_lowercase = circshift(collect('a':'z'), -n)
    alphabet_rotated_uppercase = circshift(collect('A':'Z'), -n)

    return isletter(c) ? ( isuppercase(c) ? alphabet_rotated_uppercase[c + 1 - 'A'] : alphabet_rotated_lowercase[c + 1 - 'a'] ) : c
end

function rotate(n, str::String)
    return String([rotate(n, c) for c in str])
end
