pub fn abbreviate(phrase: &str) -> String {

    let phrase_filtered = phrase
        .chars()
        .filter(|c| c.is_alphabetic() || *c == ' ' || *c == '-')
        .collect::<Vec<char>>();

    let mut acronym = String::new();

    for i in 0..phrase_filtered.len() - 1 {
        let a = phrase_filtered[i];
        let b = phrase_filtered[i + 1];
        if i == 0 {
            acronym.push(a);
        } else if ((a == ' ' || a == '-') && b.is_alphabetic()) || (a.is_lowercase() && b.is_uppercase()) {
            acronym.extend(b.to_uppercase());
        }
    }

    return acronym;

}
