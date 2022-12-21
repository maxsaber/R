5+6
c(2, 6, 8, 10, 12)
c("Greg", "Henry", "Emily", "Susan")
mean(c(2, 6, 8, 10, 12))
data<- c(2, 6, 8, 10, 12)
mean(data)
mean(c(2, 6, 8, NA, 10, 12))
mean(c(2, 6, 8, NA, 10, 12), na.rm=T)
?mean
data[data>=8]
length(data[data>=8])
length(data[data==8])
graphs<- c( 2, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 6)
hist(graphs)
boxplot(graphs)
v1<-c("A", "A", "A", "B", "B", "B", "C", "C", "C")
v2<-c(1, 2, 3, 4, 5, 6, 7, 8, 9)
rbind(v1,v2)
cbind(v1,v2)
combined<- cbind(v1,v2)
tapply(v2, v1, mean)
boxplot(v2~v1)

attach(EP_Attest)