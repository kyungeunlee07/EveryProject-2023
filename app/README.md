# app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



db/테이블 생성

CREATE DATABASE IF NOT EXISTS Every
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE Every;

CREATE TABLE IF NOT EXISTS member(
 id VARCHAR(100) NOT NULL PRIMARY KEY,
 pw VARCHAR(255) NOT NULL,
 name VARCHAR(50) NOT NULL,
 sid INT NOT NULL,
 department VARCHAR(100),
 email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS board(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(255) NOT NULL,
 content TEXT NOT NULL,  
 writer VARCHAR(100) NOT NULL,
 department VARCHAR(100) NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (writer) REFERENCES member(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS comment(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 board INT NOT NULL,
 content TEXT NOT NULL,
 writer VARCHAR(100) NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (board) REFERENCES board(id) ON DELETE CASCADE,
 FOREIGN KEY (writer) REFERENCES member(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS friend_request(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 sender_id VARCHAR(100) NOT NULL,
 receiver_id VARCHAR(100) NOT NULL,
 FOREIGN KEY (sender_id) REFERENCES member(id) ON DELETE CASCADE,
 FOREIGN KEY (receiver_id) REFERENCES member(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS friends(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 user1_id VARCHAR(100),
 user2_id VARCHAR(100),
 FOREIGN KEY (user1_id) REFERENCES member(id) ON DELETE CASCADE,
 FOREIGN KEY (user2_id) REFERENCES member(id) ON DELETE CASCADE
);