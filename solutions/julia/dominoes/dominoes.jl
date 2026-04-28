function dominoes(stones)

    if isempty(stones)
        return true
    end

    if eltype(stones) <: Integer
        return stones[1] == stones[2]
    end

    for i in eachindex(stones)
        if build_chain([stones[i]], [stones[1:i-1];stones[i+1:end]])[1]
            return true
        elseif build_chain([reverse(stones[i])], [stones[1:i-1];stones[i+1:end]])[1]
            return true
        else
            continue
        end
    end
    return false
end

function build_chain(chain, rest)

    if rest == []
        return chain[end][2] == chain[1][1], chain
    end

    for i in eachindex(rest)
        if chain[end][2] == rest[i][1]
            attempt = build_chain([chain; [rest[i]]], [rest[1:i-1];rest[i+1:end]])
            if !attempt[1]
                continue
            else
                return attempt
            end
        elseif chain[end][2] == rest[i][2]
            attempt = build_chain([chain; [reverse(rest[i])]], [rest[1:i-1];rest[i+1:end]])
            if !attempt[1]
                continue
            else
                return attempt
            end
        end
    end

    return false, []

end
