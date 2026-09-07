use std::collections::HashSet;

pub fn find(sum: u32) -> HashSet<[u32; 3]> {

    let mut triplets = HashSet::<[u32; 3]>::new();

    if sum < 12 {
        return triplets;
    }

    for a in 3..sum / 3 + 1 {
        let b_lower = ((sum - 2 * a) / 2) + 1;
        let b_lower = b_lower.max(a + 1);
        let b_upper = ((sum - a) / 2) + 1;
        for b in b_lower..=b_upper {
            let c = sum - a - b;
            if a * a + b * b == c * c {
                triplets.insert([a, b, c]);
            }
        }
    }

    triplets
}
