using Base.Iterators

function label(colors)

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

    ohm_value = (10*color_codes[colors[1]] + color_codes[colors[2]]) * 10^color_codes[colors[3]]

    label_metric_prefix = ndigits(ohm_value) < 4  ? "" :
                          ndigits(ohm_value) < 7  ? "kilo" :
                          ndigits(ohm_value) < 10 ? "mega" :
                                                    "giga"

    return split(string(ohm_value / 10^((3 * div(ndigits(ohm_value)-1, 3)))), r"\.0*$")[1] * " " * label_metric_prefix * "ohms"


end
