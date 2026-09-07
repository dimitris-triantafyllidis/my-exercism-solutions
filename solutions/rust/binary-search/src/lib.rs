pub fn find(array: &[i32], key: i32) -> Option<usize> {

    if array.is_empty() {
        return None;
    }

    let mut min_idx: usize = 0;
    let mut max_idx: usize = array.len() - 1;

    if array[min_idx] == key {
        return Some(min_idx);
    }
    else if array[max_idx] == key {
        return Some(max_idx);
    }

    loop {
        if max_idx - min_idx == 1 {
            return None;
        }
        else {
            let candidate_idx: usize = (min_idx + max_idx) / 2;
            if array[candidate_idx] == key {
                return Some(candidate_idx);
            }
            else if array[candidate_idx] < key {
                min_idx = candidate_idx;
            }
            else if array[candidate_idx] > key {
                max_idx = candidate_idx;
            }
        }
    }
}
