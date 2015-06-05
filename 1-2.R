rm(list = ls())
library(KoNLP)
library(wordcloud)
library(stringr)

# 세종사전에 서울 관광지명치 추가
useSejongDic()
mergeUserDic(data.frame(readLines("mergefile.txt"), "ncn"))

# 분석할 원본 자료를 변수에 불러 들여서 명사만 분리
txt <- readLines(encoding = "UTF-8", "seoul_go.txt")
place <- sapply(txt, extractNoun, USE.NAMES = F)
head(place, 10)
head(unlist(place), 30)
c <- unlist(place)
place <- Filter(function(x) {nchar(x) >= 2}, c)
res <- str_replace_all(place, "[^[:alpha:]]", "") #영문, 한글 아닌것 전부 제거
res <- res[res != ""] #벡터에서 공백 제거
res <- gsub("서울", "", res)

