SELECT u.first_name AS "post_author_first_name", u.last_name AS "post_author_last_name",
       p.title AS "post_title", u.username AS "comment_author_username", c.body AS "comment_body"
FROM   comments c
JOIN   posts p ON p.id = c.posts_id
JOIN   users u ON u.id = c.users_id
WHERE  p.content LIKE '%nemo%'
AND    (c.body LIKE '%SSL%' OR c.body LIKE '%firewall%');