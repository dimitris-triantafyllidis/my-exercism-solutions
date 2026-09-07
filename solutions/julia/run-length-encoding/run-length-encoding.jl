function encode(s)

    if s == "" return "" end

    run_c = s[1]
    run_l = 1

    rle = ""

    for c in s[2:end]
        if c != run_c
            if run_l > 1 rle *= string(run_l) end
            rle *= string(run_c)
            run_c = c
            run_l = 1
        else
            run_c = c
            run_l += 1
        end
    end

    if run_l > 1 rle *= string(run_l) end
    rle *= string(run_c)

    return rle
end

function decode(s)

    if s == ""
        return ""
    end

    run_l_s = ""

    rld = ""

    for c in s
        if isnumeric(c)
            run_l_s *= c
        else
            if run_l_s == ""
                rld *= c
            else
                rld *= c^parse(Int, run_l_s)
            end
            run_l_s = ""
        end
    end

    return rld

end
