pub fn is_prime(n: u64) -> bool {

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

pub fn next_prime(n: u64) -> u64 {

    let mut m = n + 1;

    loop {
        if is_prime(m) {
            return m;
        }
        m += 1;
    }

}

pub fn factors(mut n: u64) -> Vec<u64> {

    let mut fs = Vec::new();
    let mut f = 2;

    while n != 1 {
        if n % f == 0 {
            fs.push(f);
            n /= f;
        } else {
            f = next_prime(f);
        }
    }

    fs
}
