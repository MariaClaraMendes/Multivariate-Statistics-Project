#limpar console
cat("\014")

#limpar janelas dos plots
graphics.off()

#apagar variáveis no histórico
rm(list=ls())

#configurar o diretório de trabalho
setwd("C:/Users/CETAI_USP/Desktop/estatística")

#ler arquivo com os dados
dados<-read.csv2(file="dados_EVAP.csv",header=T)

#desvio padrão e média 
(dados)
sd2<-sd(X2)
sd2
med2<-mean(X2)
med2

#plotar dados
boxplot(X2)
boxplot(dados)
col<-ncol(dados)
boxplot(dados[,2:13])

#plotar histograma
hist(X2)
hist(X1,freq=F)

#curva normal
x<-seq(from=1000,to=3000,by=100)
dens<-dnorm(x,mean=med2 ,sd=sdd2)
lines(x,dens,col="red",lwd=2)
abline(v=med2,lty=2)

#INTERVALO DE CONFIANÇA - t-Student
alpha<-0.05
prob<-1-alpha/2
#n<-length(X2)
t<-qt(p=prob,df=n-1)
t
erro<-t*sdd2/sqrt(n)
LI_IC<-med2-erro
LS_IC<-med2+erro
c(LI_IC,LS_IC)

#CARTA DE CONTROLE
LS<-mean(dados$X2)+3*sdd2
LI<-mean(dados$X2)-3*sdd2
plot(dados$tempo..h.,dados$X2,main="Gráfico de controle: X2 = média +- .s",xlab="tempo (h)",ylab="vazão X2 (L/min)",pch=1,ylim=c(900,3000))

abline(h=med2,col=2,lwd=2)
abline(h=LS,col=2,lwd=2,lty=2)
abline(h=LI,col=2,lwd=2,lty=2)

dados<-dados[,2:col]
cov(dados)
cor(dados)

mdist<-mahalanobis(x=dados,center=colMeans(dados),cov(dados))
dados<-cbind(dados,mdist)
limite<-qchisq(0.975,12)
plot(mdist)
abline(h=limite,col=2,lty=2)

originais<-dim(dados)
originais<-originais[1]

outliers<-dados[mdist>limite,]
dados<-dados[mdist<limite,]

dados<-dados[,-ncol(dados)]
outliers<-outliers[,-ncol(outliers)]

plot(dados$x4,dados$x5)
lines(outliers$x4,outliers$x5,type="p",col=2,pch=19)
