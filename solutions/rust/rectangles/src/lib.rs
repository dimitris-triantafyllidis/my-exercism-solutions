
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

fn find_horizontal_edge_pairs(edges: &Vec<Edge>) -> Vec<(Edge, Edge)> {

    let mut pairs = Vec::<(Edge, Edge)>::new();

    for i in 0..edges.len() {
        for j in i + 1..edges.len() {
            if edges[i].0.1 == edges[j].0.1 && edges[i].1.1 == edges[j].1.1 {
                pairs.push((edges[i], edges[j]));
            }
        }
    }

    pairs

}

fn find_vertical_edge_pairs(edges: &Vec<Edge>) -> Vec<(Edge, Edge)> {

    let mut pairs = Vec::<(Edge, Edge)>::new();

    for i in 0..edges.len() {
        for j in i + 1..edges.len() {
            if edges[i].0.0 == edges[j].0.0 && edges[i].1.0 == edges[j].1.0 {
                pairs.push((edges[i], edges[j]));
            }
        }
    }

    pairs

}

fn count_triangles(h_edge_pairs: &Vec<(Edge, Edge)>, v_edge_pairs: &Vec<(Edge, Edge)>) -> u32 {

    let mut count: u32 = 0;

    for i in 0..h_edge_pairs.len() {
        for j in 0..v_edge_pairs.len() {
            if
               (h_edge_pairs[i].0.0 == v_edge_pairs[j].0.0) &&
               (h_edge_pairs[i].0.0 == v_edge_pairs[j].1.0) &&
               (h_edge_pairs[i].1.0 == v_edge_pairs[j].0.0) &&
               (h_edge_pairs[i].1.0 == v_edge_pairs[j].1.0) {
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

    count_triangles(&h_edge_pairs, &v_edge_pairs)

}
