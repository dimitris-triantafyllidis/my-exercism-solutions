function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3.0
    elseif juice == "All or Nothing"
        return 5.0
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    end
end

function limes_to_cut(needed, limes)
    n_limes_to_cut = 0
    n_wedges_needed = needed
    for lime in limes
        if n_wedges_needed > 0
            n_limes_to_cut = n_limes_to_cut + 1
            n_wedges_needed = n_wedges_needed - wedges_from_lime(lime)
        else
            return n_limes_to_cut
        end
    end
    return n_limes_to_cut
end

function order_times(orders)
    times = Float64[]
    for i in eachindex(orders)
       push!(times, time_to_mix_juice(orders[i]))
    end
    return times
end

function remaining_orders(time_left, orders)
    for i in eachindex(orders)
        if time_left > 0
            time_left = time_left - time_to_mix_juice(orders[i])
        else
            return orders[i : end]
        end
    end
    return []
end
