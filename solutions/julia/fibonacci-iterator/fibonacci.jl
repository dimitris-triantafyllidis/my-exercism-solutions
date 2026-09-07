struct Fiberator
    N :: Int
end

# Implement `iterate` method(s)

function Base.iterate(f::Fiberator)
    return (1, (0, 1, 2))
end

function Base.iterate(f::Fiberator, s)
    if s[3] > f.N
        return nothing
    else
        return (s[1] + s[2], (s[2], s[1] + s[2], s[3] + 1))
    end
end

Base.length(f::Fiberator) = f.N

Base.eltype(::Type{Fiberator}) = Int
