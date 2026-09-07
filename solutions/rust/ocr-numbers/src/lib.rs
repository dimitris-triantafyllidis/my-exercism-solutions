#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    InvalidRowCount(usize),
    InvalidColumnCount(usize),
}

pub fn convert_digit(input: [[char; 3]; 4]) -> char {

    let d0: [[char; 3]; 4] = [
        [' ', '_', ' '],
        ['|', ' ', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' ']
    ];

    let d1: [[char; 3]; 4] = [
        [' ', ' ', ' '],
        [' ', ' ', '|'],
        [' ', ' ', '|'],
        [' ', ' ', ' ']
    ];

    let d2: [[char; 3]; 4] = [
        [' ', '_', ' '],
        [' ', '_', '|'],
        ['|', '_', ' '],
        [' ', ' ', ' ']
    ];

    let d3: [[char; 3]; 4] = [
        [' ', '_', ' '],
        [' ', '_', '|'],
        [' ', '_', '|'],
        [' ', ' ', ' ']
    ];

    let d4: [[char; 3]; 4] = [
        [' ', ' ', ' '],
        ['|', '_', '|'],
        [' ', ' ', '|'],
        [' ', ' ', ' ']
    ];

    let d5: [[char; 3]; 4] = [
        [' ', '_', ' '],
        ['|', '_', ' '],
        [' ', '_', '|'],
        [' ', ' ', ' ']
    ];

    let d6: [[char; 3]; 4] = [
        [' ', '_', ' '],
        ['|', '_', ' '],
        ['|', '_', '|'],
        [' ', ' ', ' ']
    ];

    let d7: [[char; 3]; 4] = [
        [' ', '_', ' '],
        [' ', ' ', '|'],
        [' ', ' ', '|'],
        [' ', ' ', ' ']
    ];

    let d8: [[char; 3]; 4] = [
        [' ', '_', ' '],
        ['|', '_', '|'],
        ['|', '_', '|'],
        [' ', ' ', ' ']
    ];

    let d9: [[char; 3]; 4] = [
        [' ', '_', ' '],
        ['|', '_', '|'],
        [' ', '_', '|'],
        [' ', ' ', ' ']
    ];

    match input {
        d if d == d0 => '0',
        d if d == d1 => '1',
        d if d == d2 => '2',
        d if d == d3 => '3',
        d if d == d4 => '4',
        d if d == d5 => '5',
        d if d == d6 => '6',
        d if d == d7 => '7',
        d if d == d8 => '8',
        d if d == d9 => '9',
        _ => '?'
    }
}

pub fn convert(input: &str) -> Result<String, Error> {

    let lines: Vec<String> = input
        .lines()
        .map(str::to_string)
        .collect();

    let n_cell_rows: usize;
    let n_cell_cols: usize;

    if lines.len() % 4 == 0 && !lines.is_empty() {
        n_cell_rows = lines.len() / 4;
    } else {
        return Err(Error::InvalidRowCount(lines.len()));
    }

    if lines[0].len() % 3 == 0 && !lines[0].is_empty() {
        n_cell_cols = lines[0].len() / 3;
    } else {
        return Err(Error::InvalidColumnCount(lines[0].len()));
    }

    let mut result_s = "".to_string();

    for r in 0..n_cell_rows {
        for c in 0..n_cell_cols {
            let mut cell = [[' '; 3]; 4];

            for cell_r in 0..4 {
                let line = lines[4 * r + cell_r].chars().collect::<Vec<char>>();
                let start = 3 * c;
                let end = start + 3;

                cell[cell_r].copy_from_slice(&line[start..end]);
            }

            result_s.push(convert_digit(cell));
        }
        if r < n_cell_rows - 1 {
            result_s.push(',');
        }
    }

    return Ok(result_s);

}
