function spiral_matrix(n)

    m = Matrix{Int}(undef, n, n)

    run_count  = 0
    run_length = n
    direction  = 0

    step = 1
    run_step = 1

    cursor_row    = 1
    cursor_column = 1

    while step <= n^2

        if run_step == run_length
            run_step = 1
            run_count += 1
        end

        m[cursor_row, cursor_column] = step

        direction = run_count % 4

        run_length = n - div(run_count - 1, 2)

        if direction == 0
            cursor_column += 1
        elseif direction == 1
            cursor_row += 1
        elseif direction == 2
            cursor_column -= 1
        elseif direction == 3
            cursor_row -= 1
        end

        step += 1
        run_step += 1

    end

    return m

end
