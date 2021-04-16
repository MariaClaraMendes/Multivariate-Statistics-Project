#limpar console
cat("\014")

#limpar janelas dos plots
graphics.off()
#apagar variáveis no histórico
rm(list=ls())

#configurar o diretório de trabalho
setwd("C:/Users/CETAI_USP/Desktop/estatística/Técnicas/PCA")

#ler arquivo com os dados
dados<-read.csv2(file="dadospca.csv",header=T)

#realização da PCA (duas funções)

#função princomp()
#Decomposição Espectral (correlações entre variáveis)

#função prcomp()
#precisão numérica ligeiramente melhor
#Decomposição em valores singulares (correlações entre indivíduos)


boxplot(dados)

#prcomp() - Descomposição em Valores Singulares
pca<-prcomp(dados,scale=TRUE) #PELA MATRIZ DE CORRELAÇÃO
#TRUE -> matriz de correlação
#FALSE -> matriz de covariância

names(pca)
#standard deviations of the PCs (sdev)
pca$sdev
#The relationship (correlation or anticorrelation, etc) between the initial variables and the PCs (loadings) 
pca$rotation
#variable means (the center point)
pca$center
#variable standard deviations (scaling)
pca$scale
#The values of each sample in terms of the principal components (scores) 
pca$x
pca_var<-pca$sdev^2
pca_propvarex<-pca_var/sum(pca_var)*100
summary(pca)

#Scree Plots
screeplot(pca,type="line")
abline(h=1,lty=2,lwd=1.5,col=2)

plot(cumsum(pca_propvarex),type="b")
abline(h=90,lty=2,lwd=1.5,col=2)


#Loading Plots
#Loadings para a PC1
#loadings
pca.load<-pca$rotation
pca.load.ordered.1<-pca.load[order(abs(pca.load[,1])),1]
pca.load.ordered.1
dotchart(pca.load.ordered.1,cex=0.7,xlab="Loadings", ylab="Variáveis")

pca.load<-pca$rotation
pca.load.ordered.2<-pca.load[order(abs(pca.load[,2])),2]
pca.load.ordered.2
dotchart(pca.load.ordered.2,cex=0.7,xlab="Loadings", ylab="Variáveis")

pca.load<-pca$rotation
pca.load.ordered.3<-pca.load[order(abs(pca.load[,3])),3]
pca.load.ordered.3
dotchart(pca.load.ordered.3,cex=0.7,xlab="Loadings", ylab="Variáveis")


#Biplots (A biplot is a type of plot that will allow you to visualize how the samples 
#relate to one another in our PCA - which samples are similar and which are different - and will simultaneously reveal how each variable contributes to each principal component)
#scale = 0 ensures that arrows are scaled to represent the loadings
biplot(pca ,scale=0,cex=c(0.5,0.85))

