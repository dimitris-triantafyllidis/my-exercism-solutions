#[derive(Debug)]
pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht
}

type Dice = [u8; 5];

fn face_counts(dice: &Dice) -> [u8; 7] {
    let mut counts = [0u8; 7];
    for &d in dice {
        counts[d as usize] += 1;
    }
    counts
}

pub fn score(dice: Dice, category: Category) -> u8 {
    match category {
        Category::Ones   => dice.iter().filter(|&&n| n == 1).count() as u8 * 1,
        Category::Twos   => dice.iter().filter(|&&n| n == 2).count() as u8 * 2,
        Category::Threes => dice.iter().filter(|&&n| n == 3).count() as u8 * 3,
        Category::Fours  => dice.iter().filter(|&&n| n == 4).count() as u8 * 4,
        Category::Fives  => dice.iter().filter(|&&n| n == 5).count() as u8 * 5,
        Category::Sixes  => dice.iter().filter(|&&n| n == 6).count() as u8 * 6,

        Category::LittleStraight => {
            let mut s = dice;
            s.sort_unstable();
            if s == [1, 2, 3, 4, 5] { 30 } else { 0 }
        }

        Category::BigStraight => {
            let mut s = dice;
            s.sort_unstable();
            if s == [2, 3, 4, 5, 6] { 30 } else { 0 }
        }

        Category::Choice => dice.iter().sum(),

        Category::Yacht => {
            if dice.iter().all(|&n| n == dice[0]) { 50 } else { 0 }
        }

        Category::FourOfAKind => {
            let counts = face_counts(&dice);
            for face in 1..=6 {
                if counts[face] >= 4 {
                    return (face * 4) as u8;
                }
            }
            0
        }

        Category::FullHouse => {
            let counts = face_counts(&dice);

            let mut has_three = false;
            let mut has_two   = false;

            for &c in &counts[1..] {
                if c == 3 { has_three = true; }
                if c == 2 { has_two   = true; }
            }

            if has_three && has_two {
                dice.iter().sum()
            } else {
                0
            }
        }
    }
}

