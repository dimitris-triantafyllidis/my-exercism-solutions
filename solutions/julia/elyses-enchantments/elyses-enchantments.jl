get_item(stack, position) = stack[position]

function set_item!(stack, position, replacement_card)
    stack[position] = replacement_card
    return stack
end

function insert_item_at_top!(stack, new_card)
    push!(stack, new_card)
    return stack
end

function remove_item!(stack, position)
    deleteat!(stack, position)
    return stack
end

function remove_item_from_top!(stack)
    deleteat!(stack, length(stack))
    return stack
end

function insert_item_at_bottom!(stack, new_card)
    insert!(stack, 1, new_card)
    return stack
end

function remove_item_at_bottom!(stack)
    deleteat!(stack, 1)
    return stack
end

function check_size_of_stack(stack, stack_size)
    return length(stack) == stack_size
end
