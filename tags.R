#Extracting data for Stack Overflow
setwd("/media/alok/New Volume/sodata")
require("XML")

data = xmlParse("Tags.xml")
tags = xmlToList(data)

len = length(tags)
#print(len)

#df = data.frame(matrix(unlist(tags)), nrow = len)
df = data.frame(Reduce(rbind, tags))
