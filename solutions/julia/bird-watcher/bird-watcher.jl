function today(birds_per_day)
    return birds_per_day[7]
end

function increment_todays_count(birds_per_day)
    birds_per_day[7] += 1
    return birds_per_day
end

function has_day_without_birds(birds_per_day)
    for count in birds_per_day
        if count == 0
            return true
        end
    end
    return false
end

function count_for_first_days(birds_per_day, num_days)
    return sum(birds_per_day[1:num_days])
end

function busy_days(birds_per_day)
    return length(birds_per_day[birds_per_day .>= 5])
end

function average_per_day(week1, week2)
    return (week1 + week2) ./ 2
end
