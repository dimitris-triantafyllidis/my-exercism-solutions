pub fn recite(start_bottles: u32, take_down: u32) -> String {

    let number_words = vec![
        "No",
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
        "Six",
        "Seven",
        "Eight",
        "Nine",
        "Ten"
    ];

    let mut s = String::new();

    for i in (start_bottles - take_down + 1 ..= start_bottles).rev() {
        let i = i as usize;
        s.push_str (
            &format! (
                "{0} green {2} hanging on the wall,\n\
                 {0} green {2} hanging on the wall,\n\
                 And if one green bottle should accidentally fall,\n\
                 There'll be {1} green {3} hanging on the wall.\n\n",
                number_words[i],
                number_words[i - 1].to_lowercase(),
                if i == 1     { "bottle" } else { "bottles" },
                if i - 1 == 1 { "bottle" } else { "bottles" }
            )
        )
    }

    s

}
