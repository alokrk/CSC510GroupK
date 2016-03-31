#Extracting data for Stack Overflow
setwd("/media/alok/New Volume/programmers.stackexchange.com")
require("XML")

#TAGS
tags = xmlParse("Tags.xml")
tags = xmlToList(tags)
lenTags = length(tags)

#df = data.frame(matrix(unlist(tags)), nrow = len)
tags = data.frame(Reduce(rbind, tags))


write.csv(tags, file="tags.csv")

#POST LINKS
postLinks = xmlParse("PostLinks.xml")
postLinks = xmlToList(postLinks)
lenpostLinks = length(postLinks)

postLinks = data.frame(Reduce(rbind, postLinks))

write.csv(postLinks, file="postLinks.csv")

#USERS
users = xmlParse("Users.xml")
users = xmlToList(users)
lenUsers = length(users)

users = data.frame(Reduce(rbind, users))

write.csv(users, file="users.csv")

#BADGES
badges = xmlParse("Badges.xml")
badges = xmlToList(badges)
lenBadges = length(badges)

badges = data.frame(Reduce(rbind, badges))

write.csv(badges, file="badges.csv")

#VOTES
votes = xmlParse("Votes.xml")
votes = xmlToList(votes)
lenVotes = length(votes)

votes = data.frame(Reduce(rbind, votes))

write.csv(votes, file="votes.csv")

#COMMENTS
comments = xmlParse("Comments.xml")
comments = xmlToList(comments)
lenComments = length(comments)

comments = data.frame(Reduce(rbind, comments))

write.csv(comments, file="comments.csv")

#POSTS
posts = xmlParse("Posts.xml")
posts = xmlToList(posts)
lenPosts = length(posts)

posts = data.frame(Reduce(rbind, posts))

write.csv(posts, file="posts.csv")

#POST HISTORY
postHistory = xmlParse("PostHistory.xml")
postHistory = xmlToList(postHistory)
lenPostHistory = length(postHistory)

postHistory = data.frame(Reduce(rbind, postHistory))

write.csv(postHistory, file="postHistory.csv")
