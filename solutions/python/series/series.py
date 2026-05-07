def slices(series, length):
    if series == "":
        raise ValueError("series cannot be empty")
    elif length > len(series):
        raise ValueError("slice length cannot be greater than series length")
    elif length == 0:
        raise ValueError("slice length cannot be zero")
    elif length < 0:
        raise ValueError("slice length cannot be negative")
    else:
        ss = []
        for i in range(0, len(series) - length + 1):
            ss += [series[i : i + length]]
        return ss

