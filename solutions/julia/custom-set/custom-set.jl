import Base: isempty, in, issubset, ==, push!, intersect, intersect!, length, iterate, copy, intersect!

mutable struct CustomSet <: AbstractSet{Int}

    e::Vector{Int}

    function CustomSet(elements::AbstractVector)
        new(unique(elements))
    end

end

iterate(s::CustomSet, state = 1) = state > length(s.e) ? nothing : (s.e[state], state + 1)

isempty(s::CustomSet) = isempty(s.e)

length(s::CustomSet) = length(s.e)

in(element, set::CustomSet) = element in set.e

disjoint(s1::CustomSet, s2::CustomSet) = filter(e -> e ∉ s2, s1.e) == s1.e

function intersect!(s1::CustomSet, s2::CustomSet)
    s1.e = [e for e in s1 if e ∈ s2]
    return s1
end

complement(s1::CustomSet, s2::CustomSet) = CustomSet([e for e in s1 if e ∉ s2])

function complement!(s1::CustomSet, s2::CustomSet)
    s1.e = [e for e in s1 if e ∉ s2]
    return s1
end

copy(s::CustomSet) = CustomSet(s.e)

==(s1::CustomSet, s2::CustomSet) = sort(s1.e) == sort(s2.e)

function push!(s::CustomSet, e::Int)
    if !(e in s)
        push!(s.e, e)
    end
    return s
end
