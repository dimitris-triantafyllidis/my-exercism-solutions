function is_valid_command(msg)
    return occursin(r"^Chatbot\s*"i, msg)
end

function remove_emoji(msg)
    ms = collect(eachmatch(r"emoji\d\d\d\d", msg))
    for m in ms
        msg = replace(msg, m.match => "")
    end
    return msg
end

function check_phone_number(number)
    if occursin(r"^\(\+\d\d\) \d\d\d-\d\d\d-\d\d\d$", number)
        return "Thanks! You can now download me to your phone."
    else
        return "Oops, it seems like I can't reach out to " * number
    end
end

function getURL(msg)
    r = r"[a-zA-Z]+\.[a-zA-Z]+"
    ms = eachmatch(r, msg)
    return [m.match for m in ms]
end

function nice_to_meet_you(str)
    r1 = r"[a-zA-Z]+,"
    r2 = r" [a-zA-Z]+"
    return "Nice to meet you," * match(r2, str).match * " " * replace(match(r1, str).match, "," => "")
end
