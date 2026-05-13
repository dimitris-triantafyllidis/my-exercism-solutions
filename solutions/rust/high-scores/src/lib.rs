#[derive(Debug)]
pub struct HighScores {
    scores: Vec<u32>
}

impl HighScores {
    pub fn new(scores: &[u32]) -> Self {
        Self { scores: scores.to_vec() }
    }

    pub fn scores(&self) -> &[u32] {
        &self.scores
    }

    pub fn latest(&self) -> Option<u32> {
        if !self.scores.is_empty() {
            Some ( self.scores[self.scores.len() - 1] )
        } else {
            None
        }
    }

    pub fn personal_best(&self) -> Option<u32> {
        if !self.scores.is_empty() {
            Some ( self.scores.iter().copied().max()? )
        } else {
            None
        }
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        if self.scores.is_empty() {
            Vec::<u32>::new()
        } else {
            let mut sorted = self.scores.clone();
            sorted.sort_unstable_by(|a, b| b.cmp(a));
            sorted.truncate(3);
            sorted
        }
    }
}
