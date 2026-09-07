function create_inventory(items)
    inventory = Dict(item => 0 for item in items)
    for item ∈ items
        inventory[item] += 1
    end
    return inventory
end

function add_items(inventory, items)
    for item ∈ items
        if haskey(inventory, item)
            inventory[item] += 1
        else
            inventory[item] = 1
        end
    end
    return inventory
end

function decrement_items(inventory, items)
    for item ∈ items
        if haskey(inventory, item)
            if inventory[item] > 0
                inventory[item] -= 1
            end
        end
    end
    return inventory
end

function remove_item(inventory, item)
    delete!(inventory, item)
    return inventory
end

function list_inventory(inventory)

    return sort([k => v for (k, v) in inventory if v > 0], by = first)

end
