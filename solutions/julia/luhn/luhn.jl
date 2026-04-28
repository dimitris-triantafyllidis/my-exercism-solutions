function luhn(cardnum)

    cardnum = filter(!isspace, cardnum)

    for c in cardnum
        if !isdigit(c)
            return false
        end
    end

    if length(cardnum) <= 1
        return false
    else
        cardnum = reverse(cardnum)

        odd = cardnum[1:2:end]
        even = cardnum[2:2:end]

        even = map(c -> Char('0' + (parse(Int, c) * 2 > 9 ? parse(Int, c) * 2 - 9 : parse(Int, c) * 2 )), even)

        if (sum([parse(Int, c) for c in odd]) + sum([parse(Int, c) for c in even])) % 10 == 0
            return true
        else
            return false
        end
    end
end

