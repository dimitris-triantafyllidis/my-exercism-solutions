exchange_money(budget, exchange_rate) = Float64(budget) / Float64(exchange_rate)

get_change(budget, exchanging_value) = budget - exchanging_value

get_value_of_bills(denomination, number_of_bills) = denomination * number_of_bills

get_number_of_bills(amount, denomination) = floor(amount / denomination)

get_leftover_of_bills(amount, denomination) = amount % denomination

exchangeable_value(budget, exchange_rate, spread, denomination) = get_value_of_bills(
    denomination,
    get_number_of_bills(
        exchange_money(
            budget, exchange_rate * (1 + spread / 100)
        ),
        denomination
    )
)
