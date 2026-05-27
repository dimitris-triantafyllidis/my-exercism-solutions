pub fn get_diamond(c: char) -> Vec<String> {

    let n = (c as u8 - b'A' + 1) as usize;

    let quadrant: Vec<String> = (0..n)
        .map(|m|{
            let letter = (b'A' + m as u8) as char;
            let lpad = " ".repeat(m);
            let rpad = " ".repeat(n - m - 1);
            format!("{lpad}{letter}{rpad}")
        })
        .collect();

    let top: Vec<String> = quadrant
        .iter()
        .map(|s|{
            let rev: String = s.chars().rev().collect();
            let tail: String = s.chars().skip(1).collect();
            format!("{rev}{tail}")
        })
        .collect();

    top.iter()
       .chain(top.iter().rev().skip(1))
       .cloned()
       .collect()
}
