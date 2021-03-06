#Rotete DITECTNET label flip (right-left)
#Ditectnetの形式のラベルのテキストファイルが入ったフォルダを指定して、すべてのラベルをflip(左右反転)させた画像に対応するラベルにします。
#画像のサイズを1248x384に対応させています。

#90deegree rotation
##x1 <- read.table("P1010767.txt",sep=" ",as.is=T,header=F)
#imgx <- 1248; imgy <- 384
#x1 <- matrix(strsplit(c("Car 0.0 0 0.0 7 4 380 196 0.0 0.0 0.0 0.0 0.0 0.0 0.0")," ")[[1]],nrow=1)

rotationflip <- function(x1,imgx,imgy){
 x1 <- as.matrix(x1)
 labels <- x1[,1]
 x1 <- matrix(as.numeric(x1[,]),byrow=F,ncol=15)
 xst=x1[,5]
 xen=x1[,7]
 yst=x1[,6]
 yen=x1[,8]
 lab=x1[,1]
 ids=1:nrow(x1)
 x2 <- x1
 x2[,5]=imgx-xen
 x2[,7]=imgx-xst
 x2[,6]=yst
 x2[,8]=yen
 x2[,1]=labels
 return(x2)
}

imgx <- 1248; imgy <- 384  #Please Modify to Your image size
path1 <- choose.dir(getwd(), "Choose a data folder")
infiles1 <- dir(path1,"*.txt$",full.names=T)

for(i in 1:length(infiles1)){
	infile <- read.table(infiles1[i],sep=" ",as.is=T,header=F)
	outfname <- paste(strsplit(infiles1[i],"\\.")[[1]][1],"_rflip.txt",sep=" ")
	result <- rotationflip(infile,imgx,imgy)
	write.table(result,file=outfname,row.names=F,col.names=F,sep=" ",quote=F
	)
}

#end
