SELECT
    p.id AS "Director ID",
    CONCAT(p.first_name, ' ', p.last_name) AS "Director name",
    ROUND(AVG(m.budget), 2) AS "Average budget"  -- Limit to 2 decimal places
FROM
    persons p
JOIN
    movies m ON p.id = m.director_id
GROUP BY
    p.id, p.first_name, p.last_name;