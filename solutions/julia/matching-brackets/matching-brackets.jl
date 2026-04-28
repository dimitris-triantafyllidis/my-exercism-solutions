function matching_brackets(input_string)

    input_string = filter(c -> c ∈ ['(' ')' '[' ']' '{' '}'], input_string)

    while true
        l = length(input_string)
        input_string = replace(input_string, "[]" => "", "()" => "", "{}" => "")
        if length(input_string) == l && length(input_string) != 0
            return false
        end
        if length(input_string) == 0
            return true
        end
    end

end
