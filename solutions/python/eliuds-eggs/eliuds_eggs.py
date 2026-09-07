def egg_count(display_value):

    cnt = 0
    n = display_value.bit_length()

    for i in range(0, n):
        if (display_value >> i) & 1:
            cnt += 1

    return cnt

