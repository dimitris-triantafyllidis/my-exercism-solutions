function cleanupname(name)
    return (strip ∘ replace)(name, "-" => " ")
end

function firstletter(name)
    return cleanupname(name)[1:1]
end

function initial(name)
    return (uppercase ∘ firstletter ∘ cleanupname)(name) * "."
end

function couple(name1, name2)
    return "❤ " * initial(name1) * "  +  " * initial(name2) * " ❤"
end
