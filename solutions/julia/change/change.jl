function change(coins, target)

    if target == 0
        return []
    end

    if isempty(coins)
        throw(DomainError(""))
    end

    if target < coins[1]
        throw(DomainError(""))
    end

    dp = vcat([[]], [nothing for _ in 0:target])

    for coin in coins
        for t in coin:target
            current_solution = dp[t - coin + 1]
            if !isnothing(current_solution)
                candidate = vcat(current_solution, [coin])
                if isnothing(dp[t + 1]) || length(candidate) <= length(dp[t + 1])
                    dp[t + 1] = candidate
                end
            end
        end
    end

    result = dp[target + 1]

    if isnothing(result)
        throw(DomainError(""))
    end

    return result

end
