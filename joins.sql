-- Write the following SQL statements in joins.sql

-- Create a query to get all fields from the users table

-- SELECT id, username, first_name, last_name, created_at, updated_at
  -- FROM users;

-- Create a query to get all fields from the posts table where the user_id is 100

-- SELECT id, title, url, content, created_at, updated_at, user_id
  -- FROM posts
  -- WHERE user_id = 100;

-- Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200

-- SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, p.user_id, u.first_name, u.last_name
--   FROM posts p
--   JOIN users u ON u.id = p.user_id 
--   WHERE user_id = 200;

-- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

-- SELECT p.id, p.title, p.url, p.content, p.created_at, p.updated_at, p.user_id, u.first_name, u.last_name
--   FROM posts p
--   JOIN users u ON u.id = p.user_id 
--   WHERE u.first_name = 'Norene'
--   AND u.last_name = 'Schmitt';

-- Create a query to get usernames from the users table where the user has created a post after January 1, 2015

-- SELECT u.username
--   FROM users u
--   JOIN posts p ON p.user_id = u.id
--   WHERE p.created_at > '2015-01-01';

-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

-- SELECT p.title, p.content, u.username
--   FROM posts p
--   JOIN users u ON u.id = p.user_id
--   WHERE u.created_at < '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields

-- SELECT p.title AS "Post Title", c.id, c.body, c.created_at, c.updated_at, c.post_id, c.user_id
--   FROM comments c
--   JOIN posts p ON p.id = c.post_id;

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

-- SELECT p.title AS "post_title", p.url AS "post_url", c.body AS "post_url"
--   FROM posts p
--   JOIN comments c ON c.post_id = p.id
--   WHERE p.created_at < '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015

-- SELECT p.title AS "post_title", p.url AS "post_url", c.body AS "comment_body"
--   FROM posts p
--   JOIN comments c ON c.post_id = p.id
--   WHERE p.created_at > '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'

-- SELECT p.title AS "post_title", p.url AS "post_url", c.body AS "comment_body"
--   FROM comments c
--   JOIN posts p ON p.id = c.post_id
--   WHERE c.body LIKE '%USB%';

-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )

-- SELECT p.title AS "post_title", u.first_name, u.last_name, c.body AS "comment_body"
--   FROM comments c
--   JOIN posts p ON p.id = c.post_id
--   JOIN users u ON u.id = p.user_id
--   WHERE c.body LIKE '%matrix%';

-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )

SELECT u.first_name, u.last_name, c.body AS "comment_body"
  FROM data (
    SELECT body
      FROM comments
      WHERE body LIKE '%SSL%'
      AND EXISTS (
        SELECT content
          FROM posts 
          WHERE content LIKE '%dolorum%'
      )
    );

-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )
