pub fn series(digits: &str, len: usize) -> Vec<String> {

    let mut slices = Vec::new();

    if len > digits.len() || len == 0 {
        return slices;
    }

    for i in 0 .. digits.len() - len + 1 {
        slices.push(digits[i..i+len].to_string());
    }

    return slices;
}
