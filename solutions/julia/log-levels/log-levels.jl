function message(msg)
    return strip(split(msg, "]: ")[2])
end

function log_level(msg)
    if contains(msg, "[ERROR]") return "error"
    elseif contains(msg, "[WARNING]") return "warning"
    else return "info"
    end
end

function reformat(msg)
    return message(msg) * " (" * log_level(msg) * ")"
end
