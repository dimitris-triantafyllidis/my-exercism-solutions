import Base: in

mutable struct BinarySearchTree
    data::Union{Int, Nothing}
    left::Union{BinarySearchTree, Nothing}
    right::Union{BinarySearchTree, Nothing}

    BinarySearchTree() = new(nothing, nothing, nothing)
    BinarySearchTree(data::Int) = new(data, nothing, nothing)

end

function BinarySearchTree(data::Vector{Int})

    tree = BinarySearchTree()

    for value in data
        push!(tree, value)
    end

    return tree

end

function push!(tree::BinarySearchTree, value::Int)

    if isnothing(nodedata(tree))
        tree.data = value
    elseif value <= nodedata(tree)
        if !isnothing(leftnode(tree))
            push!(leftnode(tree), value)
        else
            tree.left = BinarySearchTree(value)
        end
    else
        if !isnothing(rightnode(tree))
            push!(rightnode(tree), value)
        else
            tree.right = BinarySearchTree(value)
        end
    end

end

function in(value::Int, tree::BinarySearchTree)

    if isnothing(nodedata(tree))
        return false
    elseif value == nodedata(tree)
        return true
    elseif value < nodedata(tree)
        if !isnothing(leftnode(tree))
            return value in leftnode(tree)
        else
            return false
        end
    else
        if !isnothing(rightnode(tree))
            return value in rightnode(tree)
        else
            return false
        end
    end

end

function sort(tree::BinarySearchTree)

    if isnothing(leftnode(tree)) && isnothing(rightnode(tree))
        return [nodedata(tree)]
    elseif isnothing(leftnode(tree))
        return vcat([nodedata(tree)], sort(rightnode(tree)))
    elseif isnothing(rightnode(tree))
        return vcat(sort(leftnode(tree)), [nodedata(tree)])
    else
        return vcat(sort(leftnode(tree)), [nodedata(tree)], sort(rightnode(tree)))
    end

end

nodedata(tree::BinarySearchTree) = tree.data
rightnode(tree::BinarySearchTree) = tree.right
leftnode(tree::BinarySearchTree) = tree.left
