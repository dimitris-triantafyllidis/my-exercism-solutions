pub fn spiral_matrix(size: u32) -> Vec<Vec<u32>> {

    let n: usize = size.try_into().unwrap();

    let mut m = Vec::<Vec::<u32>>::new();
    for _ in 0..n {
        m.push(vec![0; n]);
    }

    let mut run_count     : usize = 0;
    let mut run_length    : usize = n;
    let mut direction     : usize;
    let mut step          : usize = 1;
    let mut run_step      : usize = 1;
    let mut cursor_row    : usize = 1;
    let mut cursor_column : usize = 1;

    while step <= n * n {

        if run_step == run_length {
            run_step = 1;
            run_count += 1;
            run_length = n - (run_count - 1) / 2;
        }

        m[cursor_row - 1][cursor_column - 1] = step.try_into().unwrap();
        direction = run_count % 4;

        if direction == 0 {
            cursor_column += 1;
        } else if direction == 1 {
            cursor_row += 1;
        } else if direction == 2 {
            cursor_column -= 1;
        } else if direction == 3 {
            cursor_row -= 1;
        }

        step += 1;
        run_step += 1;

    }

    m
}
