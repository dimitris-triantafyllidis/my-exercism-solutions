function twobucket(bucket1, bucket2, goal, start)

    small_bucket = bucket1 < bucket2 ? 1 : 2
    big_bucket   = bucket1 < bucket2 ? 2 : 1

    capacity_small = bucket1 < bucket2 ? bucket1 : bucket2;
    capacity_big   = bucket1 < bucket2 ? bucket2 : bucket1;

    if goal > capacity_big
        throw(DomainError("Goal is larger than both capacities"))
    end

    content_small = start == small_bucket ? capacity_small : 0
    content_big   = start == big_bucket   ? capacity_big   : 0

    moves = 1;

    if goal == capacity_small
        if start == small_bucket
            return (1, small_bucket, content_big)
        else
            return (2, small_bucket, content_big)
        end
    end

    if goal == capacity_big
        if start == big_bucket
            return (1, big_bucket, content_small)
        else
            return (2, big_bucket, content_small)
        end
    end

    if goal % (gcd(bucket1, bucket2)) != 0
        throw(DomainError("No solution exists"))
    end

    if start == big_bucket

        while true
            if content_big < capacity_small - content_small      # We can't fill the small bucket from the big bucket

                content_small += content_big;                    # Empty the big bucket to the small bucket
                content_big = 0;
                moves += 1;

                if content_small == goal
                    return (moves, small_bucket, content_big)
                end

                content_big = capacity_big;                      # Fill the big bucket
                moves += 1;

                if content_big == goal
                    return (moves, big_bucket, content_small)
                end

            else

                content_big   -= capacity_small - content_small; # Empty the big bucket to the small bucket
                content_small += capacity_small - content_small;
                moves += 1;

                if content_small == goal
                    return (moves, small_bucket, content_big)
                end
                if content_big   == goal
                    return (moves, big_bucket, content_small)
                end

                content_small = 0;                               # Empty the small bucket
                moves += 1;

            end
        end
    else

        while true
            if content_small > capacity_big - content_big        # We can't empty the small bucket to the big bucket

                content_small -= capacity_big - content_big;     # Fill the big bucket from the small bucket
                content_big = capacity_big;
                moves += 1;

                if content_small == goal
                    return (moves, small_bucket, content_big)
                end
                if content_big   == goal
                    return (moves, big_bucket, content_small)
                end

                content_big = 0;                                 # Empty the big bucket
                moves += 1;

            else

                content_big += content_small;                    # Empty the small bucket to the big bucket
                content_small = 0;
                moves += 1;

                if content_big == goal
                    return (moves, big_bucket, content_small)
                end

                content_small = capacity_small;                  # Fill the small bucket
                moves += 1;

                if content_small == goal
                    return (moves, small_bucket, content_big)
                end

            end
        end
    end

end
