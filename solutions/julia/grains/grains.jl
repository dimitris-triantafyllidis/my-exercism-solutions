"""Calculate the number of grains on square `square`."""
function on_square(square)
    if square < 1 || square > 64
        throw(DomainError(""))
    else
        return UInt128(2)^(square - 1)
    end
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    if square < 1 || square > 64
        throw(DomainError(""))
    else
        return sum([on_square(n) for n in 1:square])
    end
end
