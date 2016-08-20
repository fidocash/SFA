#COMPUTING MEAN, STD
averages=aggregate(dati[,c("REALGDP","EMP","RKNA")],list(country),mean)
print(averages)
var=aggregate(dati[,c("REALGDP","EMP","RKNA")],list(country),var)
std=data.frame(country=levels(country),sqrt(var[,2:ncol(var)]))
print(std)

#histograms OF MEAN - NB. IF YOU USE LATTICE PACK. YOU MUST PRINT THE PLOT FIRST, THEN SAVE IT. IF YOU DON'T USE ANY PARTICULAR GRAPH.PACK IT IS NOT NECESS. TO PRINT
					#plus, USING LATTICE, FOR MULTI PLOTS, IT'LL BE NECESSARY TO USE GRID.ARRANGE (REMEMBER TO INSTALL RELATED PACKAGE) INSTEAD OF PAR.
pdf('Script/outputaverage.pdf')
print(histogram(averages$REALGDP,main="Real GDP - mean values",xlab="Real GDP"))
dev.off()
pdf('Script/inputaverage.pdf')
##ONLY IF NO LATTICE par(mfrow=c(1,2))
plot1=histogram(averages$RKNA,main="Real Capital stock - mean values",xlab="Real Capital");
plot2=histogram(averages$EMP,main="Labour force - mean values",xlab="Labour")
grid.arrange(plot1,plot2,nrow=2)
dev.off()

#time series

#printing latex
#mean
meantex=xtable(averages); meantex=print(meantex,include.rownames=FALSE); write.table(meantex,"Script/tables/tablemean.tex")
#std
stdtex=xtable(std); stdtex=print(stdtex,include.rownames=FALSE); write.table(stdtex,"Script/tables/tablestd.tex")
