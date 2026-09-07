pub fn annotate(garden: &[&str]) -> Vec<String> {

    let mut arr: Vec<Vec<char>> = garden
        .iter()
        .map(|row| row.chars().collect())
        .collect();

    if arr.is_empty() {
        return Vec::<String>::new();
    }

    let w = arr[0].len();
    let h = arr.len();

    for r in 0..h {
        for c in 0..w {
            if arr[r][c] == ' ' {

                let mut sum: u32 = 0;

                if r > 0     && c > 0     { sum = sum + if arr[r - 1][c - 1] == '*' { 1 } else { 0 } }
                if r > 0                  { sum = sum + if arr[r - 1][c + 0] == '*' { 1 } else { 0 } }
                if r > 0     && c < w - 1 { sum = sum + if arr[r - 1][c + 1] == '*' { 1 } else { 0 } }
                if              c > 0     { sum = sum + if arr[r + 0][c - 1] == '*' { 1 } else { 0 } }
                if              c < w - 1 { sum = sum + if arr[r + 0][c + 1] == '*' { 1 } else { 0 } }
                if r < h - 1 && c > 0     { sum = sum + if arr[r + 1][c - 1] == '*' { 1 } else { 0 } }
                if r < h - 1              { sum = sum + if arr[r + 1][c + 0] == '*' { 1 } else { 0 } }
                if r < h - 1 && c < w - 1 { sum = sum + if arr[r + 1][c + 1] == '*' { 1 } else { 0 } }

                if sum > 0 {
                    arr[r][c] = char::from_digit(sum, 10).unwrap();
                }
            }
        }
    }

    let mut ret = Vec::<String>::new();

    for i in 0..h {
        ret.push(arr[i].iter().collect());
    }

    return ret;
}
