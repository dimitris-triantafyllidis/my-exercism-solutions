abstract type Pet end

struct Cat <: Pet
    name::String
end

struct Dog <: Pet
    name::String
end

name(p::Pet) = p.name

meets(a::Dog, b::Dog) = "sniffs"
meets(a::Dog, b::Cat) = "chases"
meets(a::Cat, b::Dog) = "hisses"
meets(a::Cat, b::Cat) = "slinks"
meets(a::Pet, b::Pet) = "is cautious"
meets(a::Pet, b::Any) = "runs away"
meets(a::Any, b::Any) = "nothing happens"

encounter(a, b) = name(a) * " meets " * name(b) * " and " * meets(a, b) * "."

