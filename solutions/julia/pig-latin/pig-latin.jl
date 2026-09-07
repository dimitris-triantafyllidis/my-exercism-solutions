using Base.Iterators

const vowels = ['a', 'e', 'i', 'o', 'u']

const consonants = [c for c in 'a':'z' if c ∉ vowels]

function initial_consonants(word)

    result = ""

    for i in eachindex(word)
        if i < 2 && word[i] ∈ consonants
            result *= word[i]
        elseif word[i] ∈ consonants && word[i] != 'y'
            result *= word[i]
        else
            return result
        end
    end

    return result

end

function translate_word(word)

    ic = initial_consonants(word)

    if word[1] ∈ vowels || (word[1:2] ∈ ["xr", "yt"])
        return word * "ay"
    elseif ic[end] == 'q' && length(word) > length(ic) && word[length(ic) + 1] == 'u'
        return word[length(ic) + 2:end] * ic * "uay"
    elseif length(ic) > 0 && length(word) > length(ic) && word[length(ic) + 1] == 'y'
        return word[length(ic) + 1 : end] * ic[1:end] * "ay"
    elseif word[1] ∈ consonants
        return word[length(ic) + 1 : end] * word[1 : length(ic)] * "ay"
    else
        return word
    end
end

function translate(phrase)
    return join([translate_word(word) for word in split(phrase)], " ")
end
