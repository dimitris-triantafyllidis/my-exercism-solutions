#[derive(PartialEq, Eq, Debug)]
pub enum Bucket {
    One,
    Two,
}

/// A struct to hold your results in.
#[derive(PartialEq, Eq, Debug)]
pub struct BucketStats {
    /// The total number of "moves" it should take to reach the desired number of liters, including
    /// the first fill.
    pub moves: u8,
    /// Which bucket should end up with the desired number of liters? (Either "one" or "two")
    pub goal_bucket: Bucket,
    /// How many liters are left in the other bucket?
    pub other_bucket: u8,
}

fn gcd(m: u8, n: u8) -> u8 {
    let mut d = m.min(n);
    loop { if m.is_multiple_of(d) && n.is_multiple_of(d) { break; } d -= 1; }
    d
}

/// Solve the bucket problem
pub fn solve(
    capacity_1: u8,
    capacity_2: u8,
    goal: u8,
    start_bucket: &Bucket,
) -> Option<BucketStats> {

    let mut content_1: u8 = if *start_bucket == Bucket::One { capacity_1 } else { 0 };
    let mut content_2: u8 = if *start_bucket == Bucket::Two { capacity_2 } else { 0 };
    let mut moves: u8 = 1;

    if content_1 == goal { return Some ( BucketStats { moves: 1, goal_bucket: Bucket::One, other_bucket: 0 } ); }
    if content_2 == goal { return Some ( BucketStats { moves: 1, goal_bucket: Bucket::Two, other_bucket: 0 } ); }

    if gcd(capacity_1, capacity_2).is_multiple_of(goal) {
        return None;
    }

    if capacity_1 < capacity_2 {
        if *start_bucket == Bucket::Two {
            loop {
                content_2 -= capacity_1 - content_1; // Empty the big bucket to the small bucket
                content_1 = capacity_1;
                moves += 1;

                println!("{}", moves);

                if content_2 == goal {
                    return Some ( BucketStats { moves: moves, goal_bucket: Bucket::Two, other_bucket: content_1 } );
                }

                moves += 1; // Empty the small bucket

                if content_2 < capacity_1 {
                    content_1 = content_2; // Empty the big bucket to the small bucket
                    content_2 = 0;
                    moves += 1;

                    content_2 = capacity_2; // Fill the big bucket
                    moves += 1;

                    content_2 -= capacity_1 - content_1;
                    moves += 1;
                    if content_2 == goal {
                        return Some ( BucketStats { moves: moves, goal_bucket: Bucket::Two, other_bucket: content_1 } );
                    }
                }
            }
        }
    }


    None

}
