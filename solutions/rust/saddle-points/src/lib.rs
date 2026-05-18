pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {

    let mut saddle_points = Vec::<(usize, usize)>::new();

    if input.is_empty() || input[0].is_empty() {
        return saddle_points;
    }

    let n_rows = input.len();
    let n_cols = input[0].len();

    let mut row_max = Vec::with_capacity(n_rows);
    for r in 0..n_rows {
        let m = input[r]
            .iter()
            .copied()
            .max()
            .expect("row is non-empty");
        row_max.push(m);
    }

    let mut col_min = Vec::with_capacity(n_cols);
    for c in 0..n_cols {
        let mut m = input[0][c];
        for r in 1..n_rows {
            let v = input[r][c];
            if v < m {
                m = v;
            }
        }
        col_min.push(m);
    }

    for i in 0..n_rows {
        for j in 0..n_cols {
            let v = input[i][j];
            if v == row_max[i] && v == col_min[j] {
                saddle_points.push((i, j));
            }
        }
    }

    saddle_points

}
