"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    counts = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)

    for c in strand
        if haskey(counts, c)
            counts[c] += 1
        else
            throw(DomainError(strand))
        end
    end

    return counts
end
