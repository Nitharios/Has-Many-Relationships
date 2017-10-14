\c nniosco;
DROP DATABASE IF EXISTS has_many_blogs;
DROP USER IF EXISTS has_many_user;
-- Create a new postgres user named has_many_user
CREATE USER has_many_user;
-- Create a new database named has_many_blogs owned by has_many_user
CREATE DATABASE has_many_blogs 
  WITH OWNER has_many_user;
-- Before each create table statement, add a drop table if exists statement.
\c has_many_blogs;
-- In has_many_blogs.sql Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the has_many_blogs schema below.

-- Create the necessary FKs needed to relate the tables according to the relationship table below.

CREATE TABLE users(
  id          SERIAL        NOT NULL    PRIMARY KEY,
  username    varchar(90)   NOT NULL,
  first_name  varchar(90),
  last_name   varchar(90),
  created_at  timestamptz   NOT NULL    DEFAULT now(),
  updated_at  timestamptz   NOT NULL    DEFAULT now()
);

CREATE TABLE posts(
  id          SERIAL        NOT NULL    PRIMARY KEY,
  title       varchar(180),
  url         varchar(510),
  content     text,
  created_at  timestamptz   NOT NULL    DEFAULT now(),
  updated_at  timestamptz   NOT NULL    DEFAULT now(),
  user_id     integer       NOT NULL    REFERENCES users(id)
);

CREATE TABLE comments(
  id          SERIAL        NOT NULL    PRIMARY KEY,
  body        varchar(510),
  created_at  timestamptz   NOT NULL    DEFAULT now(),
  updated_at  timestamptz   NOT NULL    DEFAULT now(),
  post_id     integer       NOT NULL    REFERENCES posts(id),
  user_id     integer       NOT NULL    REFERENCES users(id)
);

-- Run the provided scripts/blog_data.sql
\i scripts/blog_data.sql;