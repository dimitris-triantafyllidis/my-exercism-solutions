function raindrops(number)
    sounds = ""

    if number % 3 == 0
        sounds *= "Pling"
    end

    if number % 5 == 0
        sounds *= "Plang"
    end

    if number % 7 == 0
        sounds *= "Plong"
    end

    if sounds == ""
        sounds = string(number)
    end

    return sounds
end
