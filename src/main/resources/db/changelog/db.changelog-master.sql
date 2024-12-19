CREATE TABLE IF NOT EXISTS profile(
    id VARCHAR(36) PRIMARY KEY NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    work_time INT NOT NULL
);

CREATE TABLE IF NOT EXISTS genre(
    id VARCHAR(36) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS author(
    id VARCHAR(36) PRIMARY KEY NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS book(
    id VARCHAR(36) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    book_count INT NOT NULL,
    author_id VARCHAR(36),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS book_genre(
    book_id VARCHAR(36) NOT NULL,
    genre_id VARCHAR(36) NOT NULL,
    PRIMARY KEY (book_id, genre_id),

    CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES book(id),
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE IF NOT EXISTS member(
    id VARCHAR(36) PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    membership_date DATE NOT NULL,
    created_by_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (created_by_id) REFERENCES profile(id)
);

CREATE TABLE IF NOT EXISTS loan(
    id VARCHAR(36) PRIMARY KEY NOT NULL,
    member_id VARCHAR(36) NOT NULL,
    book_id VARCHAR(36) NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,

    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (book_id) REFERENCES book(id)
);


INSERT INTO profile(id, username, password, work_time)
VALUES ('550e8400-e29b-41d4-a716-446655440000', 'admin', '123123', '8');
