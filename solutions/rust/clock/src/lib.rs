use std::fmt;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Clock {
    h: i32,
    m: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let (h, m) = normalize(hours, minutes);
        Clock { h, m }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(self.h, self.m + minutes)
    }
}

fn normalize(h: i32, m: i32) -> (i32, i32) {
    let total = h * 60 + m;
    let minutes = ((total % 1440) + 1440) % 1440;

    (minutes / 60, minutes % 60)
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.h, self.m)
    }
}
