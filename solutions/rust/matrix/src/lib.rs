pub struct Matrix {
    e: Vec<Vec<u32>>,
    r: usize,
    c: usize
}

impl Matrix {

    pub fn new(input: &str) -> Self {

        let e: Vec<Vec<u32>> = input
            .lines()
            .map ( |line|
                line
                .split_whitespace()
                .map ( |token|
                    token
                    .parse::<u32>()
                    .unwrap()
                )
                .collect()
            )
            .collect();

        let r = e.len();
        let c = if e.len() > 0 { e[0].len() } else { 0 };

        Self { e, r, c }

    }

    pub fn row(&self, row_no: usize) -> Option<Vec<u32>> {

        if row_no < 1 || row_no > self.r {
            None
        } else {
            Some(self.e[row_no - 1].clone())
        }

    }

    pub fn column(&self, col_no: usize) -> Option<Vec<u32>> {

        if col_no < 1 || col_no > self.c {
            None
        } else {
            Some (
                self
                .e
                .clone()
                .into_iter()
                .map(|v| v[col_no - 1])
                .collect::<Vec<u32>>()
            )
        }

    }

}
