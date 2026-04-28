function onEarth(seconds)
    return seconds / (86400 * 365)
end

function onMercury(seconds)
    return onEarth(seconds) / 0.2408467
end

function onVenus(seconds)
    return onEarth(seconds) / 0.61519726
end

function onMars(seconds)
    return onEarth(seconds) / 1.8808158
end

function onJupiter(seconds)
    return onEarth(seconds) / 11.862615
end

function onSaturn(seconds)
    return onEarth(seconds) / 29.447498
end

function onUranus(seconds)
    return onEarth(seconds) / 84.016846
end

function onNeptune(seconds)
    return onEarth(seconds) / 164.79132
end