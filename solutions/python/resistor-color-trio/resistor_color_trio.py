import math

def format_ohms(ohm_value, label_metric_prefix):

    exp = 3 * ((len(str(ohm_value)) - 1) // 3)

    scaled = ohm_value / (10 ** exp)

    if scaled.is_integer():
        scaled_str = str(int(scaled))
    else:
        scaled_str = str(scaled)

    return f"{scaled_str} {label_metric_prefix}ohms"

def label(colors):

    color_codes = {
        "black"  : 0,
        "brown"  : 1,
        "red"    : 2,
        "orange" : 3,
        "yellow" : 4,
        "green"  : 5,
        "blue"   : 6,
        "violet" : 7,
        "grey"   : 8,
        "white"  : 9
    }

    ohm_value = (10 * color_codes[colors[0]] + color_codes[colors[1]]) * \
                pow(10, color_codes[colors[2]])

    label_metric_prefix = \
        ""     if len(str(ohm_value)) < 4 else  \
        "kilo" if len(str(ohm_value)) < 7 else  \
        "mega" if len(str(ohm_value)) < 10 else \
        "giga"

    return format_ohms(ohm_value, label_metric_prefix)