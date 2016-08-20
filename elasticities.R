#coefficients

b1<- coef(translog)["log(RKNA)"]
b2<- coef(translog)["log(EMP)"]
b11<- coef(translog)["I(0.5 * log(RKNA)^2)"]
b22<- coef(translog)["I(0.5 * log(EMP)^2)"]
b12<-coef(translog)["I(log(EMP) * log(RKNA))"]

#updating dataset
dati$eCap<-with(dati, b1+b11*log(RKNA)+b12*log(EMP))
dati$eLab<-with(dati, b2+b22*log(EMP)+b12*log(RKNA))
#histograms
pdf('Script/elasticities.pdf')
##par(mfrow=c(2,1))
plot1=histogram(dati$eCap, main="Elasticity of Capital",xlab="Capital", panel = function(x, ...) { 
              																panel.histogram(x, ...) 
																		panel.abline(v= median(dati$eCap),col="red")
																	})
plot2=histogram(dati$eLab, main="Elasticity of Labour",xlab="Labour", panel = function(x, ...) {
																		panel.histogram(x, ...)
																		panel.abline(v= median(dati$eLab),col="red")
})
grid.arrange(plot1,plot2,nrow=2)
dev.off()

#nro DMU elast negativa
message("The number of observations with a negative elasticity of capital is: ", sum(dati$eCap < 0))
message("The number of observations with a negative elasticity of labour is: ", sum(dati$eLab < 0))
mono<-with(dati, eCap>= 0 & eLab>=0)
message("The number of observations with a negative elasticity of capital and labour is: ", sum(!mono), " over a total of ", nrow(dati), " (the ", sum(!mono)/nrow(dati)*100,"%)")
message("The summary statistics of the elasticity of output to capital are: "); print(summary(dati$eCap))
message("The summary statistics of the elasticity of output to labour are: "); print(summary(dati$eLab))