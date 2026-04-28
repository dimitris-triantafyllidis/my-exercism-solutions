function recite(pieces)

    proverb = ""

    if pieces == []
        return ""
    end

    for i in eachindex(pieces[1:end-1])
        proverb *= "For want of a " * pieces[i] * " the " * pieces[i+1] * " was lost.\n"
    end

    proverb *= "And all for the want of a " * pieces[1] * "."

    return proverb

end
