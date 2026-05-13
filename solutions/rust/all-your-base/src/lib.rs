#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit(u32),
}

pub fn convert(number: &[u32], from_base: u32, to_base: u32) -> Result<Vec<u32>, Error> {

    if from_base < 2 {
        return Err ( Error::InvalidInputBase );
    }

    if to_base < 2 {
        return Err ( Error::InvalidOutputBase );
    }

    let mut digits_out = Vec::<u32>::new();

    if number.is_empty() {
        digits_out.push(0);
        return Ok ( digits_out );
    }

    let mut digits_decimal = Vec::<u32>::new();

    for i in 0..number.len() {
        if number[i] >= from_base {
            return Err ( Error::InvalidDigit(number[i]) );
        }
        digits_decimal.push(number[i] * from_base.pow((number.len() - i - 1).try_into().unwrap()));
    }

    let mut n: u32 = digits_decimal.into_iter().sum();

    if n == 0 {
        digits_out.push(0);
        return Ok ( digits_out );
    }

    while n > 0 {
        digits_out.push(n % to_base);
        n /= to_base;
    }

    digits_out.reverse();

    Ok ( digits_out )

}
