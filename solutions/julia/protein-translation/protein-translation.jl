function proteins(strand)
    codon_map = Dict(
        "AUG" => "Methionine",
        "UUU" => "Phenylalanine",
        "UUC" => "Phenylalanine",
        "UUA" => "Leucine",
        "UUG" => "Leucine",
        "UCU" => "Serine",
        "UCC" => "Serine",
        "UCA" => "Serine",
        "UCG" => "Serine",
        "UAU" => "Tyrosine",
        "UAC" => "Tyrosine",
        "UGU" => "Cysteine",
        "UGC" => "Cysteine",
        "UGG" => "Tryptophan",
        "UAA" => "STOP",
        "UAG" => "STOP",
        "UGA" => "STOP"
    )

    amino_acids = []

    for i in 1:3:length(strand)
        codon = strand[i:min(i+2, length(strand))]

        if length(codon) != 3
            throw(DomainError(""))
        end

        if haskey(codon_map, codon)
            if codon_map[codon] == "STOP"
                return amino_acids
            else
                push!(amino_acids, codon_map[codon])
            end
        else
            throw(DomainError(""))
        end
    end

    return amino_acids

end
