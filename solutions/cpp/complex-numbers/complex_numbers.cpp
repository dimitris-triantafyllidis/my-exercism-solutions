#include "complex_numbers.h"

#include <cmath>

namespace complex_numbers {


    Complex::Complex(double r) : m_r(r), m_i(0) {};
    Complex::Complex(double r, double i) : m_r(r), m_i(i) {}

    auto Complex::real() const -> double { return m_r; }
    auto Complex::imag() const -> double { return m_i; }

    auto Complex::conj() const -> Complex { return Complex(m_r, -m_i); }
    auto Complex::abs() const  -> double { return std::sqrt(m_r * m_r + m_i * m_i); };

    auto operator+(const Complex &z1, const Complex &z2) -> Complex {
        return Complex(z1.real() + z2.real(), z1.imag() + z2.imag());
    }

    auto operator-(const Complex &z1, const Complex &z2) -> Complex {
        return Complex(z1.real() - z2.real(), z1.imag() - z2.imag());
    }

    auto operator*(const Complex &z1, const Complex &z2) -> Complex {
        return Complex (
            z1.real() * z2.real() - z1.imag() * z2.imag(),
            z1.real() * z2.imag() + z1.imag() * z2.real()
        );
    }

    auto operator/(const Complex &z1, const Complex &z2) -> Complex {
        return Complex (
           (z1 * z2.conj()).real() / (z2.abs() * z2.abs()),
           (z1 * z2.conj()).imag() / (z2.abs() * z2.abs())
        );
    }

    auto Complex::exp() const -> Complex {
        return Complex (
            std::exp(m_r) * std::cos(m_i),
            std::exp(m_r) * std::sin(m_i)
        );
    }

}  // namespace complex_numbers
