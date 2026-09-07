#include <array>
#include <string>
#include <vector>
#include <cmath>
#include <array>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {

    std::vector<int> rounded_scores;

    for (const auto &score : student_scores)
        rounded_scores.push_back(std::floor(score));

    return rounded_scores;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {

    int n_failed = 0;

    for (const auto &score : student_scores)
        if (score <= 40)
            n_failed++;

    return n_failed;

}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {

    return {
        41 + (highest_score - 40) / 4 * 0,
        41 + (highest_score - 40) / 4 * 1,
        41 + (highest_score - 40) / 4 * 2,
        41 + (highest_score - 40) / 4 * 3,
    };

}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names) {

    std::vector<std::string> ranking;

    for (std::size_t i = 0; i < student_scores.size(); i++)
        ranking.push_back(std::to_string(i + 1) + ". " + student_names[i] + ": " + std::to_string(student_scores[i]));

    return ranking;

}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names) {

    for (std::size_t i = 0; i < student_scores.size(); i++)
        if (student_scores[i] == 100)
            return student_names[i];

    return "";

}
