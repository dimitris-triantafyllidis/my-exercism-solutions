struct InvalidPosition <: Exception

end

struct Queen
    r::Int
    c::Int
    Queen(r, c) = (c >= 0 && c < 8 && r >= 0 && r < 8) ? new(r, c) : throw(InvalidPosition())
end

function is_position_valid(q::Queen)
    return
end

function canattack(white::Queen, black::Queen)

    return (
        white.c == black.c ||
        white.r == black.r ||
        (abs(white.c - black.c) == abs(white.r - black.r))
    )

end
