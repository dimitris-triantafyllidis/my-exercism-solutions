enable_realcomplex_tests = true
enable_syntaxsugar_tests = true

import Base: +, -, *, /, ==, ≈, conj, abs, exp, real, imag

struct ComplexNumber <: Number
    r
    i
    ComplexNumber(r, i) = new(r, i)
    ComplexNumber(r) = ComplexNumber(r, 0)
end

const jm = ComplexNumber(0, 1)

+(z1::ComplexNumber, z2::ComplexNumber) = ComplexNumber(z1.r + z2.r, z1.i + z2.i)
+(z1::ComplexNumber, z2::Real) = z1 + ComplexNumber(z2, 0)
+(z1::Real, z2::ComplexNumber) = ComplexNumber(z1, 0) + z2
-(z1::ComplexNumber, z2::ComplexNumber) = ComplexNumber(z1.r - z2.r, z1.i - z2.i)
-(z1::ComplexNumber, z2::Real) = z1 - ComplexNumber(z2, 0)
-(z1::Real, z2::ComplexNumber) = ComplexNumber(z1, 0) - z2
*(z1::ComplexNumber, z2::ComplexNumber) = ComplexNumber(z1.r * z2.r - z1.i * z2.i, z1.r * z2.i + z1.i * z2.r)
*(z1::ComplexNumber, z2::Real) = z1 * ComplexNumber(z2, 0)
*(z1::Real, z2::ComplexNumber) = ComplexNumber(z1, 0) * z2
/(z1::ComplexNumber, z2::ComplexNumber) = ComplexNumber((z1.r * z2.r + z1.i * z2.i) / abs(z2)^2, (-z1.r * z2.i + z1.i * z2.r) / abs(z2^2))
/(z1::ComplexNumber, z2::Real) = ComplexNumber(z1.r / z2, z1.i / z2)
/(z1::Real, z2::ComplexNumber) = ComplexNumber((z1 * z2.r) / (z2.r^2 + z2.i^2), (-z1 * z2.i) / (z2.r^2 + z2.i^2))
==(z1::ComplexNumber, z2::ComplexNumber) = z1.r == z2.r && z1.i == z2.i
≈(z1::ComplexNumber, z2::ComplexNumber) = z1.r ≈ z2.r && z1.i ≈ z2.i

abs(z::ComplexNumber) = sqrt(z.r^2 + z.i^2)
conj(z::ComplexNumber) = ComplexNumber(z.r, -z.i)
exp(z::ComplexNumber) = ComplexNumber(exp(z.r) * cos(z.i), exp(z.r) * sin(z.i))
real(z::ComplexNumber) = z.r
imag(z::ComplexNumber) = z.i