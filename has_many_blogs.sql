DROP DATABASE IF EXISTS has_many_blogs;
DROP USER has_many_user;
CREATE USER has_many_user;
CREATE DATABASE has_many_blogs OWNER = has_many_user;
\c has_many_blogs;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users
(
  id serial PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) NULL NULL,
  last_name VARCHAR(90) NULL NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE posts
(
  id serial PRIMARY KEY,
  title VARCHAR(180) NULL NULL,
  url VARCHAR(510) NULL NULL,
  content TEXT NULL NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  users_id integer REFERENCES users(id)
);

CREATE TABLE comments
(
  id serial PRIMARY KEY,
  body VARCHAR(510) NULL NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  users_id integer REFERENCES users(id),
  posts_id integer REFERENCES posts(id)
);

\i scripts/blog_data.sql;