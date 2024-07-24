SELECT
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release date",
    m.duration AS "Duration",
    m.description AS "Description",
    json_build_object(
        'file_name', i.file_name,
        'mime_type', i.mime_type,
        'key', i.key,
        'url', i.url
    ) AS "Poster",
    json_build_object(
        'ID', d.id,
        'First name', d.first_name,
        'Last name', d.last_name
    ) AS "Director"
FROM
    movies m
JOIN
    img_files i ON m.poster_file_id = i.id
JOIN
    persons d ON m.director_id = d.id
JOIN
    movie_genres mg ON m.id = mg.movie_id
JOIN
    genres g ON mg.genre_id = g.id
WHERE
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > 135
    AND (g.name = 'Action' OR g.name = 'Drama')
GROUP BY
    m.id, m.title, m.release_date, m.duration, m.description, i.file_name, i.mime_type, i.key, i.url, d.id, d.first_name, d.last_name;
