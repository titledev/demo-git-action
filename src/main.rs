use std::env;
use actix_web::{get, HttpResponse, Responder, HttpServer, App};

#[get("/")]
async fn hello() -> impl Responder {
    let print_env = env::var("PRINT_ENV").ok().unwrap();
    let endpoint = env::var("ENDPOINT").ok().unwrap();
    let port = env::var("PORT").ok().unwrap();
    let response_text = format!("{}:{}:{}", print_env, endpoint, port);
    println!("{}", response_text);
    HttpResponse::Ok().body(response_text)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(hello)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}