function detect_anagrams(subject, candidates)
    return filter(candidate -> (lowercase(subject) != lowercase(candidate)) && (sort(collect(lowercase(candidate))) == sort(collect(lowercase(subject)))), candidates)
end
