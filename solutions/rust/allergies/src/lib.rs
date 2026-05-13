pub struct Allergies {
    score: u32
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Self { score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.score & (1 << (*allergen as u32)) != 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {

        let mut a = Vec::<Allergen>::new();

        if self.is_allergic_to ( &Allergen::Eggs         ) { a.push(Allergen::Eggs         ); }
        if self.is_allergic_to ( &Allergen::Peanuts      ) { a.push(Allergen::Peanuts      ); }
        if self.is_allergic_to ( &Allergen::Shellfish    ) { a.push(Allergen::Shellfish    ); }
        if self.is_allergic_to ( &Allergen::Strawberries ) { a.push(Allergen::Strawberries ); }
        if self.is_allergic_to ( &Allergen::Tomatoes     ) { a.push(Allergen::Tomatoes     ); }
        if self.is_allergic_to ( &Allergen::Chocolate    ) { a.push(Allergen::Chocolate    ); }
        if self.is_allergic_to ( &Allergen::Pollen       ) { a.push(Allergen::Pollen       ); }
        if self.is_allergic_to ( &Allergen::Cats         ) { a.push(Allergen::Cats         ); }

        a
    }
}
