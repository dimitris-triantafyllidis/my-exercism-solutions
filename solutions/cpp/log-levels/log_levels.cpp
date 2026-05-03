#include <string>

namespace log_line {
std::string message(std::string line) {
    if (line.substr(0, 7) == "[INFO]:")
        return line.substr(8);
    else if (line.substr(0, 10) == "[WARNING]:")
        return line.substr(11);
    else if (line.substr(0, 8) == "[ERROR]:")
        return line.substr(9);
    else
        return "";
}

std::string log_level(std::string line) {
    if (line.substr(0, 7) == "[INFO]:")
        return line.substr(1, 4);
    else if (line.substr(0, 10) == "[WARNING]:")
        return line.substr(1, 7);
    else if (line.substr(0, 8) == "[ERROR]:")
        return line.substr(1, 5);
    else
        return "";
}

std::string reformat(std::string line) {
    return message(line) + " (" + log_level(line) + ")";
}

}  // namespace log_line
