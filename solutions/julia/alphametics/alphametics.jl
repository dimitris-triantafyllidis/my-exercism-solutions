include("permutations.jl")

function try_substitution(addend_words, result_word, candidate_mapping)

    for word in addend_words
        if candidate_mapping[word[1]] == 0
            return false
        end
    end

    if candidate_mapping[result_word[1]] == 0
        return false
    end

    word_to_int(word) = parse(Int, join(string(candidate_mapping[c]) for c in word))
    addends_sum       = sum(word_to_int(word) for word in addend_words)
    result_value      = word_to_int(result_word)

    return addends_sum == result_value

end

function solve(input_string)

    words        = collect(filter(s -> s != "+" && s != "==", collect(eachsplit(input_string))))
    letter_set   = Set(l for word in words for l in word)
    result_word  = words[end]
    addend_words = words[1:end-1]

    letter_array = [c for c in letter_set]

    for substitutions_array in permutations(0:9, length(letter_array))
        candidate_mapping = Dict(zip(letter_array, substitutions_array))
        if try_substitution(addend_words, result_word, candidate_mapping)
            return candidate_mapping
        end
    end

    nothing

end
