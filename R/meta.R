#Extracting data for Stack Overflow
setwd("/media/alok/New Volume/sodata/meta.stackoverflow.com")
require("XML")

#TAGS
tags = xmlParse("Tags.xml")
tags = xmlToList(tags)
lenTags = length(tags)

tags = data.frame(Reduce(rbind, tags))
metaTags = tags

#POST LINKS
postLinks = xmlParse("PostLinks.xml")
postLinks = xmlToList(postLinks)
lenpostLinks = length(postLinks)

postLinks = data.frame(Reduce(rbind, postLinks))
metaPostLinks = postLinks

#USERS
users = xmlParse("Users.xml")
users = xmlToList(users)
lenUsers = length(users)

users = data.frame(Reduce(rbind, users))
metaUsers = users

#BADGES
badges = xmlParse("Badges.xml")
badges = xmlToList(badges)
lenBadges = length(badges)

badges = data.frame(Reduce(rbind, badges))
metaBadges = badges

#VOTES
votes = xmlParse("Votes.xml")
votes = xmlToList(votes)
lenVotes = length(votes)

votes = data.frame(Reduce(rbind, votes))
metaVotes = votes

#COMMENTS
comments = xmlParse("Comments.xml")
comments = xmlToList(comments)
lenComments = length(comments)

comments = data.frame(Reduce(rbind, comments))
metaComments = comments

#POSTS
posts = xmlParse("Posts.xml")
posts = xmlToList(posts)
lenPosts = length(posts)

posts = data.frame(Reduce(rbind, posts))
metaPosts = posts

#POST HISTORY
postHistory = xmlParse("PostHistory.xml")
postHistory = xmlToList(postHistory)
lenPostHistory = length(postHistory)

postHistory = data.frame(Reduce(rbind, postHistory))
metaPostHistory = postHistory
