function colorcode(colors)

    color_codes = Dict(
        "black" => 0,
        "brown" => 1,
        "red" => 2,
        "orange" => 3,
        "yellow" => 4,
        "green" => 5,
        "blue" => 6,
        "violet" => 7,
        "grey" => 8,
        "white" => 9
    )

    return 10*color_codes[colors[1]] + color_codes[colors[2]]

end
