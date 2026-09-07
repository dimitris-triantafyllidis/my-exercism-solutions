pub fn egg_count(display_value: u32) -> usize {

    let mut cnt: usize = 0;

    for i in 0..=31 {
        if (display_value >> i) & 1 == 1 {
            cnt += 1;
        }
    }

    return cnt;

}
