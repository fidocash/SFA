##translog

	#B&C95 | INPUTS = LABOUR, CAPITAL (PENN WORLD TABLES 9.0) | OUTPUT = REALGDP (PENN WORLD TABLES 9.0) | VARIABLES IN THE EFF.MODEL = FDIPERGDP (UNCTAD), ECI (HARVARD), HC (PENN WORLD TABLES 9.0 BY BARRO)
	# ADDED VARIABLES = t (TIME TREND), DGEO (GEOGRAPHICAL DUMMY, FOR MOST DEVELOPED COUNTRIES, 1 if MOST DEV, 0 otherwise)

	translog=sfa(log(REALGDP)~log(EMP)+log(RKNA)+I(0.5*log(RKNA)^2)+I(0.5*log(EMP)^2)+I(log(EMP)*log(RKNA))+t+Dgeo|FDIperGDP+ECI+HC+I(HC*FDIperGDP)+I(FDIperGDP*ECI),data=dati)
	print(summary(translog,extraPar=TRUE))
##prova cobb douglas

	cd=sfa(log(REALGDP)~log(EMP)+log(RKNA)+t+Dgeo|FDIperGDP+ECI+HC+I(HC*FDIperGDP)+I(FDIperGDP*ECI),data=dati)
	print(summary(cd,extraPar=TRUE))

#printing latex
#translog 
#tltex=xtable(summary(translog)); tltex=print(tltex,include.rownames=FALSE,extraPar=TRUE); write.table(tltex,"Script/tables/tabletranslog.tex")
#std
#cdtex=xtable(cd); cdtex=print(cdtex,include.rownames=FALSE,extraPar=TRUE); write.table(cdtex,"Script/tables/tablecd.tex")
