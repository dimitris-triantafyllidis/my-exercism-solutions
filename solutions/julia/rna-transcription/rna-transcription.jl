function to_rna(dna)
    if Set(n for n in dna) ⊆ Set(['G', 'C', 'T', 'A'])
        return replace(dna, "G" => "C", "C" => "G", "T" => "A", "A" => "U")
    else
        throw(ErrorException(""))
    end
end

