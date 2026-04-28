function rationalize(successes, trials)
    return successes .// trials
end

function probabilities(successes, trials)
    return successes ./ trials
end

function checkmean(successes, trials)
    real_probabilities_mean = sum(probabilities(successes, trials)) / length(probabilities(successes, trials))
    rational_probabilities_mean = sum(rationalize(successes, trials)) // length(rationalize(successes, trials))

    if Float64(real_probabilities_mean) != Float64(rational_probabilities_mean)
        return rational_probabilities_mean
    else
        return true
    end
end

function checkprob(successes, trials)
    real_probabilities_total = prod(probabilities(successes, trials))
    rational_probabilities_total = prod(rationalize(successes, trials))

    if Float64(real_probabilities_total) != Float64(rational_probabilities_total)
        return rational_probabilities_total
    else
        return true
    end
end
