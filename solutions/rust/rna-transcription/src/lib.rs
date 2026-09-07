#[derive(Debug, PartialEq, Eq)]
pub struct Dna {
    sequence: String
}

#[derive(Debug, PartialEq, Eq)]
pub struct Rna {
    sequence: String
}

impl Dna {

    pub fn new(dna: &str) -> Result<Dna, usize> {
        let mut sequence = String::new();
        for (i, c) in dna.chars().enumerate() {
            if ['G', 'C', 'T', 'A'].contains(&c) {
                sequence.push(c);
            } else {
                return Err(i);
            }
        }
        return Ok(Self{sequence});
    }

    pub fn into_rna(self) -> Rna {
        let mut sequence = String::new();
        for c in self.sequence.chars() {
            match c {
                'G' => sequence.push('C'),
                'C' => sequence.push('G'),
                'T' => sequence.push('A'),
                'A' => sequence.push('U'),
                _ => unreachable!(),
            }
        }
        return Rna { sequence };
    }
}

impl Rna {

    pub fn new(rna: &str) -> Result<Rna, usize> {
        let mut sequence = String::new();
        for (i, c) in rna.chars().enumerate() {
            if ['G', 'C', 'U', 'A'].contains(&c) {
                sequence.push(c);
            } else {
                return Err(i);
            }
        }
        return Ok(Self{sequence});
    }

}
