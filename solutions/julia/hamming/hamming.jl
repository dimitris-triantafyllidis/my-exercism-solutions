"Your optional docstring here"
function distance(a, b)
    if length(a) == length(b)
        return length([(ai, bi) for (ai, bi) in zip(a, b) if (ai != bi)])
    else
        throw(ArgumentError(""))
    end
end
