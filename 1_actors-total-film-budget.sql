SELECT
    p.id AS "ID",
    p.first_name AS "First name",
    p.last_name AS "Last name",
    SUM(m.budget) AS "Total movies budget"
FROM
    persons p
JOIN
    movie_characters mc ON p.id = mc.person_id
JOIN
    movies m ON mc.movie_id = m.id
GROUP BY
    p.id, p.first_name, p.last_name;