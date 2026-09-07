function demote(n)
    if n isa Float64
        return UInt8(ceil(n))
    elseif n isa Integer
        return Int8(n)
    else
        throw(MethodError(demote, (n,)))
    end
end

function preprocess(coll)
    if coll isa AbstractVector{<: Number}
        return reverse([demote(n) for n in coll])
    elseif coll isa AbstractSet{<: Number}
        return sort([demote(n) for n in coll], rev=true)
    else
        throw(MethodError(preprocess, (coll,)))
    end
end
