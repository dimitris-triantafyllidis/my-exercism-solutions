import Base: +, -, *, /, ==, ^, !=, <, >, <=, >=, promote_rule, convert, abs, one, zero

struct RationalNumber{T <: Integer} <: Real

    n::T
    d::T

    function RationalNumber{T}(n::T, d::T) where T <: Integer

        if d == 0
            throw(ArgumentError(""))
        end

        g = gcd(n, d)
        n = div(n, g)
        d = div(d, g)

        if d < 0
            n = -n
            d = -d
        end

        new(n, d)

    end

    function RationalNumber{T}(n::T) where T <: Integer

        RationalNumber{T}(n, one(n))

    end

end

function RationalNumber(n::T, d::T) where T <: Integer

    RationalNumber{T}(n, d)

end

function RationalNumber(n::T) where T <: Integer

    RationalNumber{T}(n, one(n))

end

promote_rule(::Type{RationalNumber{T}}, ::Type{S}) where {T<:Integer, S <: Integer} = RationalNumber{promote_type(T, S)}
promote_rule(::Type{RationalNumber{T}}, ::Type{RationalNumber{S}}) where {T <: Integer, S <: Integer} = RationalNumber{promote_type(T, S)}

convert(::Type{RationalNumber{T}}, n::Integer) where {T <: Integer} = RationalNumber(T(n))

one(::Type{RationalNumber{T}}) where {T <: Integer} = RationalNumber{T}(one(T), one(T))
zero(::Type{RationalNumber{T}}) where {T <: Integer} = RationalNumber{T}(zero(T), one(T))

one(r::RationalNumber{T}) where {T <: Integer} = RationalNumber{T}(one(T), one(T))
zero(r::RationalNumber{T}) where {T <: Integer} = RationalNumber{T}(zero(T), one(T))

+(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n * r2.d + r2.n * r1.d, r1.d * r2.d)
-(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n * r2.d - r2.n * r1.d, r1.d * r2.d)
*(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n * r2.n, r1.d * r2.d)
/(r1::RationalNumber, r2::RationalNumber) = RationalNumber(r1.n * r2.d, r1.d * r2.n)

^(r::RationalNumber, n::Integer) = RationalNumber(r.n ^ n, r.d ^ n)
^(x::Real, r::RationalNumber) = x ^ (typeof(x)(r.n) / typeof(x)(r.d))

numerator(r::RationalNumber) = r.n
denominator(r::RationalNumber) = r.d

abs(r::RationalNumber) = RationalNumber(abs(r.n), abs(r.d))

==(r1::RationalNumber, r2::RationalNumber) = r1.n == r2.n && r1.d == r2.d
>(r1::RationalNumber, r2::RationalNumber) = r1.n * r2.d > r2.n * r1.d
<(r1::RationalNumber, r2::RationalNumber) = r1.n * r2.d < r2.n * r1.d
>=(r1::RationalNumber, r2::RationalNumber) = r1.n * r2.d >= r2.n * r1.d
<=(r1::RationalNumber, r2::RationalNumber) = r1.n * r2.d <= r2.n * r1.d


