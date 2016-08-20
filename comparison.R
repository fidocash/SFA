#TEST TRANSLOG AND COBB-DOUGLAS
#DEFINING A FUNCTION THAT ALLOWS TO PRINT THE RESULTS
test=function(t,cd){

	
	message("The results of the comparison between OLS and SFA models are: ")
	print(lrtest(t))
	message(" ")
	message(" ")
	message("The results of the comparison between Translog (t) and Cobb-Douglas (cd) are: ")
	print(lrtest(cd,t))##meglio translog
}

test(translog,cd)
#PLOT A COMPARISON BETWEEN THE EFFICIENCIES OF THE TWO MODELS
effCD<-efficiencies(cd)
effTL<-efficiencies(translog)
pdf("Script/compar.pdf")
compPlot(effCD,effTL)
dev.off()
#LaTex
#test OLS / SFA
primotex=xtable(lrtest(translog)); primotex=print(primotex,include.rownames=FALSE); write.table(primotex,"Script/tables/tabletestOLS.tex")
#std
secondotex=xtable(lrtest(cd)); secondotex=print(secondotex,include.rownames=FALSE); write.table(secondotex,"Script/tables/tableCDTL.tex")
