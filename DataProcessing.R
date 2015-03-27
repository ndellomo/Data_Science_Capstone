setwd("~/Documents/Coursera/Data_Science_Capstone")
#install.packages("tm")
#install.packages("stylo")
#install.packages("SnowballC")
library(tm)
library(stylo)
library(SnowballC)

blog <- readLines("Data/en_US.blogs.txt")
blog.s <- blog[ifelse(rbinom(length(blog),1,.02),T,F)]
rm(blog);gc()

news <- readLines("Data/en_US.news.txt")
news.s <- news[ifelse(rbinom(length(news),1,.02),T,F)]
rm(news);gc()

twitter <- readLines("Data/en_US.twitter.txt")
twitter.s <- twitter[ifelse(rbinom(length(twitter),1,.02),T,F)]
rm(twitter);gc()

text <- c(blog.s,news.s,twitter.s); rm(blog.s,news.s,twitter.s);gc()

text.v <- VectorSource(text);rm(text);gc()

text.c <- Corpus(text.v);rm(text.v);gc()

text.c <- tm_map(text.c, tolower)
text.c <- tm_map(text.c, removePunctuation)
text.c <- tm_map(text.c, removeNumbers)
text.c <- tm_map(text.c, removeWords,stopwords("english"))
text.c <- tm_map(text.c, stemDocument)
inspect(text.c)

two.gram <- make.ngrams(text.c, ngram.size = 2)

two.gram <- as.data.frame(two.gram)
