function to_roman(number)

    if number <= 0 || number > 3999
        throw(ErrorException(string(number)))
    end

    roman = ""

    thousands = div(number, 1000)
    number = number - 1000 * thousands
    hundreds = div(number, 100)
    number = number - 100 * hundreds
    tens = div(number, 10)
    number = number - 10 * tens
    units = number

    # Thousands

    roman = roman * 'M'^thousands

    # Hundreds

    if hundreds == 9
        roman = roman * "CM"
    elseif hundreds == 4
        roman = roman * "CD"
    elseif hundreds >= 5
        roman = roman * 'D'
        roman = roman * 'C'^(hundreds - 5)
    elseif hundreds >= 1
        roman = roman * 'C'^(hundreds)
    end

    # Tens

    if tens == 9
        roman = roman * "XC"
    elseif tens == 4
        roman = roman * "XL"
    elseif tens >= 5
        roman = roman * 'L'
        roman = roman * 'X'^(tens - 5)
    elseif tens >= 1
        roman = roman * 'X'^(tens)
    end

    # Units

    if units == 9
        roman = roman * "IX"
    elseif units == 4
        roman = roman * "IV"
    elseif units >= 5
        roman = roman * 'V'
        roman = roman * 'I'^(units - 5)
    elseif units >= 1
        roman = roman * 'I'^(units)
    end

    return roman

end
