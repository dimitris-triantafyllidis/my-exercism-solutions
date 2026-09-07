mutable struct CircularBuffer{T}

    e::Vector{T}

    n::Int # number of occupied slots
    f::Int # index of the oldest element

    function CircularBuffer{T}(capacity::Integer) where {T}
        if capacity < 1
            throw(DomainError(""))
        else
            new(Vector{T}(undef, capacity), 0, 1)
        end
    end

end

function capacity(cb::CircularBuffer)
    return length(cb.e)
end

function isfull(cb::CircularBuffer)
    return cb.n == capacity(cb)
end

function isempty(cb::CircularBuffer)
    return cb.n == 0
end

function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    if isfull(cb)
        if !overwrite
            throw(BoundsError())
        else
            cb.e[cb.f] = item
            if cb.f == capacity(cb)
                cb.f = 1
            else
                cb.f = cb.f + 1
            end
        end
    else
        cb.e[(cb.f + cb.n - 1) % capacity(cb) + 1] = item
        cb.n = cb.n + 1
    end
    return cb
end

function Base.popfirst!(cb::CircularBuffer)
    if isempty(cb)
        throw(BoundsError())
    else
        value = cb.e[cb.f]
        cb.n = cb.n - 1
        if cb.f == capacity(cb)
            cb.f = 1
        else
            cb.f = cb.f + 1
        end
        return value
    end
end

function Base.empty!(cb::CircularBuffer)
    cb.n = 0
    return cb
end

        cb = CircularBuffer{Int}(2)
        empty!(cb) === cb
        push!(cb, 1; overwrite=true) === cb
        push!(cb, 2; overwrite=true) === cb
        push!(cb, 4; overwrite=true) === cb
        popfirst!(cb) == 2
        popfirst!(cb) == 4
