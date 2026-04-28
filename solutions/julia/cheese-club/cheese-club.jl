function all_15(ratings)
    return length(filter(x -> x == 1 || x == 5, ratings)) == length(ratings)
end

function emphatics(customers)
    return Dict((c, r) for (c, r) in customers if all_15(r))
end

function tobinary(ratings)
    return map(x -> div(x, 5), ratings)
end

function tobinarymatrix(ratings)
    return map(x -> div(x, 5), reduce(vcat, map(transpose, ratings)))
end
