#Não-Hierárquico
#k-means
#determinação do número de grupos (clusters)
#limpar console
cat("\014")

#limpar janelas dos plots
graphics.off()

#apagar variáveis no histórico
rm(list=ls())

#configurar o diretório de trabalho
setwd("C:/Users/CETAI_USP/Desktop/estatística/Técnicas/CLUSTER/Evaporação")

#ler arquivo com os dados
dados<-read.csv2(file="dadosevap.csv",header=T)

dadosZ<- scale(dados)

#cálculo da distância euclidiana
distancia<-dist(dadosZ,method = "euclidean")
print(distancia,digits = 2 )

#1)_____________________Método Hierárquico_______________________________




set.seed(555)
wss<-0
i<-0
for (i in 1:20) wss[i]<-sum(kmeans(dadosZ,centers = i)$withinss)

plot(1:20,wss)
plot(wss,type = "b", pch=1)

set.seed(222)
kc<-kmeans(dadosZ,5)
groups.k<-kc$cluster
dadosC.k<-cbind(dados,groups.k)
kc

#adicionar clusters nas observações
groups.k<-kc$cluster
dadosC.k<-cbind(dados,groups.k)

aggregate(dadosZ,list(groups.k),mean)

write.csv2(dadosC.k, file = "evap_agrupados.csv",row.names=F)
plot(dados,col=groups.k,pch=groups.k)
plot(dados$X4, dados$X5, col=groups.k,pch=groups.k)
legend("topleft",legend=paste("Grupo",unique(sort(kc$cluster))),pch=unique(sort(kc$cluster)),col=unique(sort(kc$cluster)))
kc



#cluster de variáveis usando o pacote clustofvar
library(ClustOfVar)
hc.var<-hclustvar(dados)
plot(hc.var,cex=.8, main = "Dendrograma Variáveis")
rect.hclust(hc.var,h=.8,border = "red")
groups.var<-cutree(hc.var, h=.8)


