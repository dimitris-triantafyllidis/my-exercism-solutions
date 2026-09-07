function clean(phone_number)

    phone_number = filter(isdigit, phone_number)

    if length(phone_number) == 10 && phone_number[1] ∈ '2':'9' && phone_number[4] ∈ '2':'9'
        return phone_number
    elseif length(phone_number) == 11 && phone_number[1] == '1' && phone_number[2] ∈ '2':'9' && phone_number[5] ∈ '2':'9'
        return phone_number[2:end]
    else
        throw(ArgumentError(""))
    end

end

clean("(223) 456-7890")
