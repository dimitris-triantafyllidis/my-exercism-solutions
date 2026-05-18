use std::collections::HashSet;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Palindrome {
    v: u64,
    fs: HashSet<(u64, u64)>
}

fn is_palindrome(n: u64) -> bool {
    n.to_string() == n.to_string().chars().rev().collect::<String>()
}

impl Palindrome {

    pub fn value(&self) -> u64 {
        self.v
    }

    pub fn into_factors(self) -> HashSet<(u64, u64)> {
        self.fs
    }

}

pub fn palindrome_products(min: u64, max: u64) -> Option<(Palindrome, Palindrome)> {

    let mut p_min: Option<Palindrome> = None;
    let mut p_max: Option<Palindrome> = None;

    for a in min..=max {
        for b in a..=max {
            let product = a * b;
            if is_palindrome(product) {

                let factors = (a, b);

                match p_min {
                    None => {
                        p_min = Some ( Palindrome { v: product, fs: HashSet::from([factors]) } )
                    },
                    Some(ref mut palindrome) => {
                        if palindrome.v > product {
                           p_min = Some ( Palindrome { v: product, fs: HashSet::from([factors]) } )
                        } else if palindrome.v == product {
                            palindrome.fs.insert(factors);
                        }
                    }
                }

                match p_max {
                    None => {
                        p_max = Some ( Palindrome { v: product, fs: HashSet::from([factors]) } )
                    },
                    Some(ref mut palindrome) => {
                        if palindrome.v < product {
                            p_max = Some ( Palindrome { v: product, fs: HashSet::from([factors]) } )
                        } else if palindrome.v == product {
                            palindrome.fs.insert(factors);
                        }
                    }
                }

            }
        }
    }

    match (p_min.clone(), p_max.clone()) {
        (Some(_), Some(_)) => Some((p_min.clone().unwrap(), p_max.clone().unwrap())),
        _ => None
    }

}
