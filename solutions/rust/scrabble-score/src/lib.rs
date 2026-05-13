/// Compute the Scrabble score for a word.
fn letter_points(c: char) -> u64 {

    if      ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] .contains(&c.to_ascii_uppercase()) {  1 }
    else if ['D', 'G']                                         .contains(&c.to_ascii_uppercase()) {  2 }
    else if ['B', 'C', 'M', 'P']                               .contains(&c.to_ascii_uppercase()) {  3 }
    else if ['F', 'H', 'V', 'W', 'Y']                          .contains(&c.to_ascii_uppercase()) {  4 }
    else if ['K']                                              .contains(&c.to_ascii_uppercase()) {  5 }
    else if ['J', 'X']                                         .contains(&c.to_ascii_uppercase()) {  8 }
    else if ['Q', 'Z']                                         .contains(&c.to_ascii_uppercase()) { 10 }
    else                                                                                          {  0 }

}

pub fn score(word: &str) -> u64 {

    let mut sum: u64 = 0;

    for c in word.chars() {
        sum += letter_points(c);
    }

    sum

}
