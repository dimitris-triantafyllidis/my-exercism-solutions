success_rate(speed) =
    speed == 0    ? 0    :
    1 ≤ speed ≤ 4 ? 1    :
    5 ≤ speed ≤ 8 ? 0.9  :
    speed == 9    ? 0.8  :
    speed == 10   ? 0.77 :
    0

production_rate_per_hour(speed) = 221.0 * success_rate(speed) * speed

working_items_per_minute(speed) = Int64(floor(production_rate_per_hour(speed) / 60))
