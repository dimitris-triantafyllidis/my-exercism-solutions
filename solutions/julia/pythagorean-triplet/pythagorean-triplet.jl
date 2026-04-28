function pythagorean_triplets(n)

    triplets = []

    for a in 1:n
        for b in 1:n-a
            c = n - b - a
            if a < b && b < c && a^2 + b^2 == c^2
                push!(triplets, (a, b, c))
            end
        end
    end

    return triplets

end