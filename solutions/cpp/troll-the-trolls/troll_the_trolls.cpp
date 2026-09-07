namespace hellmath {

    enum class AccountStatus {
        troll,
        guest,
        user,
        mod
    };

    enum class Action {
        read,
        write,
        remove
    };

    bool display_post (AccountStatus p, AccountStatus u)
    {
        return !(p == AccountStatus::troll && u != AccountStatus::troll);
    }

    bool permission_check(Action a, AccountStatus t)
    {
        if (t == AccountStatus::troll)
            return a == Action::read || a == Action::write;
        else if (t == AccountStatus::guest)
            return a == Action::read;
        else if (t == AccountStatus::user)
            return a == Action::read || a == Action::write;
        else
            return true;
    }

    bool valid_player_combination(AccountStatus p1, AccountStatus p2)
    {
        if (p1 == AccountStatus::troll && p2 == AccountStatus::troll)
            return true;
        else if (
            (p1 == AccountStatus::user || p1 == AccountStatus::mod) &&
            (p2 == AccountStatus::user || p2 == AccountStatus::mod)
        )
            return true;
        else
            return false;
    }

    bool has_priority(AccountStatus p1, AccountStatus p2)
    {
        return p1 > p2;
    }

}  // namespace hellmath
