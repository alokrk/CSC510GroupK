#Extracting data for Stack Overflow
setwd("/media/alok/New Volume/sodata")
require("XML")

#TAGS
tags = xmlParse("Tags.xml")
tags = xmlToList(tags)
lenTags = length(tags)

#df = data.frame(matrix(unlist(tags)), nrow = len)
tags = data.frame(Reduce(rbind, tags))

#POST LINKS
postLinks = xmlParse("PostLinks.xml")
postLinks = xmlToList(postLinks)
lenpostLinks = length(postLinks)

postLinks = data.frame(Reduce(rbind, postLinks))

#USERS
users = xmlParse("Users.xml")
users = xmlToList(users)
lenUsers = length(users)

users = data.frame(Reduce(rbind, users))

#BADGES
badges = xmlParse("Badges.xml")
badges = xmlToList(badges)
lenBadges = length(badges)

badges = data.frame(Reduce(rbind, badges))

#VOTES
votes = xmlParse("Votes.xml")
votes = xmlToList(votes)
lenVotes = length(votes)

votes = data.frame(Reduce(rbind, votes))

#COMMENTS
comments = xmlParse("Comments.xml")
comments = xmlToList(comments)
lenComments = length(comments)

comments = data.frame(Reduce(rbind, comments))

#POSTS
posts = xmlParse("Posts.xml")
posts = xmlToList(posts)
lenPosts = length(posts)

posts = data.frame(Reduce(rbind, posts))