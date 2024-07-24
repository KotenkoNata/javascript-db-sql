SELECT
    u.id AS "ID",
    u.username AS "Username",
    ROUND(AVG(m.budget), 2) AS "Favorite movie IDs"
FROM
    users u
LEFT JOIN
    favorite_movies fm ON u.id = fm.user_id
GROUP BY
    u.id, u.username;