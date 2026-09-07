pub struct PascalsTriangle {
    row_count: u32
}

impl PascalsTriangle {
    pub fn new(row_count: u32) -> Self {
        Self { row_count }
    }

    pub fn rows(&self) -> Vec<Vec<u32>> {
        let n = self.row_count as usize;

        if n == 0 {
            return vec![];
        }

        let mut t: Vec<Vec<u32>> = Vec::with_capacity(n);

        t.push(vec![1]);

        for m in 2..=n {
            let mut row = Vec::with_capacity(m);
            for k in 0..m {
                let left  = if k == 0     { 0 } else { t[m - 2][k - 1] };
                let right = if k == m - 1 { 0 } else { t[m - 2][k] };
                row.push(left + right);
            }
            t.push(row);
        }
        t
    }
}
