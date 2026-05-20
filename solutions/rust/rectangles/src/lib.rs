

fn find_horizontal_edges(m: &Vec<Vec<char>>) -> Vec<((usize, usize), (usize, usize))> {

    let mut edges: Vec<((usize, usize), (usize, usize))> = vec![];

    let n_rows = m.len();
    let n_cols = if m.is_empty() { 0 } else { m[0].len() };

    let mut edge_start: (usize, usize) = (0, 0);
    let mut edge_end:   (usize, usize);

    for r in 0..n_rows {
        let mut state = 0;
        for c in 0..n_cols {
            if state == 0 {
                if m[r][c] == '+' {
                    edge_start = (r, c);
                    state = 1;
                }
            } else if state == 1 {
                if m[r][c] == '-' {
                    continue;
                } else if m[r][c] == '+' {
                    edge_end = (r, c);
                    edges.push((edge_start, edge_end));
                    if c < n_cols - 1 && (m[r][c + 1] == '-' || m[r][c + 1] == '+') {
                        edge_start = edge_end;
                        state = 1;
                    } else {
                        state = 0;
                    }
                } else {
                    state = 0;
                }
            }
        }
    }

    edges

}

fn find_vertical_edges(m: &Vec<Vec<char>>) -> Vec<((usize, usize), (usize, usize))> {

    let mut edges: Vec<((usize, usize), (usize, usize))> = vec![];

    let n_rows = m.len();
    let n_cols = if m.is_empty() { 0 } else { m[0].len() };

    let mut edge_start: (usize, usize) = (0, 0);
    let mut edge_end:   (usize, usize);

    for c in 0..n_cols {
        let mut state = 0;
        for r in 0..n_rows {
            if state == 0 {
                if m[r][c] == '+' {
                    edge_start = (r, c);
                    state = 1;
                }
            } else if state == 1 {
                if m[r][c] == '|' {
                    continue;
                } else if m[r][c] == '+' {
                    edge_end = (r, c);
                    edges.push((edge_start, edge_end));
                    if c < n_cols - 1 && (m[r][c + 1] == '|' || m[r][c + 1] == '+') {
                        edge_start = edge_end;
                        state = 1;
                    } else {
                        state = 0;
                    }
                } else {
                    state = 0;
                }
            }
        }
    }

    edges

}

fn expand_edges(edges: &Vec<((usize, usize), (usize, usize))>) -> Vec<((usize, usize), (usize, usize))> {

    let mut new_edges = Vec::<((usize, usize), (usize, usize))>::new();

    for i in 0..edges.len() {
        for j in i..edges.len() {
            if edges[i].1 == edges[j].0 {
                let new_edge = (edges[i].0, edges[j].1);
                if !edges.contains(&new_edge) && !new_edges.contains(&new_edge) {
                    new_edges.push((edges[i].0, edges[j].1));
                }
            }
        }
    }

    new_edges

}



pub fn count(lines: &[&str]) -> u32 {

    let char_matrix: Vec<Vec<char>> = lines
        .into_iter()
        .map ( |line|
            line
                .chars()
                .collect()
            ).collect();

    let mut h_edges = find_horizontal_edges(&char_matrix);
    let mut v_edges = find_vertical_edges(&char_matrix);

    loop {
        let new_edges = expand_edges(&h_edges);
        if !new_edges.is_empty() { h_edges.extend(new_edges); } else { break; }
    }

    loop {
        let new_edges = expand_edges(&v_edges);
        if !new_edges.is_empty() { v_edges.extend(new_edges); } else { break; }
    }

    println!("{:?}", h_edges);
    println!("{:?}", v_edges);

    0

}
