library(foreign)
library(dplyr)
library(tidyr)
health <- read.dta("Z:/Ferguson 13 march/other assignment/DS/Development sector/HIES 2012-2013/DATA/sec_i.dta")
health <- health[,c(2,4,8:18)]

health1 <- health[complete.cases(health$siq01),]
health1 = health1 %>% group_by(province,district,siq01) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

health2 <- health[complete.cases(health$siq02),]
health2 = health2 %>% group_by(province,district,siq02) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

health3 <- health[complete.cases(health$siq03),]
health3 = health3 %>% group_by(province,district,siq03) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

health4 <- health[complete.cases(health$siq04),]
health4 = health4 %>% group_by(province,district,siq04) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))


health5 <- health[complete.cases(health$siq05),]
health5 = health5 %>% group_by(province,district,siq05) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))



health6 <- health[complete.cases(health$siq06),]
health6 = health6 %>% group_by(province,district,siq06) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))


health7 <- health[complete.cases(health$siq07),]
health7 = health7 %>% group_by(province,district,siq07) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))


health8 <- health[complete.cases(health$siq08),]
health8 = health8 %>% group_by(province,district,siq08) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))


health9 <- health[complete.cases(health$siq09),]
health9 = health9 %>% group_by(province,district,siq09) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))



health10 <- health[complete.cases(health$siq10),]
health10 = health10 %>% group_by(province,district,siq10) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

health11 <- health[complete.cases(health$siq10),]
health11 = health11 %>% group_by(province,district,siq11) %>%
  summarise(count=n()) %>%
  mutate(pct=count/sum(count))

health1$factor <- colnames(health1)[3]
health2$factor <- colnames(health2)[3]
health3$factor <- colnames(health3)[3]
health4$factor <- colnames(health4)[3]
health5$factor <- colnames(health5)[3]
health6$factor <- colnames(health6)[3]
health7$factor <- colnames(health7)[3]
health8$factor <- colnames(health8)[3]
health9$factor <- colnames(health9)[3]
health10$factor <- colnames(health10)[3]
health11$factor <- colnames(health11)[3]

colnames(health1)[3] <- "attribute"
colnames(health2)[3] <- "attribute"
colnames(health3)[3] <- "attribute"
colnames(health4)[3] <- "attribute"
colnames(health5)[3] <- "attribute"
colnames(health6)[3] <- "attribute"
colnames(health7)[3] <- "attribute"
colnames(health8)[3] <- "attribute"
colnames(health9)[3] <- "attribute"
colnames(health10)[3] <- "attribute"
colnames(health11)[3] <- "attribute"


library(plyr)
health5$attribute <- mapvalues(health5$attribute, c(1,2,5,3),c("One", "Two",
                                                               "Five", "Three"))

health6$attribute <- mapvalues(health6$attribute, c(1,2,3,4,5), c("one", "Two",
                                                                  "Three", "Four", "Five"))


health7$attribute <- mapvalues(health7$attribute, c(1,2,3,4,5), c("one", "Two",
                               "Three", "Four", "Five"))
health <- rbind(health1,health2,health3,health4,
                   health5,health6,health7, health8, health9, health10, health11)

health$factor <- mapvalues(health$factor, c("siq01","siq02","siq10","siq11",
                                            "siq05","siq07","siq04","siq06",
                                            "siq08","siq09","siq03"), c("Did any delivery
                                                                take place in the last 3 years",
                                                                "did she recieve any pre-natal care during last pregnancy?",
                                                                "did she recieves any post-natal care during six weeks after dilivery?",
                                                                "from where was this care normally recieved?",
                                                                "how many tetanus toxoid injection were given during this pregnancy?",
                                                                "how many tetanus toxoid injections were given ?",
                                                                "was she given tetanus toxoid injections during last pregnancy?",
                                                                "were you given these injections during previous pregnancy?",
                                                                "where did child  born?",
                                                                "where did child  born?","who provided pre-natal care during last pregnancy?"))