function wordy(problem)

    if !startswith(problem, "What is") && !endswith(problem, "?")
        throw(ArgumentError(""))
    end

    problem = replace(
        problem,
        "What is"       => "",
        "?"             => "",
        "plus"          => "+",
        "minus"         => "-",
        "multiplied by" => "*",
        "divided by"    => "/"
    )

    problem = split(problem, ' ')
    problem = filter(s -> s != "", problem)

    if isempty(problem) || (length(problem) % 2 == 0)
        throw(ArgumentError(""))
    end

    parsed_problem = []

    for i in eachindex(problem)
        if i % 2 == 0
            if (problem[i] == "+")
                push!(parsed_problem, +)
            elseif (problem[i] == "-")
                push!(parsed_problem, -)
            elseif (problem[i] == "*")
                push!(parsed_problem, *)
            elseif (problem[i] == "/")
                push!(parsed_problem, /)
            else
                throw(ArgumentError(""))
            end
        else
            push!(parsed_problem, tryparse(Int, problem[i]))
            if isnothing(parsed_problem[end])
                throw(ArgumentError(""))
            end
        end
    end

    answer::Int = parsed_problem[1]

    for i in eachindex(parsed_problem)
        if i % 2 == 0
            answer = parsed_problem[i](answer, parsed_problem[i+1])
        end
    end

    return answer
end
