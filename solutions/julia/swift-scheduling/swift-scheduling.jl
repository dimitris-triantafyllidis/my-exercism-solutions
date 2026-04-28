using Dates

is_workday(d::Date) = dayofweek(d) ≤ 5

function first_workday_on_or_after(date::Date)
    dow = dayofweek(date)
    if dow ≤ 5
        return date
    else
        return date + Day(8 - dow)
    end
end

function last_workday_on_or_before(date::Date)
    dow = dayofweek(date)
    if dow ≤ 5
        return date
    else
        return date - Day(dow - 5)
    end
end

function first_workday_on_or_after(dt::DateTime)
    d  = Date(dt)
    t  = Time(dt)
    wd = first_workday_on_or_after(d)
    return DateTime(wd, t)
end

function last_workday_on_or_before(dt::DateTime)
    d  = Date(dt)
    t  = Time(dt)
    wd = last_workday_on_or_before(d)
    return DateTime(wd, t)
end

function days_in_month(year::Int, month::Int)
    first_next = (month == 12) ?
        Date(year + 1, 1, 1) :
        Date(year, month + 1, 1)

    return day(first_next - Day(1))
end

function delivery_date(start, description)

    dt = DateTime(start, dateformat"yyyy-mm-ddTHH:MM:SS")

    if description == "NOW"
        dt = dt + Hour(2)
    elseif description == "ASAP" && hour(dt) < 13
        dt = dt + (Hour(17 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif description == "ASAP" && hour(dt) >= 13
        dt = dt + Day(1)
        dt = dt + (Hour(13 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif description == "EOW" && dayname(dt) == "Monday"
        dt = dt + Day(4)
        dt = dt + (Hour(17 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif description == "EOW" && dayname(dt) == "Tuesday"
        dt = dt + Day(3)
        dt = dt + (Hour(17 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif description == "EOW" && dayname(dt) == "Wednesday"
        dt = dt + Day(2)
        dt = dt + (Hour(17 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif description == "EOW" && dayname(dt) == "Thursday"
        dt = dt + Day(3)
        dt = dt + (Hour(20 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif description == "EOW" && dayname(dt) == "Friday"
        dt = dt + Day(2)
        dt = dt + (Hour(20 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif contains(description, "Q")
        q = parse(Int, description[2:2])
        if quarterofyear(dt) <= q
            dt = last_workday_on_or_before(DateTime(year(dt), q * 3, days_in_month(year(dt), q * 3) , 8, 0, 0))
        else
            dt = last_workday_on_or_before(DateTime(year(dt) + 1, q * 3, days_in_month(year(dt) + 1, q * 3), 8, 0, 0))
        end
        dt = dt + (Hour(8 - hour(dt)))
        dt = dt - Minute(minute(dt))
        dt = dt - Second(second(dt))
    elseif contains(description, "M")
        m = parse(Int, description[1:end-1])
        if month(dt) < m
            dt = first_workday_on_or_after(DateTime(year(dt), m, 1, 8, 0, 0))
        else
            dt = first_workday_on_or_after(DateTime(year(dt) + 1, m, 1, 8, 0, 0))
        end
    end

    Dates.format(dt, "yyyy-mm-ddTHH:MM:SS")

end
