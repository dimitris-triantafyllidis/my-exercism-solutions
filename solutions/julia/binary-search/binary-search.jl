# Change any of the following NamedTuple values to true to
# enable testing different bonus tasks
tested_bonus_tasks = (rev = false, by = false, lt = false, multiple_matches = false)

function binarysearch(numbers, n)

    if numbers == []
        return 1:0
    end

    min_idx = 1
    max_idx = length(numbers)

    if numbers[min_idx] == n
        return min_idx:min_idx
    elseif numbers[max_idx] == n
        return max_idx:max_idx
    end

    while true

        if max_idx - min_idx == 1
            return min_idx:0
        else
            candidate_idx = div((min_idx + max_idx), 2)
            if numbers[candidate_idx] == n
                return candidate_idx:candidate_idx
            elseif numbers[candidate_idx] < n
                min_idx = candidate_idx
            elseif numbers[candidate_idx] > n
                max_idx = candidate_idx
            end
        end

    end
end
