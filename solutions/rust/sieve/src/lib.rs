pub fn primes_up_to(upper_bound: u64) -> Vec<u64> {

    let mut sieve: Vec<u64> = (0..=upper_bound).collect();

    sieve[1] = 0;

    for i in 0..sieve.len() {
        if sieve[i] == 0 {
            continue;
        } else {
            for m in (i.pow(2)..sieve.len()).step_by(i) {
                sieve[m] = 0;
            }
        }
    }

    sieve.iter().copied().filter(|p| *p != 0).collect()

}
