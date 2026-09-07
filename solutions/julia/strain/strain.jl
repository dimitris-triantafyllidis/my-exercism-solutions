function keep(values, predicate)

    filtered = []

    for value in values
        if predicate(value) == true
            push!(filtered, value)
        end
    end

    return filtered

end

function discard(values, predicate)

    return keep(values, value -> !predicate(value))

end
