SELECT         user_name_short as username, posts, likes, quotes, replies, shares, likes + quotes + replies + shares AS engagement
FROM            (SELECT        user_name_short, COUNT(*) AS posts, SUM(likes) AS likes, SUM(quotes) AS quotes, SUM(replies) AS replies, SUM(shares) AS shares
                FROM            dbo.twitter_posts_apiv2
                           where created_at_date >= '2022-12-20' 
                           and tweettext like '%Afghan%' or tweettext like '%Афган%' or tweettext like '%Афган%' or tweettext like '%أفغاني%' 
                GROUP BY user_name_short) AS a ;
 
 
 
SELECT        page_name, posts, emotions, likes, comments, shares, likes + comments + shares + emotions AS engagement
FROM            (SELECT        page_name, COUNT(*) AS posts, SUM(ISNULL(sad, 0) + ISNULL(haha, 0) + ISNULL(reactions, 0) + ISNULL(thankful, 0) + ISNULL(love, 0) + ISNULL(wow, 0)) AS emotions, SUM(likes) AS likes, SUM(comments) 
                                    AS comments, SUM(shares) AS shares
            FROM            dbo.facebook_posts
                           where created_at_date >= '2022-12-20' 
                           and message  like '%Afghan%' or message like '%Афган%' or message like '%Афган%' or message like '%أفغاني%' 
 
 
            GROUP BY page_name) AS a ;
 
 
SELECT        user_name_short, posts, likes, comments, likes + comments AS engagement
FROM            (SELECT        user_name_short, COUNT(*) AS posts, SUM(likes) AS likes, SUM(comments) AS comments
                          FROM            dbo.instagram_posts
                           where created_at_date >= '2022-12-20' 
                           and message  like '%Afghan%' or message like '%Афган%' or message like '%Афган%' or message like '%أفغاني%' 
 
                          GROUP BY user_name_short) AS a ;
