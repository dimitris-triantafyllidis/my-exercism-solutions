pub fn collatz(n: u64) -> Option<u64> {

    let mut v: u64 = n;

    let mut steps = 0;

    if v == 0
    {
        return None;
    }
    else
    {
        while v != 1
        {
            if v % 2 == 0
            {
                v = v / 2;
            }
            else
            {
                v = v * 3 + 1;
            }
            steps = steps + 1;
        }
    }

    return Some(steps);

}
