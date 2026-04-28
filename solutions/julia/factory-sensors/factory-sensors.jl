function humiditycheck(pct_humidity)
    if pct_humidity <= 70
        @info "humidity level check passed: " * string(pct_humidity) * "%"
    else
        throw(ErrorException("[ERROR] humidity check failed: " * string(pct_humidity) * "%"))
    end
end

function temperaturecheck(temperature)
    if isnothing(temperature)
        throw(ArgumentError("[ERROR] sensor is broken"))
    elseif temperature > 500
        throw(DomainError("[ERROR] overheating detected: " * string(temperature) * " °C"))
    else
        @info "temperature check passed: " * string(temperature) * " °C"
    end
end

struct MachineError <: Exception end

function machinemonitor(pct_humidity, temperature)

    t = false

    try
        humiditycheck(pct_humidity)
    catch e
        t = true
        if e isa ErrorException
            @error "humidity level check failed: " * string(pct_humidity) * "%"
        end
    end

    try
        temperaturecheck(temperature)
    catch e
        t = true
        if e isa ArgumentError
            @warn "sensor is broken"
        elseif e isa DomainError
            @error "overheating detected: " * string(temperature) * " °C"
        end
    end

    if t == true
        throw(MachineError())
    end
end
