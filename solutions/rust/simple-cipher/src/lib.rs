use rand::prelude::*;
use rand::RngExt;

fn prepare_key(key: &str) -> Option<Vec<u8>> {

    if key.len() == 0 {
        return None;
    }

    for c in key.chars() {
        if !c.is_ascii_lowercase() {
            return None;
        }
    }

    let key: Vec<u8> = key
        .chars()
        .map(|c| c as u8 - b'a')
        .collect();

    return Some(key);
}

pub fn encode(key: &str, s: &str) -> Option<String> {

    let key = match prepare_key(key) {
        Some(k) => k,
        None => return None,
    };

    let mut key_idx = 0;
    let mut out = String::new();

    for c in s.chars() {
        out.push(((c as u8 + key[key_idx] - b'a') % 26 + b'a') as char);
        key_idx = (key_idx + 1) % key.len();
    }

    Some(out)
}

pub fn decode(key: &str, s: &str) -> Option<String> {

    let key = match prepare_key(key) {
        Some(k) => k,
        None => return None,
    };

    let mut key_idx = 0;
    let mut out = String::new();

    for c in s.chars() {
        out.push(((c as u8 + (26 - key[key_idx]) - b'a') % 26 + b'a') as char);
        key_idx = (key_idx + 1) % key.len();
    }

    Some(out)
}

use rand::distr::{Distribution, Uniform};

fn random_lowercase(len: usize) -> String {
    let mut rng = rand::rng();
    let between = Uniform::try_from(0..26).unwrap();
    (0..len)
        .map(|_| (between.sample(&mut rng) as u8 + b'a') as char)
        .collect()
}

pub fn encode_random(s: &str) -> (String, String) {
    let key = random_lowercase(100);
    (key.clone(), encode(&key, s).unwrap())
}
