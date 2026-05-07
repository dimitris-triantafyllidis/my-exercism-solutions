def transform(legacy_data):

    new_data = dict()

    for k, vs in legacy_data.items():
        for v in vs:
            new_data[v.lower()] = k

    return new_data
