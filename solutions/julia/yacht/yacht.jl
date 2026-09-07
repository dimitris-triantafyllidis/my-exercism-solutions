function score(dice, category)
    if category == "ones"
        return sum(map(n -> n == 1 ? 1 : 0, dice))
    elseif category == "twos"
        return sum(map(n -> n == 2 ? 2 : 0, dice))
    elseif category == "threes"
        return sum(map(n -> n == 3 ? 3 : 0, dice))
    elseif category == "fours"
        return sum(map(n -> n == 4 ? 4 : 0, dice))
    elseif category == "fives"
        return sum(map(n -> n == 5 ? 5 : 0, dice))
    elseif category == "sixes"
        return sum(map(n -> n == 6 ? 6 : 0, dice))
    elseif category == "little straight" && Set(dice) == Set([1 2 3 4 5])
        return 30
    elseif category == "big straight" && Set(dice) == Set([2 3 4 5 6])
        return 30
    elseif category == "choice"
        return sum(dice)
    elseif category == "yacht" && length(Set(dice)) == 1
        return 50
    elseif category == "four of a kind"
        occur_dict = Dict(1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0)
        for f in dice
            occur_dict[f] += 1
        end
        occur_dict = filter(p -> p.second >= 4, occur_dict)
        if !isempty(occur_dict)
            return only(occur_dict).first * 4
        else
            return 0
        end
    elseif category == "full house"
        dice = sort(dice)
        if (((dice[1] == dice[2] == dice[3]) && (dice[4] == dice[5])) || ((dice[1] == dice[2]) && (dice[3] == dice[4] == dice[5]))) && length(Set(dice)) == 2
            return sum(dice)
        else
            return 0
        end
    else
        return 0
    end
end

