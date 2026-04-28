function additems!(cart, items)
    for item in items
        if haskey(cart, item)
            cart[item] += 1
        else
            cart[item] = 1
        end
    end
    return cart
end

function update_recipes!(ideas, updates)
    for (k, v) in updates
        ideas[k] = v
    end
    return ideas
end

function send_to_store(cart, aislecodes)

    fulfillment_cart = Dict()

    for item in cart
        if haskey(fulfillment_cart, aislecodes[item[1]])
            fulfillment_cart[aislecodes[item[1]]] += item[2]
        else
            fulfillment_cart[aislecodes[item[1]]] = item[2]
        end
    end

    return sort([x for x in fulfillment_cart])
end

function update_store_inventory!(inventory, cart)
    for item in cart
        inventory[item[1]] -= item[2]
        if inventory[item[1]] < 0
            inventory[item[1]] = 0
        end
    end
    return Dict(x for x in inventory if x[2] == 0)
end

function reorder!(outofstock, stock)
    for item in outofstock
        if haskey(stock, item[1])
            outofstock[item[1]] = stock[item[1]]
        else
            outofstock[item[1]] = 100
        end
    end
    return outofstock
end
