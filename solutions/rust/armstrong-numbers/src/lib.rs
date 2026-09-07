pub fn is_armstrong_number(num: u32) -> bool {

    let num_s = num.to_string();
    let power = num_s.len() as u32;

    let sum: u32 = num_s
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .map(|d| d.pow(power))
        .sum();

    sum == num

}
