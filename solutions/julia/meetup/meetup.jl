import Dates

function meetup(year, month, week, dayofweek)

    first = Dates.Date(year, month, 1)
    last  = Dates.lastdayofmonth(first)

    result = Dates.Date[]

    for d in first:last
        if Dates.dayname(d) == dayofweek
            push!(result, d)
        end
    end

    if week == "first"
        return result[1]
    elseif week == "second"
        return result[2]
    elseif week == "third"
        return result[3]
    elseif week == "fourth"
        return result[4]
    elseif week == "last"
        return result[end]
    elseif week == "teenth"
        return [date for date in result if Dates.dayofmonth(date) ∈ [13, 14, 15, 16, 17, 18, 19]][1]
    end

end
