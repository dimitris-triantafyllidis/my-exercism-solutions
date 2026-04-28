using Random

mutable struct Robot
    name::String

    Robot() = new(generate_robot_name())
end

rng = MersenneTwister(0)

generate_robot_name() =
    Char('A' + rand(rng, 0:25)) *
    Char('A' + rand(rng, 0:25)) *
    Char('0' + rand(rng, 0:9)) *
    Char('0' + rand(rng, 0:9)) *
    Char('0' + rand(rng, 0:9))

function reset!(instance::Robot)
    instance.name = generate_robot_name()
end

function name(instance::Robot)
    instance.name
end
