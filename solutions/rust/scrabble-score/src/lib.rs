/// Compute the Scrabble score for a word.

fn letter_points(c: char) -> u64 {

    if      ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] .contains(&c.to_ascii_uppercase()) { return 1;  }
    else if ['D', 'G']                                         .contains(&c.to_ascii_uppercase()) { return 2;  }
    else if ['B', 'C', 'M', 'P']                               .contains(&c.to_ascii_uppercase()) { return 3;  }
    else if ['F', 'H', 'V', 'W', 'Y']                          .contains(&c.to_ascii_uppercase()) { return 4;  }
    else if ['K']                                              .contains(&c.to_ascii_uppercase()) { return 5;  }
    else if ['J', 'X']                                         .contains(&c.to_ascii_uppercase()) { return 8;  }
    else if ['Q', 'Z']                                         .contains(&c.to_ascii_uppercase()) { return 10; }
    else                                                                                          { return 0;  }

}

pub fn score(word: &str) -> u64 {

    let mut sum: u64 = 0;

    for c in word.chars() {
        sum += letter_points(c);
    }

    return sum;

}
