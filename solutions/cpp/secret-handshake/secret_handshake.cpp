#include "secret_handshake.h"
#include <algorithm>

namespace secret_handshake {

    auto commands(int code) -> std::vector<std::string>
    {
        std::vector<std::string> actions;

        if (code & 1) actions.push_back("wink");
        if (code & 2) actions.push_back("double blink");
        if (code & 4) actions.push_back("close your eyes");
        if (code & 8) actions.push_back("jump");

        if (code & 16) std::reverse(actions.begin(), actions.end());

        return actions;
    }

}  // namespace secret_handshake
