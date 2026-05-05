#include "rail_fence_cipher.h"

#include <vector>
#include <stdexcept>

namespace rail_fence_cipher {


    std::string encode(const std::string& plaintext, int num_rails)
    {
        if (num_rails < 2)
            throw std::invalid_argument("");

        std::string clean;

        for (auto c : plaintext)
            if (c != ' ')
                clean.push_back(c);

        std::vector<std::string> rails(num_rails);

        std::size_t rail_idx = 0;
        std::size_t rail_idx_dir = 0;

        for (std::size_t i = 0; i < clean.size(); i++)
        {
            rails[rail_idx].push_back(clean[i]);

            if(rail_idx == 0)
                rail_idx_dir = 1;
            else if(rail_idx == num_rails - 1)
                rail_idx_dir = -1;

            rail_idx += rail_idx_dir;
        }

        std::string encoded;

        for (std::size_t i = 0; i < rails.size(); i++)
            encoded = encoded + rails[i];

        return encoded;
    }

    std::string decode(const std::string& ciphertext, int num_rails)
    {
        if (num_rails < 2)
            throw std::invalid_argument("");

        std::size_t n = ciphertext.size();

        // Compute rail lengths

        std::vector<std::size_t> rail_lengths(num_rails, 0);

        std::size_t rail_idx = 0;
        int rail_idx_dir = 1;

        for (std::size_t i = 0; i < n; i++)
        {
            rail_lengths[rail_idx]++;

            if (rail_idx == 0)
                rail_idx_dir = 1;
            else if (rail_idx == num_rails - 1)
                rail_idx_dir = -1;

            rail_idx += rail_idx_dir;
        }

        // Slice ciphertext into rails

        std::vector<std::string> rails(num_rails);
        std::size_t rail_offset = 0;

        for (int r = 0; r < num_rails; r++)
        {
            rails[r] = ciphertext.substr(rail_offset, rail_lengths[r]);
            rail_offset += rail_lengths[r];
        }

        // Reconstruct plaintext

        std::vector<std::size_t> rail_cursors(num_rails, 0);
        std::string decoded;

        rail_idx = 0;
        rail_idx_dir = 1;

        for (std::size_t i = 0; i < n; i++)
        {
            decoded.push_back(rails[rail_idx][rail_cursors[rail_idx]++]);

            if (rail_idx == 0)
                rail_idx_dir = 1;
            else if (rail_idx == num_rails - 1)
                rail_idx_dir = -1;

            rail_idx += rail_idx_dir;
        }

        return decoded;
    }

}  // namespace rail_fence_cipher
