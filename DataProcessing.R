setwd("~/Documents/Coursera/Data_Science_Capstone")
install.packages("tm")
library(tm)

blog <- readLines("Data/en_US.blogs.txt")
blog.s <- blog[ifelse(rbinom(length(blog),1,.05),T,F)]
rm(blog);gc()

news <- readLines("Data/en_US.news.txt")
news.s <- news[ifelse(rbinom(length(news),1,.05),T,F)]
rm(news);gc()

twitter <- readLines("Data/en_US.twitter.txt")
twitter.s <- twitter[ifelse(rbinom(length(twitter),1,.05),T,F)]
rm(twitter);gc()


blog.v <- VectorSource(blog.s);rm(blog.s);gc()
news.v <- VectorSource(news.s);rm(news.s);gc()
twitter.v <- VectorSource(twitter.s);rm(twitter.s);gc()

blog <- Corpus(blog.v);rm(blog.v);gc()
news <- Corpus(news.v);rm(news.v);gc()
twitter <- Corpus(twitter.v);rm(twitter.v);gc()

blog <- tm_map
