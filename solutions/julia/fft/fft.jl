using Base

dft_weight(k::Integer, n::Integer) = Complex(cos(-2 * pi * k / n), sin(-2 * pi * k / n))

function butterfly_radix_2!(data::Vector{Complex{Float64}}, index::Integer, stride::Integer, weight::Complex{Float64})
    temp                 = data[index] + weight * data[index + stride];
    data[index + stride] = data[index] - weight * data[index + stride];
    data[index + 0]      = temp;
    nothing
end

function reverse_bits(n::UInt32)
    rev = UInt32(0x00000000)
    for _ in 1:32
        rev = (rev << 1) | (n & 0x1)
        n >>= 1
    end
    return rev
end


function dft(data::Vector{Float64})

    result = [Complex(0.0) for r in data]

    for k in eachindex(result)
        for n in eachindex(data)
            result[k] += data[n] * dft_weight((k-1) * (n-1), length(data))
        end
    end

    return result

end

function fft(data::Vector{Float64})

    result = [Complex(0.0) for r in data]
    n = length(data)
    log2_n = trailing_zeros(length(data))

    for i in eachindex(data)
        result[i] = Complex(data[(Int(reverse_bits(UInt32(i-1))) >> (32 - log2_n)) + 1])
    end

    for pass in 1:log2_n
        n_batches = div(n, 2^pass)
        batch_stride = 2^(pass-1)
        batch_size = 2^(pass-1)
        for batch in 1:n_batches
            index_base = (batch - 1) * (batch_stride + batch_size)
            for butterfly in 1:batch_size
                butterfly_radix_2!(result, index_base + butterfly, batch_stride, dft_weight(butterfly - 1, batch_size * 2))
            end
        end
    end

    return result

end
