use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {

    let mut m = HashSet::new();

    for &factor in factors {
        if factor != 0 {
            let mut i: u32 = 1;
            loop {
                if factor * i < limit {
                    m.insert(factor * i);
                }
                else {
                    break;
                }
                i += 1;
            }
        } else {
            m.insert(0);
        }
    }

    if m.is_empty() { return 0; }

    return m.into_iter().sum();
}
