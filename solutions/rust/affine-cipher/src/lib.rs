/// While the problem description indicates a return status of 1 should be returned on errors,
/// it is much more common to return a `Result`, so we provide an error type for the result here.
#[derive(Debug, Eq, PartialEq)]
pub enum AffineCipherError {
    NotCoprime(i32),
}

/// Encodes the plaintext using the affine cipher with key (`a`, `b`). Note that, rather than
/// returning a return code, the more common convention in Rust is to return a `Result`.
pub fn encode(plaintext: &str, a: i32, b: i32) -> Result<String, AffineCipherError> {

    if !are_coprime(a, M) {
        return Err(AffineCipherError::NotCoprime(a));
    }

    let mut e = String::new();

    for c in plaintext.chars() {
        if c.is_ascii_digit() {
            e.push(c);
        }
        else if c.is_ascii_alphabetic() {
            e.push(encode_char(c.to_ascii_lowercase(), a, b).unwrap());
        }
        if e.len() % 6 == 5 && e.chars().last().unwrap() != ' ' {
            e.push(' ');
        }
    }

    if e.chars().last().unwrap() == ' ' {
        Ok(e[..e.len() - 1].to_string())
    } else {
        Ok(e)
    }
}

/// Decodes the ciphertext using the affine cipher with key (`a`, `b`). Note that, rather than
/// returning a return code, the more common convention in Rust is to return a `Result`.
pub fn decode(ciphertext: &str, a: i32, b: i32) -> Result<String, AffineCipherError> {

    if !are_coprime(a, M) {
        return Err(AffineCipherError::NotCoprime(a));
    }

    let mut e = String::new();

    for c in ciphertext.chars() {
        if c.is_ascii_digit() {
            e.push(c);
        }
        else if c.is_ascii_lowercase() {
            e.push(decode_char(c, a, b).unwrap());
        }
    }

    Ok(e)
}

const M: i32 = 26;

fn gcd(mut a: i32, mut b: i32) -> i32 {
    while b != 0 {
        let r = a % b;
        a = b;
        b = r;
    }
    a
}

fn are_coprime(a: i32, b: i32) -> bool
{
    return gcd(a, b) == 1;
}

fn modular_multiplicative_inverse(a: i32, m: i32) -> Option<i32>
{
    if are_coprime(a, m) {
        for x in 1..m {
            if (a * x) % m == 1 {
                return Some(x);
            }
        }
        None
    } else {
        None
    }
}

fn encode_char(c: char, a: i32, b: i32) -> Result<char, AffineCipherError>
{
    if !are_coprime(a, M) {
        return Err(AffineCipherError::NotCoprime(a));
    }

    if c.is_ascii_lowercase() {
        let i = (c as u8 - b'a') as i32;
        Ok((((a * i + b) % M) as u8 + b'a') as char)
    } else {
        Ok(c)
    }
}

fn decode_char(c: char, a: i32, b: i32) -> Result<char, AffineCipherError>
{
    if !are_coprime(a, M) {
        return Err(AffineCipherError::NotCoprime(a));
    }

    if c.is_ascii_lowercase() {
        let i = (c as u8 - b'a') as i32;
        let mmiam = modular_multiplicative_inverse(a, M).unwrap();
        Ok((((((mmiam * (i - b)) % M) + M) % M) as u8 + b'a') as char)
    } else {
        Ok(c)
    }
}
