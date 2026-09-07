use std::collections::HashMap;

use crate::Error::{StackUnderflow, UnknownWord};

pub type Value = i32;
pub type Result = std::result::Result<(), Error>;

pub struct Forth {
    stack: Vec<Value>,
    word_definitions: HashMap<String, String>
}

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    DivisionByZero,
    StackUnderflow,
    UnknownWord,
    InvalidWord,
}

fn is_number(token: &str) -> bool {

    let first_char = token.chars().next().unwrap();

    if !((first_char == '-' && token.len() > 1) || first_char.is_ascii_digit()) {
        return false;
    }

    for c in token.chars().skip(1) {
        if !c.is_ascii_digit() {
            return false;
        }
    }

    return true;
}

fn is_word(token: &str) -> bool {

    if is_number(&token) {
        return false;
    }

    for c in token.chars() {
        if !(c.is_ascii_alphanumeric() || c.is_ascii_punctuation()) {
            return false;
        }
    }
    return true;
}

impl Forth {

    pub fn new() -> Forth {
        Forth {
            stack: Vec::new(),
            word_definitions: HashMap::new()
        }
    }

    fn register_word_definition(&mut self, input: &str) -> Result {

        let words =
            input
                .split_whitespace()
                .collect::<Vec<&str>>();

        let new_word = words[1];

        if is_number(new_word) || !is_word(new_word) {
            return Err(Error::InvalidWord);
        }

        let mut new_word_definition = String::new();

        for i in 2..words.len() - 1 {
            if !is_number(words[i]) && !is_word(words[i]) {
                return Err(Error::InvalidWord);
            }
            else if new_word == words[i] {
                if self.word_definitions.contains_key(words[i]) {
                    if i > 2 {
                        new_word_definition.push(' ');
                    }
                    new_word_definition.push_str(self.word_definitions[words[i]].as_str());
                }
                else {
                    return Err(Error::UnknownWord);
                }
            }
            else {
                if i > 2 {
                    new_word_definition.push(' ');
                }
                new_word_definition.push_str(words[i]);
            }
        }

        println!("{}", new_word_definition);

        self.word_definitions.insert(new_word.to_string(), new_word_definition);

        return Ok(())

    }

    fn exec(&mut self, input: &str) -> Result {

        for token in input.split_whitespace() {
            if is_number(token) {
                self.stack.push(token.parse::<Value>().unwrap());
            }
            else if self.word_definitions.contains_key(token) {
                let def = self.word_definitions[token].clone();
                let result = self.exec(&def);
                if result.is_err() {
                    return result;
                }
            }
            else if is_word(token) {
                if token == "+" {
                    if self.stack.len() < 2 { return Err(Error::StackUnderflow); }
                    let op1 = self.stack.pop().unwrap();
                    let op2 = self.stack.pop().unwrap();
                    self.stack.push(op2 + op1);
                }
                else if token == "-" {
                    if self.stack.len() < 2 { return Err(Error::StackUnderflow); }
                    let op1 = self.stack.pop().unwrap();
                    let op2 = self.stack.pop().unwrap();
                    self.stack.push(op2 - op1);
                }
                else if token == "*" {
                    if self.stack.len() < 2 { return Err(Error::StackUnderflow); }
                    let op1 = self.stack.pop().unwrap();
                    let op2 = self.stack.pop().unwrap();
                    self.stack.push(op2 * op1);
                }
                else if token == "/" {
                    if self.stack.len() < 2 { return Err(Error::StackUnderflow); }
                    let op1 = self.stack.pop().unwrap();
                    let op2 = self.stack.pop().unwrap();
                    if op1 == 0 {
                        return Err(Error::DivisionByZero);
                    }
                    self.stack.push(op2 / op1);
                }
                else if token == "dup" {
                    if self.stack.len() < 1 { return Err(Error::StackUnderflow); }
                    else {
                        self.stack.push(*self.stack.last().unwrap())
                    }
                }
                else if token == "drop" {
                    if self.stack.len() < 1 { return Err(Error::StackUnderflow); }
                    else {
                        self.stack.pop();
                    }
                }
                else if token == "swap" {
                    if self.stack.len() < 2 { return Err(Error::StackUnderflow); }
                    else {
                        let l = self.stack.len();
                        self.stack.swap(l - 1, l - 2);
                    }
                }
                else if token == "over" {
                    if self.stack.len() < 2 { return Err(Error::StackUnderflow); }
                    else {
                        let l = self.stack.len();
                        self.stack.push (
                            self.stack[l - 2]
                        );
                    }
                }
                else {
                    return Err(Error::UnknownWord);
                }
            }
        }

        return Ok(());
    }

    pub fn stack(&self) -> &[Value] {
        self.stack.as_slice()
    }

    pub fn eval(&mut self, input: &str) -> Result {

        let input = &input.to_lowercase();

        if input.starts_with(':') {
            if !input.ends_with(';') {
                return Err(Error::UnknownWord);
            }
            else {
                let result = self.register_word_definition(input);
                if result.is_err() {
                    return result;
                }
            }
        }
        else {
            let result = self.exec(input);
            if result.is_err() {
                return result;
            }
        }

        return Ok(());
    }
}
