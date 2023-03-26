type Speed = u8;

pub fn production_rate_per_hour(speed: Speed) -> f64 {
    production_rate_no_faulty(speed) * success_rate(speed)
}

pub fn working_items_per_minute(speed: Speed) -> u32 {
    (production_rate_per_hour(speed) / 60.0) as u32
}

fn production_rate_no_faulty(speed: Speed) -> f64 {
    speed as f64 * 221.0
}

fn success_rate(speed: Speed) -> f64 {
    match speed {
        1..=4 => 1.0,
        5..=8 => 0.9,
        9..=10 => 0.77,
        _ => 0.0,
    }
}
