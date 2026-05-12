/// Determine whether a sentence is a pangram.

use std::collections::HashSet;

pub fn is_pangram(sentence: &str) -> bool {

    let letters: HashSet<char> =
        sentence
            .chars()
            .filter(|c| c.is_ascii_alphabetic())
            .map(|c| c.to_ascii_uppercase())
            .collect();

    return letters.len() == 26;

}
