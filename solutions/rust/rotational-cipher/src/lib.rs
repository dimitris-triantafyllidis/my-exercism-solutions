pub fn rotate(input: &str, key: u8) -> String {

    let mut out = String::new();

    for c in input.chars() {

        if c.is_ascii_lowercase() {
            out.push(((c as u8 + key - b'a') % 26 + b'a') as char);
        }
        else if c.is_ascii_uppercase() {
            out.push(((c as u8 + key - b'A') % 26 + b'A') as char);
        }
        else {
            out.push(c);
        }

    }

    out

}
