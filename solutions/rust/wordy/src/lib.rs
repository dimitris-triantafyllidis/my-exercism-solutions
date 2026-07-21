pub fn answer(command: &str) -> Option<i32> {

    let mut command = String::from(command);

    command = command.replace ( "What is",       ""  );
    command = command.replace ( "?",             ""  );
    command = command.replace ( "plus",          "+" );
    command = command.replace ( "minus",         "-" );
    command = command.replace ( "multiplied by", "*" );
    command = command.replace ( "divided by",    "/" );
    command = command.replace ( "raised to the", "^" );
    command = command.replace ( "st",            ""  );
    command = command.replace ( "nd",            ""  );
    command = command.replace ( "rd",            ""  );
    command = command.replace ( "th",            ""  );
    command = command.replace ( "power",         ""  );

    let command:Vec<String> =
        command
            .split_whitespace()
            .map(|s| s.trim())
            .map(str::to_string)
            .collect();

    if command.len().is_multiple_of(2) {
        return None
    }

    let mut answer: i32;

    if let Ok(n) = command[0].parse::<i32>() {
        answer = n;
    }
    else {
        return None
    }

    for i in (1..command.len()-1).step_by(2) {
        print!("{} ", command[i]);
        if let Ok(n) = command[i + 1].parse::<i32>() {
            match command[i].as_str() {
                "+" => answer += n,
                "-" => answer -= n,
                "*" => answer *= n,
                "/" => answer /= n,
                "^" if answer > 0 => answer = answer.pow(n.try_into().unwrap()),
                _ => return None
            }
        }
        else {
            return None
        }
    }

    return Some(answer)
}
