#참고
#https://dic1224.blog.me/220144052044

#1 random datasets
install.packages("biclust")
library("biclust")

set.seed(1)
data <- matrix(rbinom(400,50,0.4),20,20) #이항분포를 사용, 20*20 matrix
res <- biclust(data, method=BCCC(), delta=1.5, alpha=1, number=10)
res
#BCCC()방법으로 총 3개의 bicluster를 찾음 (res@number=3) / 각각의 bicluster들을 bc1, bc2, bc3이라 하겠음 / 그리고 bc1은 9행과 5열로 이루어져 있음.

bicluster(data,res)
#원래 함수의 모습은 다음과 같음: bicluster(data,res,number=1:res@Number)
#number를 따로 지정하지 않으면 모든 biclusters들을 보여줌 / number 지정-bicluster(data,res,number=1)

biclusternumber(res)

res@RowxNumber
res@NumberxCol

#======================================================
#2. datasets of BicatYeast
data("BicatYeast")
data1 <- discretize(BicatYeast)
plot(data1)
res1 <- biclust(data1, method=BCCC(), delta=0.5, alpha=1, number=10)
res1

data(BicatYeast)
write.table(BicatYeast, "C:/R/Bicluster_example/BicatYeast.txt", sep=" ", col.names=TRUE, row.names=TRUE, quote=TRUE, na="NA")
