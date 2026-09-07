use std::cmp::Ordering;

#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

fn aliquot_sum(n: u64) -> Option<u64> {

    if n == 0 {
        return None
    }

    let mut sum: u64 = 0;

    for i in 1..=n-1 {
        sum += if i.is_multiple_of(n) else { 0 }
    }

    Some(sum)

}

pub fn classify(num: u64) -> Option<Classification> {

    match aliquot_sum(num) {
        None => None,
        Some(sum) => {
            match sum.cmp(&num) {
                Ordering::Equal   => Some(Classification::Perfect),
                Ordering::Less    => Some(Classification::Deficient),
                Ordering::Greater => Some(Classification::Abundant)
            }
        }
    }

}
