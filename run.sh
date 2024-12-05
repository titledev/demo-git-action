#!/bin/bash

#Set up the environment
export PRINT_ENV=Dev ENDPOINT=srv+mongodb://nongkai.com PORT=5000

# Run the application
cargo build --release

# Run the application
./target/release/rust-demo

# Push the image to the registry
docker build -t rust-demo .
docker push rust-demo:latest