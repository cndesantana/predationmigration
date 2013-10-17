alpha<-read.csv("./alpha_simpler.dat",sep=" ",header=FALSE)
alpha_nums<-((as.numeric(alpha$V2))[!is.nan((as.numeric(alpha$V2)))])[!is.infinite(((as.numeric(alpha$V2))[!is.nan((as.numeric(alpha$V2)))]))]
betha<-read.csv("./betha_simpler.dat",sep=" ",header=FALSE)
betha_nums<-((as.numeric(betha$V2))[!is.nan((as.numeric(betha$V2)))])[!is.infinite(((as.numeric(betha$V2))[!is.nan((as.numeric(betha$V2)))]))]
hist(alpha_nums,nclass=length(alpha_nums),xlim=c(0,0.05),xlab="Alpha values",main="Neutral")
