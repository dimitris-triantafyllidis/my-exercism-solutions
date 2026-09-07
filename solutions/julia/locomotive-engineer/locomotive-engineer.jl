function get_vector_of_wagons(args...)
    return [arg for arg in args]
end

function fix_vector_of_wagons(each_wagons_id, missing_wagons)
    fixed_vector_of_wagons = []
    append!(fixed_vector_of_wagons, each_wagons_id[3])
    append!(fixed_vector_of_wagons, missing_wagons)
    append!(fixed_vector_of_wagons, each_wagons_id[4:end])
    append!(fixed_vector_of_wagons, each_wagons_id[1])
    append!(fixed_vector_of_wagons, each_wagons_id[2])
    return fixed_vector_of_wagons
end

function add_missing_stops(route, stops...)
    fixed_route = Dict{String, Any}()
    push!(fixed_route, "from" => route["from"])
    push!(fixed_route, "to" => route["to"])
    push!(fixed_route, "stops" => [stop.second for stop in stops])
    return fixed_route
end

function extend_route_information(route; more_route_information...)
    extended_route_info = Dict{Any, String}()
    push!(extended_route_info, "from" => route["from"])
    push!(extended_route_info, "to" => route["to"])
    for info in more_route_information
        push!(extended_route_info, info)
    end
    return extended_route_info
end
