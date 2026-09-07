import Dates

function add_gigasecond(date::DateTime)
    return date + Dates.Second(1000000000)
end
