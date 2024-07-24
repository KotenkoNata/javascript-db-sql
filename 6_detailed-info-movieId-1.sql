SELECT
    m.id AS "ID",
    m.title AS "Title",
    m.release_date AS "Release date",
    m.duration AS "Duration",
    m.description AS "Description",
    json_build_object(
        'file_name', pf.file_name,
        'mime_type', pf.mime_type,
        'key', pf.key,
        'url', pf.url
    ) AS "Poster",
    json_build_object(
        'ID', d.id,
        'First name', d.first_name,
        'Last name', d.last_name
    ) AS "Director",
    json_agg(
        json_build_object(
            'ID', a.id,
            'First name', a.first_name,
            'Last name', a.last_name,
            'Photo', json_build_object(
                'file_name', af.file_name,
                'mime_type', af.mime_type,
                'key', af.key,
                'url', af.url
            )
        )
    ) AS "Actors",
    json_agg(
        json_build_object(
            'ID', g.id,
            'Name', g.name
        )
    ) AS "Genres"
FROM
    movies m
JOIN
    img_files pf ON m.poster_file_id = pf.id
JOIN
    persons d ON m.director_id = d.id
JOIN
    movie_characters mc ON m.id = mc.movie_id
JOIN
    persons a ON mc.person_id = a.id
LEFT JOIN
    person_photo pp ON a.id = pp.person_id AND pp.is_primary = TRUE
LEFT JOIN
    img_files af ON pp.file_id = af.id
JOIN
    movie_genres mg ON m.id = mg.movie_id
JOIN
    genres g ON mg.genre_id = g.id
WHERE
    m.id = 1
GROUP BY
    m.id, m.title, m.release_date, m.duration, m.description, pf.file_name, pf.mime_type, pf.key, pf.url, d.id, d.first_name, d.last_name, af.file_name, af.mime_type, af.key, af.url;
