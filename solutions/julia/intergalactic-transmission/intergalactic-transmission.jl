function get_transmit_sequence(message)

    transmit_sequence = reduce(*, [bitstring(UInt8(byte)) for byte in message])
    transmit_sequence = [transmit_sequence[i:min(i+6, length(transmit_sequence))] for i in 1:7:length(transmit_sequence)]
    transmit_sequence = [byte * (count(c -> c == '1', byte) % 2 == 0 ? '0'^(7 - length(byte)) * '0' : '0'^(7 - length(byte)) * '1') for byte in transmit_sequence]
    transmit_sequence = [parse(UInt8, byte; base=2) for byte in transmit_sequence]

    return transmit_sequence

end

function decode_sequence(received_seq)

    if received_seq == []
        return []
    end

    for i in eachindex(received_seq)
        if count_ones(received_seq[i]) % 2 == 0
            continue
        else
            throw(ErrorException(""))
        end
    end

    decoded_sequence = reduce(*, [bitstring(UInt8(byte)) for byte in received_seq])
    n_decoded_bytes = div(length(decoded_sequence) * 7, 64)
    decoded_sequence = [decoded_sequence[i:i+6] for i in 1:8:(length(decoded_sequence)-8)]
    decoded_sequence = reduce(*, decoded_sequence)
    n_residual_bits = n_decoded_bytes * 8 - length(decoded_sequence)

    if n_residual_bits > 0
        decoded_sequence = decoded_sequence * bitstring(UInt8(received_seq[end]))[1:n_residual_bits]
    end

    decoded_sequence = [parse(UInt8, decoded_sequence[i:i+7]; base=2) for i in 1:8:length(decoded_sequence)]

    return decoded_sequence

end
