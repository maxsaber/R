install.packages("dplyr")
library(dplyr)
drg2012_h<- group_by(drg2012_h, drg, state)
drg2012_s <- summarize(drg2012_h, discharges_s=sum(discharges_h), avgcovcharges_s=weighted.mean(avgcovcharges_h, discharges_h), avgtotpayments_s=weighted.mean(avgtotpayments_h, discharges_h), avgmcpayments_s=weighted.mean(avgmcpayments_h, discharges_h))
drg2012_s <- group_by(drg2012_s, drg)
drg2012_d <- summarize(drg2012_s, discharges_d=sum(discharges_s), avgcovcharges_d=weighted.mean(avgcovcharges_s, discharges_s), avgtotpayments_d=weighted.mean(avgtotpayments_s, discharges_s), avgmcpayments_d=weighted.mean(avgmcpayments_s, discharges_s))
drg2012_h <- mutate(drg2012_h, paymentdiff_h = avgtotpayments_h - avgmcpayments_h) 
drg2012_s <- mutate(drg2012_s, paymentdiff_s = avgtotpayments_s - avgmcpayments_s) 
drg2012_d <- mutate(drg2012_d, paymentdiff_d = avgtotpayments_d - avgmcpayments_d)

drg2011_h<- group_by(drg2011_h, drg, state)
drg2011_s <- summarize(drg2011_h, discharges_s=sum(discharges_h), avgcovcharges_s=weighted.mean(avgcovcharges_h, discharges_h), avgtotpayments_s=weighted.mean(avgtotpayments_h, discharges_h), avgmcpayments_s=weighted.mean(avgmcpayments_h, discharges_h))
drg2011_s <- group_by(drg2011_s, drg)
drg2011_d <- summarize(drg2011_s, discharges_d=sum(discharges_s), avgcovcharges_d=weighted.mean(avgcovcharges_s, discharges_s), avgtotpayments_d=weighted.mean(avgtotpayments_s, discharges_s), avgmcpayments_d=weighted.mean(avgmcpayments_s, discharges_s))
drg2011_h <- mutate(drg2011_h, paymentdiff_h = avgtotpayments_h - avgmcpayments_h) 
drg2011_s <- mutate(drg2011_s, paymentdiff_s = avgtotpayments_s - avgmcpayments_s) 
drg2011_d <- mutate(drg2011_d, paymentdiff_d = avgtotpayments_d - avgmcpayments_d)

install.packages("ggplot2")
library(ggplot2)
diff_d <- ggplot(drg2012_d, aes(x=reorder(drg, paymentdiff_d), y=paymentdiff_d))
diff_d + geom_bar(stat="identity") + coord_flip()
diff_d + geom_point(size=3) + coord_flip()
drg2012_s_fusion <- filter(drg2012_s,drg == "460 - SPINAL FUSION EXCEPT CERVICAL W/O MCC")
diff_s_fusion <- ggplot(drg2012_s_fusion,aes(x=reorder(state, paymentdiff_s), y=paymentdiff_s))
diff_s_fusion + geom_point(size=3) + coord_flip()
diff_smap <- ggplot(drg2012_s, aes(x=state, y=drg,fill=paymentdiff_s))
diff_smap + geom_tile() + scale_fill_gradient(low="grey",high="red")

diff2011 <- select(drg2011_s, drg, state, diff2011=paymentdiff_s)
diff2012 <- select(drg2012_s, drg, state, diff2012=paymentdiff_s)
diffchange <- inner_join(diff2011, diff2012, by=c("drg","state"))
diffchange <- mutate(diffchange, diff_change = diff2012 - diff2011)

diffmap <- ggplot(diffchange, aes(x=state, y=drg,fill=diff_change))
diffmap + geom_tile() + scale_fill_gradient2(low="black",mid="grey", high="red")
