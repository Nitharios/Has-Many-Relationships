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
  updated_at  timestamptz   NOT NULL    DEFAULT now()
  user_id     integer       NOT NULL    REFERENCES users(id),
);

CREATE TABLE comments(
  id          SERIAL        NOT NULL    PRIMARY KEY,
  body        varchar(510),
  created_at  timestamptz   NOT NULL    DEFAULT now(),
  updated_at  timestamptz   NOT NULL    DEFAULT now()
  post_id     integer       NOT NULL    REFERENCES posts(id),
  user_id     integer       NOT NULL    REFERENCES users(id),
);

-- Run the provided scripts/blog_data.sql
\i scripts/blog_data.sql;

-- Write the following SQL statements in joins.sql

-- Create a query to get all fields from the users table


-- Create a query to get all fields from the posts table where the user_id is 100

-- Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200

-- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

-- Create a query to get usernames from the users table where the user has created a post after January 1, 2015

-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

-- Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'

-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )

-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )

-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )
