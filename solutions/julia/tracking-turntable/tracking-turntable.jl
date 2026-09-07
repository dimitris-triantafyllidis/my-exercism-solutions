function z(x, y)
    return Complex(x, y)
end

function euler(r, θ)
    return Complex(r*cos(θ), r*sin(θ))
end

function rotate(x, y, θ)
    z = Complex(x, y) * euler(1, θ)
    return reim(z)
end

function rdisplace(x, y, r)
    return reim(Complex(x, y) + euler(r, angle(Complex(x, y))))
end

function findsong(x, y, r, θ)
    (xr, yr) = rdisplace(x, y, r)
    return rotate(xr, yr, θ)
end
