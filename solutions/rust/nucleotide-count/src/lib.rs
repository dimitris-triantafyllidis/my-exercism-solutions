use std::collections::HashMap;

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {

    if !['G', 'C', 'T', 'A'].contains(&nucleotide) {
        return Err(nucleotide)
    }

    let mut cnt: usize = 0;

    for c in dna.chars() {
        if c == nucleotide {
            cnt += 1;
        } else if !['G', 'C', 'T', 'A'].contains(&c) {
            return Err(c);
        }
    }

    return Ok(cnt);

}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {

    let res_ng = count('G', dna);
    let res_nc = count('C', dna);
    let res_nt = count('T', dna);
    let res_na = count('A', dna);

    match (res_ng, res_nc, res_nt, res_na) {
        (Ok(ng), Ok(nc), Ok(nt), Ok(na)) => Ok (HashMap::from([('G', ng), ('C', nc), ('T', nt), ('A', na)])),
        (Err(c), _, _, _) => Err(c),
        _ => unreachable!()
    }

}
