import Dates

function schedule_appointment(appointment::String)
    return Dates.DateTime(appointment, Dates.DateFormat("m/d/y H:M:S"))
end

function has_passed(appointment::DateTime)
    return Dates.now() > appointment
end

function is_afternoon_appointment(appointment::DateTime)
    return hour(appointment) >= 12 && hour(appointment) < 18
end

function describe(appointment::DateTime)
    return "You have an appointment on $(Dates.dayname(appointment)), $(Dates.monthname(appointment)) $(Dates.day(appointment)), $(Dates.year(appointment)) at $(Dates.format(appointment, "HH:MM"))"
end

function anniversary_date()
    return Dates.Date(Dates.year(Dates.now()), 9, 15)
end
