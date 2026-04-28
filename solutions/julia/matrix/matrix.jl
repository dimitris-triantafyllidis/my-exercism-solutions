function matrix(strmatrix)

    lines   = split(strmatrix, '\n')
    rows    = [[parse(Int, n) for n in split(line, ' ')] for line in lines]
    columns = [[row[c] for row in rows ] for c in eachindex(rows[1])]

    rows, columns

end


