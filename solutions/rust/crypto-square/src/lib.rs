pub fn encrypt(input: &str) -> String {

    let mut p: Vec<char> = input
        .chars()
        .filter(|ch| ch.is_ascii_alphanumeric())
        .map(|ch| ch.to_ascii_lowercase())
        .collect();

    if p.is_empty() {
        return String::new();
    }

    let mut c = 0usize;
    while c * c < p.len() {
        c += 1;
    }

    let r =
        if c * c == p.len() {
            c
        } else if c * (c - 1) >= p.len() {
            c - 1
        } else {
            c
        };

    let target = r * c;
    p.extend(std::iter::repeat_n(' ', target - p.len()));

    let mut ct = vec![' '; r * c + (c - 1)];

    for i in 0..r {
        for j in 0..c {
            ct[j * (r + 1) + i] = p[i * c + j];
        }
    }

    ct.into_iter().collect()
}
