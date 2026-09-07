/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {

    let cardnum: Vec<_> = code
        .chars()
        .filter(|c| !c.is_whitespace())
        .collect();

    if cardnum.iter().any(|c| !c.is_digit(10)) {
        return false;
    }

    if cardnum.len() <= 1 {
        return false;
    }

    let odds_sum : u32 = cardnum
        .iter()
        .rev()
        .enumerate()
        .filter(|(i, _)| i % 2 == 1)
        .map(|(_, v)| v.to_digit(10).unwrap())
        .map(|d| if 2 * d > 9 { 2 * d - 9 } else { 2 * d })
        .sum();

    let evens_sum : u32 = cardnum
        .iter()
        .rev()
        .enumerate()
        .filter(|(i, _)| i % 2 == 0)
        .map(|(_, v)| v.to_digit(10).unwrap())
        .sum();

    return (evens_sum + odds_sum) % 10 == 0

}
