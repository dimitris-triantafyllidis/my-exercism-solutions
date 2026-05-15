#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    SpanTooLong,
    InvalidDigit(char),
}

pub fn lsp(s: &str, l: usize) -> Result<u64, Error> {

    if l == 0 {
        return Ok(1);
    }

    if l > s.len() {
        return Err(Error::SpanTooLong);
    }

    for c in s.chars() {
        if !c.is_digit(10) {
            return Err(Error::InvalidDigit(c));
        }
    }

    let mut p_max: u64 = 0;

    let digits: Vec::<u64> = s
        .chars()
        .map(|c| c.to_digit(10).unwrap() as u64)
        .collect();

    for i in 0..s.len() - l + 1 {
        let p = digits[i..i + l].iter().product();
        if p > p_max {
            p_max = p;
        }
    }

    return Ok(p_max);

}
