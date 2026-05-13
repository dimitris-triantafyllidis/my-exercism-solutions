pub fn actions(n: u8) -> Vec<&'static str> {

    let mut actions = Vec::<&'static str>::new();

    if n & 0x1 != 0 { actions.push("wink"); }
    if n & 0x2 != 0 { actions.push("double blink"); }
    if n & 0x4 != 0 { actions.push("close your eyes"); }
    if n & 0x8 != 0 { actions.push("jump"); }

    if n & 0x10 != 0 { actions.reverse(); }

    actions
}
