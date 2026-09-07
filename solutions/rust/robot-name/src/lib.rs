use std::collections::HashSet;
use std::rc::Rc;
use std::cell::RefCell;

use rand::Rng;
use rand::RngExt;

fn generate_name<R: Rng>(rng: &mut R, used_names: &mut HashSet<String>) -> String {

    loop {
        let mut s = String::with_capacity(5);
        for _ in 0..2 {
            s.push(rng.random_range('A'..='Z'));
        }
        for _ in 0..3 {
            s.push(rng.random_range('0'..='9'));
        }
        if used_names.insert(s.clone()) {
            return s;
        }
    }

}

pub struct RobotFactory {
    used_names: Rc<RefCell<HashSet<String>>>,
}

pub struct Robot {
    used_names: Rc<RefCell<HashSet<String>>>,
    name: String,
}

impl RobotFactory {

    pub fn new() -> Self {
        Self {
            used_names: Rc::new(RefCell::new(HashSet::new())),
        }
    }

    pub fn new_robot<R: Rng>(&mut self, rng: &mut R) -> Robot {
        let mut used = self.used_names.borrow_mut();
        Robot {
            used_names: Rc::clone(&self.used_names),
            name: generate_name(rng, &mut used),
        }
    }

}

impl Robot {

    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn reset<R: Rng>(&mut self, rng: &mut R) {
        let mut used_names = self.used_names.borrow_mut();
        let new_name = generate_name(rng, &mut used_names);
        used_names.remove(&self.name);
        self.name = new_name
    }

}
