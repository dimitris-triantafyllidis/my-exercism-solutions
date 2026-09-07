# The new_school() function must return something that can be used in
# all the other functions.
# Programmers are free to choose a suitable implementation.

function new_school()
    return Dict(i => String[] for i in 1:12)
end

function add!(students, school)

    result = Array{Bool, 1}()

    for student in students
        if student[1] ∉ [student for grade in 1:12 for student in school[grade]]
            push!(school[student[2]], student[1])
            push!(result, true)
        else
            push!(result, false)
        end
    end

    return result

end

function grade(num, school)
    return sort(school[num])
end

function roster(school)
    r = Array{String, 1}()
    for g in 1:12
        for student in sort(school[g])
            push!(r, student)
        end
    end
    return r
end
