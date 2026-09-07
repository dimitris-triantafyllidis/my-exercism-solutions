#[derive(PartialEq, Eq, Debug)]
pub enum Bucket {
    One,
    Two
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
    loop {
        if m.is_multiple_of(d) && n.is_multiple_of(d) {
            break;
        }
        d -= 1;
    }
    d
}

/// Solve the bucket problem
pub fn solve(
    capacity_1: u8,
    capacity_2: u8,
    goal: u8,
    start_bucket: &Bucket,
) -> Option<BucketStats> {

    let small_bucket = if capacity_1 < capacity_2 { Bucket::One } else { Bucket::Two };
    let big_bucket   = if capacity_1 < capacity_2 { Bucket::Two } else { Bucket::One };

    let capacity_small = if capacity_1 < capacity_2 { capacity_1 } else { capacity_2 };
    let capacity_big   = if capacity_1 < capacity_2 { capacity_2 } else { capacity_1 };

    if goal > capacity_big {
        return None;
    }

    let mut content_small: u8 = if *start_bucket == small_bucket { capacity_small } else { 0 };
    let mut content_big:   u8 = if *start_bucket == big_bucket   { capacity_big   } else { 0 };

    let mut moves: u8 = 1;

    if content_small == goal { return Some ( BucketStats { moves: 1, goal_bucket: small_bucket, other_bucket: content_big   } ); }
    if content_big   == goal { return Some ( BucketStats { moves: 1, goal_bucket: big_bucket,   other_bucket: content_small } ); }

    if goal == capacity_small {
        if *start_bucket == small_bucket {
            return Some ( BucketStats { moves: 1, goal_bucket: small_bucket, other_bucket: content_big } );
        } else {
            return Some ( BucketStats { moves: 2, goal_bucket: small_bucket, other_bucket: content_big } );
        }
    }

    if goal == capacity_big {
        if *start_bucket == big_bucket {
            return Some ( BucketStats { moves: 1, goal_bucket: big_bucket, other_bucket: content_small } );
        } else {
            return Some ( BucketStats { moves: 2, goal_bucket: big_bucket, other_bucket: content_small } );
        }
    }

    if !goal.is_multiple_of(gcd(capacity_1, capacity_2)) {
        return None;
    }

    if *start_bucket == big_bucket {

        loop {
            if content_big < capacity_small - content_small {    // We can't fill the small bucket from the big bucket

                content_small += content_big;                    // Empty the big bucket to the small bucket
                content_big = 0;
                moves += 1;

                if content_small == goal { return Some ( BucketStats { moves: moves, goal_bucket: small_bucket, other_bucket: content_big } ); }

                content_big = capacity_big;                      // Fill the big bucket
                moves += 1;

                if content_big == goal { return Some ( BucketStats { moves: moves, goal_bucket: big_bucket, other_bucket: content_small } ); }

            } else {

                content_big   -= capacity_small - content_small; // Empty the big bucket to the small bucket
                content_small += capacity_small - content_small;
                moves += 1;

                if content_small == goal { return Some ( BucketStats { moves: moves, goal_bucket: small_bucket, other_bucket: content_big } ); }
                if content_big   == goal { return Some ( BucketStats { moves: moves, goal_bucket: big_bucket, other_bucket: content_small } ); }

                content_small = 0;                               // Empty the small bucket
                moves += 1;

            }
        }
    } else {

        loop {
            if content_small > capacity_big - content_big {      // We can't empty the small bucket to the big bucket

                content_small -= capacity_big - content_big;     // Fill the big bucket from the small bucket
                content_big = capacity_big;
                moves += 1;

                if content_small == goal { return Some ( BucketStats { moves: moves, goal_bucket: small_bucket, other_bucket: content_big } ); }
                if content_big   == goal { return Some ( BucketStats { moves: moves, goal_bucket: big_bucket, other_bucket: content_small } ); }

                content_big = 0;                                 // Empty the big bucket
                moves += 1;

            } else {

                content_big += content_small;                    // Empty the small bucket to the big bucket
                content_small = 0;
                moves += 1;

                if content_big == goal { return Some ( BucketStats { moves: moves, goal_bucket: big_bucket, other_bucket: content_small } ); }

                content_small = capacity_small;                  // Fill the small bucket
                moves += 1;

                if content_small == goal { return Some ( BucketStats { moves: moves, goal_bucket: small_bucket, other_bucket: content_big } ); }

            }
        }
    }

}
