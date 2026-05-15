/// "Encipher" with the Atbash cipher.
pub fn encode(plain: &str) -> String {

    let mut out = String::new();
    let mut count = 0;

    for c in plain.chars() {

        if !c.is_ascii_alphanumeric() {
            continue;
        }

        if count == 5 {
            out.push(' ');
            count = 0;
        }

        let c = c.to_ascii_lowercase();
        let mapped = if c.is_ascii_alphabetic() {
            (b'a' + (b'z' - c as u8)) as char
        } else {
            c
        };

        out.push(mapped);
        count += 1;
    }

    return out;

}

/// "Decipher" with the Atbash cipher.
pub fn decode(cipher: &str) -> String {

    let mut out = String::new();

    for c in cipher.chars() {

        if c.is_ascii_alphabetic() {
            out.push((b'a' + (b'z' - c as u8)) as char);
        }
        else if c.is_ascii_digit() {
            out.push(c);
        }

    }

    return out;

}
