const VOWELS     : [char; 5]  = ['a', 'e', 'i', 'o', 'u'];
const CONSONANTS : [char; 21] = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];

fn initial_consonants(word: &[char]) -> Vec<char> {

    let mut result = Vec::<char>::new();

    for (i, c) in word.into_iter().enumerate() {
        if i < 1 && CONSONANTS.contains(c) {
            result.push(*c);
        } else if CONSONANTS.contains(c) && word[i] != 'y' {
            result.push(*c);
        } else {
            return result;
        }
    }

    return result;

}

fn translate_word(word: &[char]) -> Vec<char> {
    let ic = initial_consonants(word);
    let n = word.len();
    let k = ic.len();

    if n >= 1 && VOWELS.contains(&word[0]) ||
       (n >= 2 && ((word[0] == 'x' && word[1] == 'r') ||
                   (word[0] == 'y' && word[1] == 't')))
    {
        let mut out = word.to_vec();
        out.extend(['a', 'y']);
        return out;
    }

    if k > 0 && k < n && ic[k - 1] == 'q' && word[k] == 'u' {
        let mut out = Vec::with_capacity(n + 3);
        out.extend_from_slice(&word[k + 1 ..]);
        out.extend_from_slice(&ic);
        out.extend(['u', 'a', 'y']);
        return out;
    }

    if k > 0 && k < n && word[k] == 'y' {
        let mut out = Vec::with_capacity(n + 2);
        out.extend_from_slice(&word[k ..]);
        out.extend_from_slice(&ic[0 ..]);
        out.extend(['a', 'y']);
        return out;
    }

    if n > 0 && CONSONANTS.contains(&word[0]) {
        let mut out = Vec::with_capacity(n + 2);
        out.extend_from_slice(&word[k ..]);
        out.extend_from_slice(&word[0 .. k]);
        out.extend(['a', 'y']);
        return out;
    }

    word.to_vec()
}


pub fn translate(input: &str) -> String {
    input
        .split_whitespace()
        .map(|word| {
            let chars: Vec<char> = word.chars().collect();
            let out = translate_word(&chars);
            out.into_iter().collect::<String>()
        })
        .collect::<Vec<String>>()
        .join(" ")
}
