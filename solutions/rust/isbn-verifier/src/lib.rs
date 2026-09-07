/// Determines whether the supplied string is a valid ISBN number
pub fn is_valid_isbn(isbn: &str) -> bool {

    let mut s: Vec<char> = isbn.chars().collect();

    if s.len() == 13 && (s[1] == s[5] && s[5] == s[11] && s[11] == '-') {
        s = vec![
            s[0],
            s[2], s[3], s[4],
            s[6], s[7], s[8], s[9], s[10],
            s[12],
        ];
    }
    else if s.len() != 10 {
        return false;
    }

    let mut d = Vec::<u32>::new();

    for i in 0..10 {
        if s[i].is_digit(10) {
            d.push(s[i].to_digit(10).unwrap());
        }
        else if i == 9 && s[i] == 'X' {
            d.push(10);
        }
        else {
            return false;
        }
    }

    return (
        d[0] * 10 + d[1] * 9 + d[2] * 8 + d[3] * 7 + d[4] * 6 +
        d[5] * 5 + d[6] * 4 + d[7] * 3 + d[8] * 2 + d[9]
    ) % 11 == 0;

}

