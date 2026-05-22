
type Point = (usize, usize);
type Edge = (Point, Point);

fn find_horizontal_edges(m: &Vec<Vec<char>>) -> Vec<Edge> {

    let mut edges: Vec<Edge> = vec![];

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

fn find_vertical_edges(m: &Vec<Vec<char>>) -> Vec<Edge> {

    let mut edges: Vec<Edge> = vec![];

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
                    if r < n_rows - 1 && (m[r + 1][c] == '|' || m[r + 1][c] == '+') {
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

fn expand_edges(edges: &Vec<Edge>) -> Vec<Edge> {

    let mut new_edges = Vec::<Edge>::new();

    for i in 0..edges.len() {
        for j in i + 1..edges.len() {
            let (e1, e2) = (edges[i], edges[j]);
            if e1.1 == e2.0 {
                let new_edge = (e1.0, e2.1);
                if !edges.contains(&new_edge) && !new_edges.contains(&new_edge) {
                    new_edges.push((e1.0, e2.1));
                }
            }
        }
    }

    new_edges

}

fn find_horizontal_edge_pairs(edges: &Vec<Edge>) -> Vec<(Edge, Edge)> {

    let mut pairs = Vec::<(Edge, Edge)>::new();

    for i in 0..edges.len() {
        for j in i + 1..edges.len() {
            let (e1, e2) = (edges[i], edges[j]);
            if e1.0.1 == e2.0.1 && e1.1.1 == e2.1.1 {
                pairs.push((e1, e2));
            }
        }
    }

    pairs

}

fn find_vertical_edge_pairs(edges: &Vec<Edge>) -> Vec<(Edge, Edge)> {

    let mut pairs = Vec::<(Edge, Edge)>::new();

    for i in 0..edges.len() {
        for j in i + 1..edges.len() {
            let (e1, e2) = (edges[i], edges[j]);
            if e1.0.0 == e2.0.0 && e1.1.0 == e2.1.0 {
                pairs.push((e1, e2));
            }
        }
    }

    pairs

}

fn count_rectangles(h_pairs: &[(Edge, Edge)], v_pairs: &[(Edge, Edge)]) -> u32 {

    let mut count = 0;

    for (h1, h2) in h_pairs {
        for (v1, v2) in v_pairs {
            if (h1.0 == v1.0  && h1.1 == v2.0 && h2.0 == v1.1 && h2.1 == v2.1) ||
               (h2.0 == v1.0  && h2.1 == v2.0 && h1.0 == v1.1 && h1.1 == v2.1) ||
               (h2.0 == v2.0  && h2.1 == v1.0 && h1.0 == v2.1 && h1.1 == v1.1) ||
               (h1.0 == v2.0  && h1.1 == v1.0 && h2.0 == v2.1 && h2.1 == v1.1) {
                count += 1;
            }
        }
    }

    count

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

    let h_edge_pairs = find_horizontal_edge_pairs(&h_edges);
    let v_edge_pairs = find_vertical_edge_pairs(&v_edges);

    count_rectangles(&h_edge_pairs, &v_edge_pairs)

}
