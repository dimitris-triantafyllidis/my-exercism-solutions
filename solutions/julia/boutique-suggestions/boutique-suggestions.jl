function clothingitem(categories, qualities)
    return Dict(i for i in zip(categories, qualities))
end

function get_combinations(tops, bottoms)
    return [(t, b) for t in tops, b in bottoms]
end

function get_prices(combos)
    return [combo[1]["price"] + combo[2]["price"] for combo in combos]
end

function filter_clashing(combos)
    return [combo for combo in combos if combo[1]["base_color"] != combo[2]["base_color"]]
end
