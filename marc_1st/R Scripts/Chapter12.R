attach(fivestar)
dim(fivestar)
sapply(fivestar, mean, na.rm=TRUE)
colnames(fivestar)
NHcolumns <- c("overall","qual_rate", "staff_rate", "rn_rate", "owner_group", "health_insp", "restot", "ssf" )
NH<- fivestar[NHcolumns]
View(NH)
attach(NH)
NH.lm<-lm(overall ~ qual_rate + health_insp + staff_rate +
            rn_rate + as.factor(owner_group) + restot +
            as.factor(ssf))
NH.lm
summary(NH.lm)
summary(unclass(summary(NH.lm)))
summary(NH.lm)$adj.r.squared
colnames(summary(NH.lm)$coefficients)
sort(summary(NH.lm)$coef[,"Pr(>|t|)"], decreasing=T)
NH.lm2<-lm(overall ~ qual_rate + health_insp + staff_rate +
             as.factor(owner_group) + restot + as.factor(ssf))
summary(NH.lm2)$adj.r.squared
sort(summary(NH.lm2)$coef[,"Pr(>|t|)"], decreasing=T)
sse1 <- sum(resid(NH.lm)^2)
sse2 <- sum(resid(NH.lm2)^2)
sse1
sse2
cor(rn_rate, staff_rate)
summary(NH.lm2)
NH1<-data.frame(quality=c(1,1,0,0,1,1,0,0),
                survey=c(1,0,1,0,1,0,1,0), overall=c(1,1,1,1,0,0,0,0),
                count=c(82,1010,52,228,0,1971,178,1045054))
NH1.logit<-glm(overall~factor(quality) + factor(survey), weights=count,
               data=NH1, family="binomial")
summary(NH1.logit)
exp(coef(NH1.logit))
NH1.logit2<-glm(overall~factor(quality) * factor(survey), weights=count,
                data=NH1, family="binomial")
summary(NH1.logit2)
step(NH1.logit2)
