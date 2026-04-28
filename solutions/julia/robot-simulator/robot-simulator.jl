const EAST  :: Int = 0
const NORTH :: Int = 1
const WEST  :: Int = 2
const SOUTH :: Int = 3

struct Point

    x::Int
    y::Int

    Point(x::Int, y::Int) = new(x, y)
    Point(p::NTuple{2, Int}) = new(p[1], p[2])

end

mutable struct Robot

    p::Point
    h::Int

    Robot(point::NTuple{2, Int}, heading::Int) = new(Point(point), heading)

end

position(r::Robot) = r.p
heading(r::Robot) = r.h

function turn_right!(r::Robot)
    r.h = r.h == 0 ? 3 : r.h - 1
    return r
end

function turn_left!(r::Robot)
    r.h = r.h == 3 ? 0 : r.h + 1
    return r
end

function advance!(r::Robot)

    if r.h == EAST
        r.p = Point(r.p.x + 1, r.p.y)
    elseif r.h == NORTH
        r.p = Point(r.p.x, r.p.y + 1)
    elseif r.h == WEST
        r.p = Point(r.p.x - 1, r.p.y)
    else
        r.p = Point(r.p.x, r.p.y - 1)
    end

    return r

end

function move!(r::Robot, instructions::String)

    for c in instructions
        if c == 'A' advance!(r)
        elseif c == 'L' turn_left!(r)
        elseif c == 'R' turn_right!(r)
        end
    end

    return r

end

