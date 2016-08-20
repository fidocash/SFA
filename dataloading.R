##DATA
data(RISTRETTO)
dati<-plm.data(RISTRETTO,c("country","year"))

#DEFINING ADDITIONAL VARIABLES
anni=20
t1<-c(1:anni)
dati$t<-rep(t1,length(levels(dati$country))) 						#TIME
dati$t2<-rep(t1^2,length(levels(dati$country)))						#TIME SQUARED
Dummytempo<-rep(c(rep(0,14),rep(1,6)),length(levels((dati$country))))		#TEMPORAL DUMMY -- BREAK STRUTTURALE IN 2009
dati$Dtempo<-Dummytempo
attach(dati)