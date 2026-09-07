/// Return the Hamming distance between the strings,
/// or None if the lengths are mismatched.
pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {

    if s1.len() != s2.len() {
        return None;
    }

    let mut h: usize = 0;

    for (c1, c2) in s1.chars().zip(s2.chars()) {
        if c1 != c2 {
            h += 1;
        }
    }

    return Some(h);

}
