use std::collections::HashMap;

#[derive(Clone)]
struct TeamStats {
    m: i32,
    w:  i32,
    d:  i32,
    l:  i32,
    p:  i32
}

impl TeamStats {
    pub fn new() -> Self {
        Self { m: 0, w: 0, d: 0, l: 0, p: 0 }
    }
}

pub fn tally(match_results: &str) -> String {

    let mut team_stats_map = HashMap::<String, TeamStats>::new();

    for result_line in match_results.lines() {
        let result_tokens: Vec<&str> = result_line.split(';').collect();

        let team_1 = result_tokens[0];
        let team_2 = result_tokens[1];
        let result = result_tokens[2];

        if !team_stats_map.contains_key(team_1) {
            team_stats_map.insert ( team_1.to_string(), TeamStats::new() );
        }

        if !team_stats_map.contains_key(team_2) {
            team_stats_map.insert ( team_2.to_string(), TeamStats::new() );
        }

        {
            let team_1_stats = team_stats_map.get_mut(team_1).unwrap();
            team_1_stats.m += 1;

            match result {
                "win"  => { team_1_stats.w += 1; team_1_stats.p += 3; }
                "draw" => { team_1_stats.d += 1; team_1_stats.p += 1; }
                "loss" => { team_1_stats.l += 1; team_1_stats.p += 0; }
                _ => {}
            }
        }
        {
            let team_2_stats = team_stats_map.get_mut(team_2).unwrap();
            team_2_stats.m += 1;

            match result {
                "win"  => { team_2_stats.l += 1; team_2_stats.p += 0; }
                "draw" => { team_2_stats.d += 1; team_2_stats.p += 1; }
                "loss" => { team_2_stats.w += 1; team_2_stats.p += 3; }
                _ => {}
            }
        }
    }

    let mut teams: Vec<(&String, &TeamStats)> = team_stats_map.iter().collect();

    teams.sort_by ( |a, b| { b.1.p.cmp(&a.1.p).then(a.0.cmp(b.0)) });

    let mut out = String::new();
    out.push_str("Team                           | MP |  W |  D |  L |  P");

    for (name, stats) in teams {
        out.push_str(&format!(
            "\n{:<30} | {:>2} | {:>2} | {:>2} | {:>2} | {:>2}",
            name, stats.m, stats.w, stats.d, stats.l, stats.p
        ));
    }

    out

}
