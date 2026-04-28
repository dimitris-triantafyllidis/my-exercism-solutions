function transform(ch)
    if ch == '-'
        return "_"
    elseif ch == ' ' || ch == '\t'
        return ""
    elseif isuppercase(ch)
        return "-" * lowercase(ch)
    elseif isdigit(ch)
        return ""
    elseif ch in 'α':'ω'
        return "?"
    else
        return "" * ch
    end
end

function clean(str)
    cleaned_up_str = ""
    for ch in str
        cleaned_up_str = cleaned_up_str * transform(ch)
    end
    return cleaned_up_str
end
