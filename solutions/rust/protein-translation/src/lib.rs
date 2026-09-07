pub fn translate(rna: &str) -> Option<Vec<&'static str>> {

    let mut proteins = Vec::new();

    for chunk in rna.as_bytes().chunks(3) {

        if chunk.len() != 3 {
            return None;
        }

        let codon = std::str::from_utf8(chunk).ok()?;

        let protein = match codon {
            "AUG"                         => "Methionine",
            "UUU" | "UUC"                 => "Phenylalanine",
            "UUA" | "UUG"                 => "Leucine",
            "UCU" | "UCC" | "UCA" | "UCG" => "Serine",
            "UAU" | "UAC"                 => "Tyrosine",
            "UGU" | "UGC"                 => "Cysteine",
            "UGG"                         => "Tryptophan",
            "UAA" | "UAG" | "UGA"         => return Some(proteins),
            _                             => return None
        };

        proteins.push(protein);
    }

    return Some(proteins);
}
