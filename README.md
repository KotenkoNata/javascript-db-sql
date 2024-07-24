# Database Schema ER Diagram

Below is the Entity-Relationship (ER) diagram for the database schema:

```mermaid
erDiagram
    countries {
        int id PK
        varchar name
        timestamp createdAt
        timestamp updatedAt
    }

    img_files {
        int id PK
        varchar file_name
        varchar mime_type
        varchar key
        varchar url
        timestamp createdAt
        timestamp updatedAt
    }

    users {
        int id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        int avatar_file_id FK
        timestamp createdAt
        timestamp updatedAt
    }

    persons {
        int id PK
        varchar first_name
        varchar last_name
        text biography
        date date_of_birth
        varchar gender
        int country_id FK
        timestamp createdAt
        timestamp updatedAt
    }

    person_photo {
        int person_id PK, FK
        int file_id PK, FK
        boolean is_primary
        timestamp createdAt
        timestamp updatedAt
    }

    movies {
        int id PK
        varchar title
        text description
        numeric budget
        date release_date
        int duration
        int director_id FK
        int country_id FK
        int poster_file_id FK
        timestamp createdAt
        timestamp updatedAt
    }

    genres {
        int id PK
        varchar name
        timestamp createdAt
        timestamp updatedAt
    }

    movie_genres {
        int movie_id PK, FK
        int genre_id PK, FK
        timestamp createdAt
        timestamp updatedAt
    }

    characters {
        int id PK
        varchar name
        text description
        varchar role
        timestamp createdAt
        timestamp updatedAt
    }

    movie_characters {
        int movie_id PK, FK
        int character_id PK, FK
        int person_id FK
        timestamp createdAt
        timestamp updatedAt
    }

    favorite_movies {
        int user_id PK, FK
        int movie_id PK, FK
        timestamp createdAt
        timestamp updatedAt
    }

    %% Relationships
    users ||--o{ img_files : "avatar_file_id"
    persons ||--o{ countries : "country_id"
    person_photo ||--o| persons : "person_id"
    person_photo ||--o| img_files : "file_id"
    movies ||--o{ persons : "director_id"
    movies ||--o{ countries : "country_id"
    movies ||--o{ img_files : "poster_file_id"
    movie_genres ||--o| movies : "movie_id"
    movie_genres ||--o| genres : "genre_id"
    movie_characters ||--o| movies : "movie_id"
    movie_characters ||--o| characters : "character_id"
    movie_characters ||--o| persons : "person_id"
    favorite_movies ||--o| users : "user_id"
    favorite_movies ||--o| movies : "movie_id"
