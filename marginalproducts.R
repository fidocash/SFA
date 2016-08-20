#MARGINAL PRODUCTS
dati$mpCap <- with( dati, dati$eCap * REALGDP / RKNA )
dati$mpLab <- with( dati, dati$eLab * REALGDP / EMP )

#HIST
pdf('Script/MarginalProducts.pdf')
#par(mfrow=c(2,1))
plot1=histogram(dati$mpCap,main="Marginal Prod. Capital",xlab="MP Capital",xlim=c(min(dati$mpCap)-0.05, max(dati$mpCap)+0.05), panel = function(x, ...) { 
              																panel.histogram(x, ...) 
																		panel.abline(v= median(dati$mpCap),col="red")
																})
plot2=histogram(dati$mpLab,main="Marginal Prod. Labour",xlab="MP Labour",panel = function(x, ...) { 
              																panel.histogram(x, ...) 
																		panel.abline(v= median(dati$mpLab),col="red")
																	})
grid.arrange(plot1,plot2,nrow=2)
dev.off()

#SUMMARY

message("The summary statistics of the mp of the capital are: "); print(summary(dati$mpCap))
message("The summary statistics of the mp of the labour are: "); print(summary(dati$mpLab))
