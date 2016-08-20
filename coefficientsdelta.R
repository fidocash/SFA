#effect of Zs on efficiency

#defining ordered variables (increasing order) used for computing quartiles
ordECI=ECI[order(ECI)]
ordHC=HC[order(HC)]
ordFDI=FDIperGDP[order(FDIperGDP)]
#defining restricted variables 
q.ECI=ordECI[ordECI >= quantile(ordECI)[2] & ordECI <= quantile(ordECI)[4]]
q.HC=ordHC[ordHC >= quantile(ordHC)[2] & ordHC <= quantile(ordHC)[4]] 
q.FDI=ordFDI[ordFDI >= quantile(ordFDI)[2] & ordFDI <= quantile(ordFDI)[4]] 

#global effects
dFDI<- coef(translog)["Z_FDIperGDP"]+coef(translog)["Z_I(FDIperGDP * ECI)"]*q.ECI+coef(translog)["Z_I(HC * FDIperGDP)"]*q.HC
dECI<- coef(translog)["Z_ECI"]+coef(translog)["Z_I(FDIperGDP * ECI)"]*q.FDI
dHC<- coef(translog)["Z_HC"]+coef(translog)["Z_I(HC * FDIperGDP)"]*q.FDI

##Decomposing FDI effect
dFDIonlyECI= coef(translog)["Z_I(FDIperGDP * ECI)"]*q.ECI							## 1st 3 quartile

dFDIonlyHC= coef(translog)["Z_I(HC * FDIperGDP)"]*q.HC							## 1st 3 quartile

##Decomposing ECI effect
dECIonlyFDI= coef(translog)["Z_I(FDIperGDP * ECI)"]*q.FDI							## 1st 3 quartile

##Decomposing HC effect
dHConlyFDI= coef(translog)["Z_I(HC * FDIperGDP)"]*q.FDI							## 1st 3 quartile


#loop for 3D-plot (!!!WARNING!!! TIME CONSUMING)
mFDI<- matrix(nrow=length(q.ECI),ncol=length(q.HC))
for (i in 1:length(q.ECI)){
				for (j in 1:length(q.HC)){
				mFDI[i,j]=coef(translog)["Z_FDIperGDP"]+coef(translog)["Z_I(FDIperGDP * ECI)"]*q.ECI[i]+coef(translog)["Z_I(HC * FDIperGDP)"]*q.HC[j]
}
}
##GRAPHS

#countour lines of 3D function
pdf('Script/contour.pdf')
print(contour(mFDI,xlab="ECI",ylab="HC"))
dev.off()
#3D-plot (!!!IT MUST BE RUN ALONE--ctrl+R--!!! UNKNOWN REASON - PROBLEM WITH PDF FUNCTION)
pdf('Script/3Dplot.pdf')
print(wireframe(mFDI,shade=TRUE,zlab="delta_FDI",xlab="ECI",ylab="HC",main="3D-plot of delta_FDI"))
dev.off()
#preparing data.frame for boxplot
flag=c(rep("FDI",length(dFDI)),rep("ECI",length(dECI)),rep("HC",length(dHC))
#histograms and boxplot
hfdi=histogram(dFDI)
heci=histogram(dECI)
hhc=histogram(dHC)
box=bwplot(c(dFDI,dECI,dHC)~flag)##warning: you must respect the order defined in flag
pdf('Script/deltahist.pdf')
grid.arrange(hfdi,heci,hhc,box)
dev.off()