function plants(diagram, student)

    student_numbers = Dict(
        "Alice"   => 1,
        "Bob"     => 2,
        "Charlie" => 3,
        "David"   => 4,
        "Eve"     => 5,
        "Fred"    => 6,
        "Ginny"   => 7,
        "Harriet" => 8,
        "Ileana"  => 9,
        "Joseph"  => 10,
        "Kincaid" => 11,
        "Larry"   => 12
    )

    plant_names = Dict(
        'G' => "grass",
        'C' => "clover",
        'R' => "radishes",
        'V' => "violets"
    )

    diagram = split(diagram, '\n')

    sn = student_numbers[student]

    return [
        plant_names[diagram[1][(2 * (sn - 1)) + 1]],
        plant_names[diagram[1][(2 * (sn - 1)) + 2]],
        plant_names[diagram[2][(2 * (sn - 1)) + 1]],
        plant_names[diagram[2][(2 * (sn - 1)) + 2]]
    ]

end
