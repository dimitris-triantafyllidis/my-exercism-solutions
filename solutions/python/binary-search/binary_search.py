def find(search_list, value):

    if search_list == []:
        raise ValueError("value not in array")

    min_idx = 0
    max_idx = len(search_list) - 1

    if search_list[min_idx] == value:
        return min_idx
    elif search_list[max_idx] == value:
        return max_idx

    while True:
        if max_idx - min_idx == 1:
            raise ValueError("value not in array")
        else:
            candidate_idx = (min_idx + max_idx) // 2
            if search_list[candidate_idx] == value:
                return candidate_idx
            elif search_list[candidate_idx] < value:
                min_idx = candidate_idx
            elif search_list[candidate_idx] > value:
                max_idx = candidate_idx
