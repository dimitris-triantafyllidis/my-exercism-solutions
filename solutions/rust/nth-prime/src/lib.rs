pub fn is_prime(n: u32) -> bool {

    if n <= 1 {
        return false;
    }

    let mut m = 2;
    while m * m <= n {
        if n % m == 0 {
            return false;
        }
        m += 1;
    }

    true

}

pub fn next_prime(n: u32) -> u32 {

    let mut m = n + 1;

    loop {
        if is_prime(m) {
            return m;
        }
        m += 1;
    }

}

pub fn nth(n: u32) -> u32 {

    let mut curr_prime: u32 = 2;
    let mut prime_ordinal: u32 = 0;

    loop {
        if prime_ordinal == n {
            return curr_prime;
        }
        else {
            curr_prime = next_prime(curr_prime);
            prime_ordinal += 1;
        }
    }

}
