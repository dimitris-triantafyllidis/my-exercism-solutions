function isisogram(s)
    s = replace(s, "-" => "", " " => "")
    length(s) == length(Set([c for c in lowercase(s)]))
end
