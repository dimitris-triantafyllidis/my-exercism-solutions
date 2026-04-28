import Dates
import Base: show, +, -

struct Clock

    h::Int
    m::Int

    function Clock(h::Int, m::Int)
        hn, mn = normalize_clock(h, m)
        return new(hn, mn)
    end

end

function normalize_clock(h, m)

    hours_to_add::Int = div(m, 60)
    minutes_to_add::Int = -hours_to_add * 60

    if m + minutes_to_add < 0
        minutes_to_add += 60
        hours_to_add -= 1
    end

    minutes_normalized = m + minutes_to_add
    hours_normalized = (h + hours_to_add) % 24

    if hours_normalized < 0
        hours_normalized += 24
    end

    return hours_normalized, minutes_normalized

end

+(c::Clock, m::Dates.Minute) = Clock(c.h, c.m + m.value)
-(c::Clock, m::Dates.Minute) = Clock(c.h, c.m - m.value)

function show(io::IO, c::Clock)
    h = lpad(c.h, 2, '0')
    m = lpad(c.m, 2, '0')
    print(io, "\"$h:$m\"")
end
