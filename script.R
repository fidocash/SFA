rm(list=ls())

##TOOLS
library(miscTools)	#for likelihood-ratio test
library(plm)		#for using panel data
library(frontier)		#for SFA
library(moments)		#for statistics (skewness)
library(lattice)		#graphical tools
library(gridExtra)	#GridExtra is for multiple plots in one window using lattice	
##library(ggplot2)	#very advanced graphical tools (not used here)
#library(np)		#for non-parmaetric analysis (not used here)
library(xtable)		#for LaTex output (!!!UPLOAD ONLY IF YOU WANT .TEX FILES!!!)

##DATA
source('Script/rfiles/dataloading.R')
##SUMMARY - DESCR STATS
source('Script/rfiles/summary.R')
##PRODUCTION FUNCTION
source('Script/rfiles/productionfunction.R')
##COMPARISON
source('Script/rfiles/comparison.R')
##ELASTICITIES TRANSLOG
source('Script/rfiles/elasticities.R')
##MARGINAL PRODUCTS
source('Script/rfiles/marginalproducts.R')
##QUASICONCAVITY
source('Script/rfiles/qconcavity.R')
##EFFICIENCY MODEL - Z VARIABLES
source('Script/rfiles/coefficientsdelta.R')
##EFFICIENCIES
effCDt=t(effCD)
effTLt=t(effTL)
colnames(effTLt)=c(1:nrow(effTL))
colnames(effCDt)=c(1:nrow(effCD))
boxplot(effTL~FLAG_completo[year==1995],outline=FALSE)
*****************************************************************************************************************************
