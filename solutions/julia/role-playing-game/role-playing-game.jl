StringOrMissing = Union{Missing, String}
IntOrNothing = Union{Nothing, Int}

@kwdef mutable struct Player
    name   :: StringOrMissing = missing
    level  :: Int64           = 0
    health :: Int64           = 100
    mana   :: IntOrNothing    = nothing
end

function introduce(player::Player)
    return ismissing(player.name) ? "Mighty Magician" : player.name
end

function increment(mana::IntOrNothing)
    return isnothing(mana) ? 50 : 100 + mana
end

function increment(name::StringOrMissing)
    return ismissing(name) ? "The Great" : (name * " the Great")
end

function title!(player::Player)
    if player.level == 42
        player.name = increment(player.name)
    end
    return player.name
end

function revive!(player::Player)
    if player.health == 0
        player.health = 100
        player.mana = increment(player.mana)
    end
    return player
end
