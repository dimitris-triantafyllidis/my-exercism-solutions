function print_name_badge(id, name, department)
    return (ismissing(id) ? "" : "[" * string(id) * "] - ") *
           name * " - " *
           (isnothing(department) ? "OWNER" : uppercase(department))
end

function salaries_no_id(ids, salaries)
    salaries_no_id = [salary for (id, salary) in zip(ids, salaries) if ismissing(id)]
    if length(salaries_no_id) == 0
        return 0
    else
        return sum(salaries_no_id)
    end
end
