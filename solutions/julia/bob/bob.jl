function bob(stimulus)

    stimulus = strip(stimulus)

    is_silence       = stimulus == ""
    is_question      = endswith(stimulus, '?') && !startswith(stimulus, '?')
    contains_letters = !isempty(filter(isletter, stimulus))
    is_yelling       = contains_letters && (uppercase(stimulus) == stimulus)

    if is_silence
        return "Fine. Be that way!"
    elseif is_question && is_yelling
        return "Calm down, I know what I'm doing!"
    elseif is_question
        return "Sure."
    elseif is_yelling
        return "Whoa, chill out!"
    else
        return "Whatever."
    end

end
