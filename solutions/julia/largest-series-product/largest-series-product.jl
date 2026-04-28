function largest_product(str, span)

    if span < 0
        throw(ArgumentError(""))
    end

    if span > length(str)
        throw(ArgumentError(""))
    end

    if str == "" && span > 0
        throw(ArgumentError(""))
    end

    if !all(isdigit, str)
        throw(ArgumentError(""))
    end

    return maximum([reduce(*, map(c -> parse(Int, c), collect(str))[i:i+span-1]) for i in 1:length(str)-(span-1)])

end
