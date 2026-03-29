-- Capstone Answers
-- Fill in each query below.

-- Q1: List every artist name and country, sorted alphabetically by name.
    select name, country from artists order by name;

-- Q2: How many albums are in the catalog?
    select count(*) from albums;

-- Q3: Which genre has the most albums? (genre name and count)
    select g.name, count(*) as album_count from genres g join albums a on g.id = a.genre_id group by g.name order by album_count desc limit 1;
    
-- Q4: Album titles released before 1970, with artist name.
    select a.title, ar.name from albums a join artists ar on a.artist_id = ar.id where a.year_released < 1970;

-- Q5: Longest track — title, album title, duration as MM:SS.
    select t.title, a.title, t.duration_sec from tracks t join albums a on t.album_id = a.id order by t.duration_sec desc limit 1;

-- Q6: Track count per album, sorted by count descending.
    select a.title, count(*) as track_count from albums a join tracks t on a.id = t.album_id group by a.title order by track_count desc;

-- Q7: Artists with more than one album.
    select ar.name, count(*) as album_count from artists ar join albums a on ar.id = a.artist_id group by ar.name having album_count > 1;

-- Q8: Tracks longer than 5 minutes — track title, album title, artist name.
    select t.title, a.title, ar.name from tracks t join albums a on t.album_id = a.id join artists ar on a.artist_id = ar.id where t.duration_sec > 300;

-- Q9: Average track duration per genre (in seconds, rounded to 1 decimal).
    select g.name, round(avg(t.duration_sec), 1) as avg_duration from genres g join albums a on g.id = a.genre_id join tracks t on a.id = t.album_id group by g.name;

-- Q10: Artist with the most total tracks — artist name and total count.
    select ar.name, count(*) as total_tracks from artists ar join albums a on ar.id = a.artist_id join tracks t on a.id = t.album_id group by ar.name order by total_tracks desc limit 1;

-- BONUS: Per-album summary (title, artist, genre, track count, total minutes).
