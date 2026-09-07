use std::collections::HashMap;

pub struct School {
    students: HashMap<String, u32>
}

impl School {

    pub fn new() -> School {
        Self { students: HashMap::new() }
    }

    pub fn add(&mut self, grade: u32, student: &str) {
        if !self.students.contains_key(student) {
            self.students.insert(student.to_string(), grade);
        }
    }

    pub fn grades(&self) -> Vec<u32> {
        let mut vg = Vec::<u32>::new();
        for (_, g) in &self.students {
            if !vg.contains(g) {
                vg.push(*g);
            }
        }
        vg.sort();
        vg
    }

    pub fn grade(&self, grade: u32) -> Vec<String> {
        let mut vn = Vec::<String>::new();
        for (n, g) in &self.students {
            if *g == grade {
                vn.push(n.to_string());
            }
        }
        vn.sort();
        vn
    }

}
