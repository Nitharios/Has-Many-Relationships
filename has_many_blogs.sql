\c nniosco;
-- Create a new postgres user named has_many_user
DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;
-- Create a new database named has_many_blogs owned by has_many_user
DROP DATABASE IF EXISTS has_many_blogs;
CREATE DATABASE has_many_blogs 
  WITH OWNER has_many_user;
-- Before each create table statement, add a drop table if exists statement.

-- In has_many_blogs.sql Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the has_many_blogs schema below.

-- Create the necessary FKs needed to relate the tables according to the relationship table below.
-- Run the provided scripts/blog_data.sql