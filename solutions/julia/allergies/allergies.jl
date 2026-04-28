const allergen_scores = Dict(
    "eggs"         =>   1,
    "peanuts"      =>   2,
    "shellfish"    =>   4,
    "strawberries" =>   8,
    "tomatoes"     =>  16,
    "chocolate"    =>  32,
    "pollen"       =>  64,
    "cats"         => 128
)

function allergic_to(score, allergen)
    return score & allergen_scores[allergen] != 0
end

function allergy_list(score)
    return Set([p[1] for p in allergen_scores if score & allergen_scores[p[1]] != 0])
end
