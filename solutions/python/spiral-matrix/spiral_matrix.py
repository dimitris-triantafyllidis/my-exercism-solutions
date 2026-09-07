def spiral_matrix(size):

    m = [[0] * size for _ in range(size)]

    run_count  = 0
    run_length = size
    direction  = 0

    step = 1
    run_step = 1

    cursor_row    = 1
    cursor_column = 1

    while step <= size * size:

        if run_step == run_length:
            run_step = 1
            run_count += 1
            run_length = size - (run_count - 1) // 2

        m[cursor_row - 1][cursor_column - 1] = step
        direction = run_count % 4;

        if direction == 0:
            cursor_column += 1
        elif direction == 1:
            cursor_row += 1
        elif direction == 2:
            cursor_column -= 1
        elif direction == 3:
            cursor_row -= 1

        step += 1
        run_step += 1

    return m;