function wordcount(sentence)

    wc = Dict()

    pattern = r"(?<![A-Za-z0-9])'|'(?![A-Za-z0-9])|[^A-Za-z0-9']+"

    for w in eachsplit(lowercase(sentence), pattern)
        if w != ""
            if haskey(wc, w)
                wc[w] += 1
            else
                wc[w] = 1
            end
        end
    end

    return wc

end
