#[derive(Debug)]
pub struct Item {
    pub weight: u32,
    pub value: u32,
}

pub fn maximum_value(max_weight: u32, items: &[Item]) -> u32 {

    let mut dp = vec![0u32; max_weight as usize + 1];

    for item in items {
        let weight = item.weight as usize;
        let value = item.value;
        for w in (weight..=max_weight as usize).rev() {
            let candidate = dp[w - weight] + value;
            if candidate > dp[w] {
                dp[w] = candidate;
            }
        }
    }

    *dp.iter().max().unwrap()
}
