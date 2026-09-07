pub fn chain(input: &[(u8, u8)]) -> Option<Vec<(u8, u8)>> {

    if input.is_empty() {
        return Some(vec![]);
    }

    for (i, &(a, b)) in input.iter().enumerate() {

        let mut rest = Vec::with_capacity(input.len() - 1);
        rest.extend_from_slice(&input[..i]);
        rest.extend_from_slice(&input[i + 1..]);

        let mut start     = vec![(a, b)]; if let Some(sol) = build_chain(&mut start,     &rest) { return Some(sol); }
        let mut start_rev = vec![(b, a)]; if let Some(sol) = build_chain(&mut start_rev, &rest) { return Some(sol); }

    }

    None
}

fn build_chain(chain: &mut Vec<(u8, u8)>, rest: &[(u8, u8)]) -> Option<Vec<(u8, u8)>> {

    if rest.is_empty() {
        if chain.last().unwrap().1 == chain.first().unwrap().0 {
            return Some(chain.clone());
        } else {
            return None;
        }
    }

    let last_right = chain.last().unwrap().1;

    for (i, &(a, b)) in rest.iter().enumerate() {

        let mut new_rest = Vec::with_capacity(rest.len() - 1);
        new_rest.extend_from_slice(&rest[..i]);
        new_rest.extend_from_slice(&rest[i + 1..]);

        if last_right == a { chain.push((a, b)); if let Some(sol) = build_chain(chain, &new_rest) { return Some(sol); } chain.pop(); }
        if last_right == b { chain.push((b, a)); if let Some(sol) = build_chain(chain, &new_rest) { return Some(sol); } chain.pop(); }

    }

    None
}
