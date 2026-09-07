pub fn reply(message: &str) -> &str {

    let message = message.trim();

    let is_silence       = message.is_empty();
    let is_question      = message.ends_with('?') && !message.starts_with('?');
    let contains_letters = message.chars().any(|c| c.is_ascii_alphabetic());
    let is_yelling       = contains_letters && (message.to_ascii_uppercase() == message);

    if is_silence {
        return "Fine. Be that way!"
    }
    else if is_question && is_yelling {
        return "Calm down, I know what I'm doing!"
    }
    else if is_question {
        return "Sure."
    }
    else if is_yelling {
        return "Whoa, chill out!"
    }
    else {
        return "Whatever."
    }

}
