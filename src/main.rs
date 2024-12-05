use std::env;

fn main() {
    // println!("Hello, world!");
    let print_env = env::var("PRINT_ENV").unwrap().to_string();
    let endpoint = env::var("ENDPOINT").unwrap().to_string();
    let port = env::var("PORT").unwrap().to_string();
    println!("{}:{}:{}", print_env, endpoint, port);
}