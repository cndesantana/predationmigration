choosefiles<-function(sp){
	return(files[(as.integer(seeds)%in%seed)&(as.integer(species)%in%sp)]);
}

args <- commandArgs();

if(length(args)==5){
	patch<-as.integer(args[3]);
	seed<-as.integer(args[4]);
	time<-as.integer(args[5]);

	files<-unlist(as.character(system("ls output_species*.dat",intern=TRUE)));
	seeds<-unlist(strsplit(as.character(files), "[_]"))[((1:(length(unlist(strsplit(as.character(files), "[_]")))))%%9)==5];
	species<-unlist(strsplit(as.character(files), "[_]"))[((1:(length(unlist(strsplit(as.character(files), "[_]")))))%%9)==3];
	nspecies<-length(unique(sort(species)));
	myfiles<-sapply(1:nspecies,choosefiles);

	patchfile<-paste("./IndividualsInPatch_",patch,"_seed_",seed,".csv",sep="");
	mydat<-array(0,dim=c(time,nspecies));
	
	for(f in 1:nspecies){
		filename<-myfiles[f];
		cat(filename,sep="\n");
		dat<-read.csv(filename,sep=" ",header=FALSE);
		dat<-dat[,-101];
		cat(paste("PATCH = ",patch,sep=""),sep="\n");
		mydat[,f]<-dat[,patch];
	}

	write.table(mydat,file=patchfile,quote=FALSE,sep=" ");
	
} else{ 
	cat("To execute the script, Run:\n\t R CMD BATCH plotPatchDynamic.R patch seed totaltime\n\n");
	return;
}
