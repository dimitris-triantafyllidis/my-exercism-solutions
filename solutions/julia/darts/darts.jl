function score(x, y)
    r = sqrt(x^2 + y^2)

    if r > 10
        return 0
    elseif r > 5
        return 1
    elseif r > 1
        return 5
    else
        return 10
    end
end
