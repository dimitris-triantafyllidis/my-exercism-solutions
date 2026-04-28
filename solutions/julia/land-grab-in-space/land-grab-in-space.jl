struct Coord
    x::UInt16
    y::UInt16
end

@kwdef struct Plot
    bottom_left::Coord
    top_right::Coord
end

function is_claim_staked(claim::Plot, register::Set{Plot})
    return claim ∈ register
end

function stake_claim!(claim::Plot, register::Set{Plot})
    if is_claim_staked(claim, register)
        return false
    else
        push!(register, claim)
        return true
    end
end

function get_longest_side(claim::Plot)
    return max(claim.top_right.x - claim.bottom_left.x, claim.top_right.y - claim.bottom_left.y)
end

function get_claim_with_longest_side(register::Set{Plot})
    ranking = sort([(c, get_longest_side(c)) for c in register], by = x -> x[2], rev=true)
    return Set(c[1] for c in ranking if c[2] == ranking[1][2])
end
