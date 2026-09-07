pub fn encode(source: &str) -> String {

    if source == "" {
        return "".to_string()
    }

    let mut run_c: char = source.chars().nth(0).unwrap();
    let mut run_l: usize = 1;

    let mut rle: String = "".to_string();

    for c in source.chars().skip(1) {
        if c != run_c {
            if run_l > 1 {
                rle.push_str(&run_l.to_string());
            }
            rle.push(run_c);
            run_c = c;
            run_l = 1;
        } else {
            run_c = c;
            run_l += 1;
        }
    }

    if run_l > 1 {
        rle.push_str(&run_l.to_string());
    }

    rle.push(run_c);

    return rle;
}

pub fn decode(source: &str) -> String {

    if source == "" {
        return "".to_string();
    }

    let mut run_l_s: String = "".to_string();
    let mut rld: String = "".to_string();

    for c in source.chars() {
        if c.is_ascii_digit() {
            run_l_s.push(c);
        } else {
            if run_l_s == "" {
                rld.push(c);
            } else {
                rld.push_str(&c.to_string().repeat(run_l_s.parse().unwrap()));
            }
            run_l_s = "".to_string();
        }
    }

    return rld;
}
