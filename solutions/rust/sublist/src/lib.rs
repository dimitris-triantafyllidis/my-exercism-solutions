#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist(first_list: &[i32], second_list: &[i32]) -> Comparison {

    if first_list == second_list {
        return Comparison::Equal;
    }

    let l1 = first_list.len();
    let l2 = second_list.len();

    if first_list.len() < second_list.len() {
        for i in 0..=l2 - l1 {
            if *first_list == second_list[i..i+l1] {
                return Comparison::Sublist;
            }
        }
    }

    if first_list.len() > second_list.len() {
        for i in 0..=l1 - l2 {
            if *second_list == first_list[i..i+l2] {
                return Comparison::Superlist;
            }
        }
    }

    return Comparison::Unequal;

}
