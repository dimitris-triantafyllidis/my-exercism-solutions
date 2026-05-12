use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {

    let mut anagrams = HashSet::<&'a str>::new();

    let word_lowercase: Vec<_> =
        word
            .to_lowercase()
            .chars()
            .collect();

    let mut word_lowercase_sorted =
        word_lowercase
            .clone();

    word_lowercase_sorted.sort();

    for candidate in possible_anagrams {

        let candidate_lowercase: Vec<_> =
            candidate
                .to_lowercase()
                .chars()
                .collect();

        if candidate_lowercase == word_lowercase {
            continue;
        }

        let mut candidate_lowercase_sorted =
            candidate_lowercase
                .clone();

        candidate_lowercase_sorted.sort();

        if candidate_lowercase_sorted == word_lowercase_sorted {
            anagrams.insert(candidate);
        }

    }

    return anagrams;

}
