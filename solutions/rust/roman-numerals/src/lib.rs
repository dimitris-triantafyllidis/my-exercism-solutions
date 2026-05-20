use std::fmt::{Display, Formatter, Result};

pub struct Roman {
    n: u32
}

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {

        let mut roman = String::new();

        let number = self.n;
        let thousands = number / 1000;
        let number = number - 1000 * thousands;
        let hundreds = number / 100;
        let number = number - 100 * hundreds;
        let tens = number / 10;
        let number = number - 10 * tens;
        let units = number;

        // Thousands

        roman.push_str("M".repeat(thousands as usize).as_str());

        // Hundreds

        if hundreds == 9 {
            roman.push_str("CM");
        } else if hundreds == 4 {
            roman.push_str("CD");
        } else if hundreds >= 5 {
            roman.push('D');
            roman.push_str("C".repeat((hundreds - 5) as usize).as_str());
        } else if hundreds >= 1 {
            roman.push_str("C".repeat(hundreds as usize).as_str());
        }

        // Tens

        if tens == 9 {
            roman.push_str("XC");
        } else if tens == 4 {
            roman.push_str("XL");
        } else if tens >= 5 {
            roman.push('L');
            roman.push_str("X".repeat((tens - 5) as usize).as_str());
        } else if tens >= 1 {
            roman.push_str("X".repeat(tens as usize).as_str());
        }

        // Units

        if units == 9 {
            roman.push_str("IX");
        } else if units == 4 {
            roman.push_str("IV");
        } else if units >= 5 {
            roman.push('V');
            roman.push_str("I".repeat((units - 5) as usize).as_str());
        } else if units >= 1 {
            roman.push_str("I".repeat(units as usize).as_str());
        }

        write!(_f, "{}", roman)

    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        Self { n: num }
    }
}
