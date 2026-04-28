import Dates

function shared_birthday(birthdates)
    birthdates_month_day = [ (birthdate[6:7], birthdate[9:10]) for birthdate in birthdates]
    return length(unique(birthdates_month_day)) != length(birthdates)
end

function random_birthdates(groupsize)
    [rand(Dates.Date(2005, 1, 1):Dates.Day(1):Dates.Date(2005, 12, 31)) for i in 1:groupsize]
end

function estimate_probability_of_shared_birthday(groupsize)
    n_trials = 1000
    return count(b -> b == true, [shared_birthday(["1999-" * lpad(string(Dates.day(birthdate)), 2) * "-" * lpad(string(Dates.month(birthdate)), 2) for birthdate in random_birthdates(groupsize)]) for i in 1:n_trials ]) / n_trials
end
