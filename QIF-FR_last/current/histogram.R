pdf("./results/hist_simu.pdf");
data<-read.table(file="./results/volt.dat");
# para delimitar el histograma:
data2 <- data[abs(data[,1])<=20,];
x <- hist(data2,breaks=seq(-20,20,by=0.1),freq=FALSE);
graphics.off();
write.table(cbind(x$breaks[1:length(x$counts)],x$density),file="./results/hist_simu.dat",row.names=FALSE,col.names=FALSE);

