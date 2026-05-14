pub fn number(user_number: &str) -> Option<String> {

    let mut f = Vec::<char>::new();

    for c in user_number.chars() {
        if c.is_digit(10) {
            f.push(c);
        }
    }

    if
        f.len() == 10 &&
        (f[0].to_digit(10).unwrap() >= 2 ) &&
        (f[0].to_digit(10).unwrap() <= 9 ) &&
        (f[3].to_digit(10).unwrap() >= 2 ) &&
        (f[3].to_digit(10).unwrap() <= 9 )
    {
        Some ( f.iter().collect() )
    }
    else if
        f.len() == 11 &&
        f[0] == '1' &&
        (f[1].to_digit(10).unwrap() >= 2 ) &&
        (f[1].to_digit(10).unwrap() <= 9 ) &&
        (f[4].to_digit(10).unwrap() >= 2 ) &&
        (f[4].to_digit(10).unwrap() <= 9 )
    {
        Some ( f.iter().skip(1).collect() )
    }
    else {
        None
    }

}
