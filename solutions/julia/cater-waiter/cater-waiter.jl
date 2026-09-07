function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    if length(intersect(drink_ingredients, ALCOHOLS)) > 0
        return drink_name * " Cocktail"
    else
        return drink_name * " Mocktail"
    end
end

function categorize_dish(dish_name, dish_ingredients)
    if issubset(dish_ingredients, VEGAN)
        return dish_name * ": VEGAN"
    elseif issubset(dish_ingredients, VEGETARIAN)
        return dish_name * ": VEGETARIAN"
    elseif issubset(dish_ingredients, PALEO)
        return dish_name * ": PALEO"
    elseif issubset(dish_ingredients, KETO)
        return dish_name * ": KETO"
    elseif issubset(dish_ingredients, OMNIVORE)
        return dish_name * ": OMNIVORE"
    end
end

function tag_special_ingredients(dish)
    return (dish[1], intersect(Set(dish[2]), SPECIAL_INGREDIENTS))
end

function compile_ingredients(dishes)
    master_list = Set()
    for dish in dishes
        master_list = union(master_list, dish)
    end
    return master_list
end

function separate_appetizers(dishes, appetizers)
    return [dish for dish in setdiff(Set(dishes), Set(appetizers))]
end

function singleton_ingredients(dishes, intersection)
    si = Set()

    for dish in dishes
        si = union(si, setdiff(dish, intersection))
    end

    return si
end
