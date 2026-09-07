const E = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0;
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0;
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0;
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
]

function frown!(E)
    e = vcat(
        E[1:6, :] ,
        E[9:9, :] ,
        E[8:8, :] ,
        E[7:7, :] ,
        E[10:11, :]
    )
    E .= e
    return E
end

function frown(E)
    return vcat(
        E[1:6, :] ,
        E[9:9, :] ,
        E[8:8, :] ,
        E[7:7, :] ,
        E[10:11, :]
    )
end

function stickerwall(E)
    return vcat(
        [E frown(E)], ones(1, 36), [frown(E) E]
    )
end

function colpixelcount(E)
    return E .* sum(E, dims=1)
end

function render(E)
    return join([join(x == 0 ? " " : "X" for x in row) for row in eachrow(E)], "\n")
end

