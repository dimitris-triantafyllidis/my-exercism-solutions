use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {

    let mut occurences = HashMap::<String, u32>::new();

    let words = words
        .chars()
        .filter (|&c| c.is_alphanumeric() || c.is_whitespace() || c == ',' || c == '\'')
        .collect::<String>()
        .split(|c: char| c.is_whitespace() || c == ',')
        .filter(|s| !s.is_empty())
        .map(|s| s.to_string().to_lowercase())
        .map(|w| w.trim_matches('\'').to_string())
        .collect::<Vec<String>>();

    for word in words {
        *occurences.entry(word).or_insert(0) += 1;
    }

    occurences

}
