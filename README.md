Это моя первая семестровка. Я сделала сайт для школы по рисованию

Скрипт для создания таблиц
-- 1. Пользователи
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    hashpassword VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'user'
);

-- 2. Курсы
CREATE TABLE courses (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    details TEXT,
    image VARCHAR(512),
    price NUMERIC(10, 2) NOT NULL DEFAULT 0.00
);

-- 3. Отзывы
CREATE TABLE reviews (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    text TEXT NOT NULL,
    course_title VARCHAR(255),
    CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_review_course_id FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE cascade,
    CONSTRAINT unique_user_course UNIQUE (user_id, course_id)
);

-- 4. Покупки
CREATE TABLE users_courses (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    course_id BIGINT NOT NULL,
    paid BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE (user_id, course_id)
);
