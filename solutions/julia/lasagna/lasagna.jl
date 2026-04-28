const expected_bake_time = 60

preparation_time(n_layers) = 2 * n_layers

remaining_time(time_in_oven) = expected_bake_time - time_in_oven

total_working_time(n_layers, time_in_oven) = preparation_time(n_layers) + time_in_oven
