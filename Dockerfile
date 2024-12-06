# Stage 1: Build
FROM rust:1.72 AS builder

# สร้าง directory สำหรับโปรเจกต์
WORKDIR /app

# คัดลอกไฟล์ Cargo.toml และล็อกไฟล์เพื่อแคช dependencies
COPY Cargo.toml Cargo.lock ./

# คัดลอก source code ทั้งหมดและคอมไพล์
COPY . .
RUN cargo build --release

# Stage 2: Runtime
FROM debian:buster-slim

# ติดตั้ง dependencies ที่จำเป็นสำหรับการรัน
RUN apt-get update && apt-get install -y libssl-dev && apt-get clean

# คัดลอก binary จาก stage แรก
COPY --from=builder /app/target/release/rust-demo /usr/local/bin/rust-demo

# ตั้งพอร์ตที่ต้องการเปิด
EXPOSE 8080

# รันแอปพลิเคชัน
CMD ["rust-demo"]