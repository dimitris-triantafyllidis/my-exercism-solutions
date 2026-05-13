use std::collections::HashMap;

pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {

    let student_numbers: HashMap<&str, usize> = [
        ("Alice", 1),
        ("Bob", 2),
        ("Charlie", 3),
        ("David", 4),
        ("Eve", 5),
        ("Fred", 6),
        ("Ginny", 7),
        ("Harriet", 8),
        ("Ileana", 9),
        ("Joseph", 10),
        ("Kincaid", 11),
        ("Larry", 12),
    ]
    .into_iter()
    .collect();

    let plant_names: HashMap<char, &str> = [
        ('G', "grass"),
        ('C', "clover"),
        ('R', "radishes"),
        ('V', "violets"),
    ]
    .into_iter()
    .collect();

    let rows: Vec<&str> = diagram.split('\n').collect();

    let sn = student_numbers[student];
    let idx = 2 * (sn - 1);

    vec![
        plant_names[&rows[0].chars().nth(idx).unwrap()],
        plant_names[&rows[0].chars().nth(idx + 1).unwrap()],
        plant_names[&rows[1].chars().nth(idx).unwrap()],
        plant_names[&rows[1].chars().nth(idx + 1).unwrap()],
    ]

}
