struct ISBN

    digits::NTuple{10, UInt8}

    function ISBN(s::String)

        if length(s) == 13 && s[2] == s[6] == s[12] == '-'
            s = s[1:1] * s[3:5] * s[7:11] * s[13]
        elseif length(s) != 10
            throw(DomainError(s))
        end

        d = ntuple(i -> begin
            c = s[i]
            if isdigit(c)
                UInt8(c - '0')
            elseif c == 'X' && i == 10
                UInt8(10)
            else
                throw(DomainError("Invalid ISBN character"))
            end
        end, 10)

        is_valid = (d[1] * 10 + d[2] * 9 + d[3] * 8 + d[4] * 7 + d[5] * 6 + d[6] * 5 + d[7] * 4 + d[8] * 3 + d[9] * 2 + d[10] * 1) % 11 == 0

        if !is_valid
            throw(DomainError("Invalid ISBN"))
        end

        return new(d)

    end

end
