function maximum_value(maximum_weight, items)

    dp = zeros(Int, maximum_weight + 1)

    for item in items
        for w in maximum_weight:-1:item[1]
            candidate = dp[w - item[1] + 1] + item[2]
            if candidate > dp[w + 1]
                dp[w + 1] = candidate
            end
        end
    end

    return maximum(dp)

end
