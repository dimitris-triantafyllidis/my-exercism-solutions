struct Tree
    root::String
    left::Union{Tree, Nothing}
    right::Union{Tree, Nothing}
end

function tree_from_traversals(preorder::Vector{String}, inorder::Vector{String})

    if length(preorder) != length(inorder)
        throw(ArgumentError(""))
    end

    if length(Set(inorder)) != length(inorder) || length(Set(preorder)) != length(preorder)
        throw(ArgumentError(""))
    end

    if sort(inorder) != sort(preorder)
        throw(ArgumentError(""))
    end

    isempty(preorder) && return nothing

    root = preorder[1]

    idx = findfirst(==(root), inorder)

    left_in  = inorder[1:idx-1]
    right_in = inorder[idx+1:end]

    k = length(left_in)

    left_pre  = preorder[2:1+k]
    right_pre = preorder[2+k:end]

    left_subtree  = tree_from_traversals(left_pre, left_in)
    right_subtree = tree_from_traversals(right_pre, right_in)

    return Tree(root, left_subtree, right_subtree)

end
