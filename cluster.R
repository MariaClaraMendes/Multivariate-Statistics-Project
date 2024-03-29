#limpar console
cat("\014")

#limpar janelas dos plots
graphics.off()

#apagar vari�veis no hist�rico
rm(list=ls())

#configurar o diret�rio de trabalho
setwd("C:/Users/CETAI_USP/Desktop/estat�stica/T�cnicas/CLUSTER")

#ler arquivo com os dados
dados<-read.csv2(file="crudeoil.csv",header=T)

dadosZ<- scale(dados)


#c�lculo da dist�ncia euclidiana
distancia<-dist(dadosZ,method = "euclidean")
print(distancia)

#distancia<-dist(dadosZ,method = "manhattan")
#(distancia)

#Hier�rquico
hc.hier<-hclust(distancia,method = "centroid")
names(hc.hier)
#valores do eixo y do Dendrograma
hc.hier$height
x11()
plot(hc.hier,hang = -1)

#desenhar ret�ngulos separando os grupos
rect.hclust(hc.hier,k=15,border="red")

#cluster N�o-Hier�rquico (K-means)
#determina��o do n�mero de grupos (cluster)
set.seed(555)
wss<-0
i<-0
for (i in 1:20) {wss[i]<-sum(kmeans(dadosZ,centers = i)$withinss)}
plot(1:20,wss)
x11()
plot(wss,type="b")
set.seed(1223)
kc<-kmeans(dadosZ,4)
names(kc)

#adicionar clusters nas observa��es
groups.k<-kc$cluster
dadosC.k<-cbind(dados,groups.k)

aggregate(dadosZ,list(groups.k),mean)
plot(dados$x1,dados$x2,col=kc$cluster,pch=kc$cluster)
legend("topright",legend = paste("Po�o",unique(sort(kc$cluster)),pch=unique(sort(kc$cluster)),
col=unique(sort(kc$cluster))))

plot(dados$x3,dados$x4,col=kc$cluster,pch=kc$cluster)
legend("topright",legend = paste("Po�o",unique(sort(kc$cluster)),pch=unique(sort(kc$cluster)),
                                 col=unique(sort(kc$cluster))))

plot(dados$x2,dados$x3,col=kc$cluster,pch=kc$cluster)
legend("topright",legend = paste("Po�o",unique(sort(kc$cluster)),pch=unique(sort(kc$cluster)),
                                 col=unique(sort(kc$cluster))))


#cluster de vari�veis usando o pacote clustofvar
library(ClustOfVar)
hc.var<-hclustvar(dados)
plot(hc.var,cex=8, main = "Dendrograma Vari�veis")

