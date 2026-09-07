use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {

    let mut seen = HashSet::<char>::new();

    for c in candidate.chars() {
        if c.is_ascii_alphabetic() {
            if !seen.insert(c.to_ascii_lowercase()) {
                return false;
            }
        }
    }

    return true;

}
