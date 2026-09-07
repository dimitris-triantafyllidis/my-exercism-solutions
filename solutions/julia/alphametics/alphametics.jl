include("permutations.jl")

function word_to_int(word::String, mapping::Dict{Char, Int})::Int
    sum::Int = 0
    for (i, c) in enumerate(word)
        sum += mapping[c] * 10^(length(word) - i)
    end
    sum
end

function try_substitution(addend_words::Vector{String}, result_word::String, candidate_mapping::Dict{Char, Int})::Bool

    for word in addend_words
        if candidate_mapping[word[1]] == 0
            return false
        end
    end

    if candidate_mapping[result_word[1]] == 0
        return false
    end

    addends_sum  = sum(word_to_int(word, candidate_mapping) for word in addend_words)
    result_value = word_to_int(result_word, candidate_mapping)

    return addends_sum == result_value

end

function solve(input_string::String)

    words        :: Vector{String} = collect(filter(s -> s != "+" && s != "==", collect(eachsplit(input_string))))
    letter_set   :: Set{Char}      = Set(l for word in words for l in word)
    result_word  :: String         = words[end]
    addend_words :: Vector{String} = words[1:end-1]
    letter_array ::Vector{Char}    = [c for c in letter_set]

    for substitutions_array in permutations(0:9, length(letter_array))
        candidate_mapping = Dict{Char, Int}(zip(letter_array, substitutions_array))
        if try_substitution(addend_words, result_word, candidate_mapping)
            return candidate_mapping
        end
    end

    nothing

end
