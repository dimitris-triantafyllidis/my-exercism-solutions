pub fn encode(n: u64) -> String {

    let units = vec! [
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine"
    ];

    let teens = vec! [
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen"
    ];

    let tens = vec! [
        "twenty",
        "thirty",
        "forty",
        "fifty",
        "sixty",
        "seventy",
        "eighty",
        "ninety"
    ];

    let suffixes = [
        "",
        "thousand",
        "million",
        "billion",
        "trillion",
        "quadrillion",
        "quintillion",
        "sextilion"
    ];

    let s = n.to_string();
    let triplets = s
        .as_bytes()
        .rchunks(3)
        .rev()
        .map(|chunk| std::str::from_utf8(chunk).unwrap())
        .collect::<Vec<_>>();

    let starting_suffix_index = triplets.len();

    let mut say: String = "".to_string();

    for i in 0..starting_suffix_index {

        let triplet = i64::from_str_radix(triplets[i], 10).unwrap();

        let h = triplet / 100;
        let t = triplet % 100 / 10;
        let u = triplet % 10;

        if triplet != 0 {

            if h != 0 {
                say = say + units[(h - 1) as usize];
                say = say + " hundred ";
            }

            if t > 1 {
                say = say + tens[(t - 2) as usize];
                if triplet % 10 != 0 {
                    say = say + "-";
                    say = say + units[(u - 1) as usize];
                }
            }
            else if t == 1 {
                say = say + teens[(triplet % 100 - 10) as usize];
            }
            else if u != 0 {
                say = say + units[(triplet % 100 - 1) as usize];
            }

            say = say + " ";
            say = say + suffixes[starting_suffix_index - i - 1];
            say = say + " ";

        }
    }

    if say.is_empty() {
        "zero".to_string()
    }
    else {
        say.trim().to_string()
    }

}
