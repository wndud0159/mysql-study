-- 1. Finding 5 oldset users
SELECT * FROM users ORDER BY created_at ASC LIMIT 5;

-- 2. Most popular registration data
SELECT 
	DAYNAME(created_at) as day,
    COUNT(*) as total
FROM users
GROUP BY day
ORDER BY total DESC LIMIT 1;

-- 3. Identify inactive users (users with no photos)
SELECT 
	username,
    image_url
FROM users
	LEFT JOIN photos ON users.id=photos.user_id
WHERE photos.id IS NULL;

-- 4. Identify most popular photos (and user who created it)
SELECT * FROM likes;
SELECT 
	image_url,
    COUNT(*) as photo_like 
FROM photos
	LEFT JOIN likes ON
	likes.photo_id=photos.id
GROUP BY image_url
ORDER BY photo_like DESC LIMIT 1;

-- 5. calculrate average number of photos per user
SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 

-- 6. Five most popular hashtags
SELECT tags.tag_name,
	COUNT(*) as total
    FROM tags
    INNER JOIN photo_tags ON photo_tags.tag_id=tags.id
    GROUP BY tag_name;

SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- 7. Finding the bots - the users who have liked every single photo
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 

