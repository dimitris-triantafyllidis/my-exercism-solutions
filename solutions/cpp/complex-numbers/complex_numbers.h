#pragma once

namespace complex_numbers {

    class Complex {

    public:

        Complex(double r);
        Complex(double r, double i);

        auto real() const -> double;
        auto imag() const -> double;

        auto conj() const -> Complex;
        auto abs() const -> double;

        auto exp() const -> Complex;

    private:

        double m_r;
        double m_i;

    };

    auto operator+(const Complex &z1, const Complex &z2) -> Complex;
    auto operator-(const Complex &z1, const Complex &z2) -> Complex;
    auto operator*(const Complex &z1, const Complex &z2) -> Complex;
    auto operator/(const Complex &z1, const Complex &z2) -> Complex;

}  // namespace complex_numbers
