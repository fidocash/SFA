#SECOND PARTIAL DERIVATIVES
#COMPUTING FITTED VALUES OF THE THEORETICAL MODEL OBTAINED
qtranslog=exp(fitted(translog))
#COMPUTING SECOND DERIVATIVES
fCapCap <- with( dati, qtranslog/ RKNA^2 * ( b11 + dati$eCap^2 - dati$eCap ) )
fLabLab <- with( dati, qtranslog/ EMP^2 * ( b22 + dati$eLab^2 - dati$eLab ) )
fCapLab <- with( dati, qtranslog/ (RKNA*EMP) * ( b12 + dati$eCap*dati$eLab))

#COMPUTING THE BORDERED HESSIAN (WARNING=THE SIZE OF THE MATRIX MUST BE CHANGED MANUALLY BEFORE RUNNING THE SCRIPT, IN THIS CASE IS A 3X3 = 2 INPUTS + HESSIAN'S BORDERS)
dati$quasiconc <- NA
for( obs in 1:nrow( dati ) ) {
 bhmLoop <- matrix( 0, nrow = 3, ncol = 3 )
 bhmLoop[ 1, 2 ] <- bhmLoop[ 2, 1 ] <- dati$mpCap[ obs ]
 bhmLoop[ 1, 3 ] <- bhmLoop[ 3, 1 ] <- dati$mpLab[ obs ]
 bhmLoop[ 2, 2 ] <- fCapCap[ obs ]
 bhmLoop[ 3, 3 ] <- fLabLab[ obs ]
 bhmLoop[ 2, 3 ] <- bhmLoop[ 3, 2 ] <- fCapLab[ obs ]
 dati$quasiconc[ obs ] <- det( bhmLoop[ 1:2, 1:2 ] ) < 0 &
 det( bhmLoop ) > 0
 }
message("The number of observations that meet the quasiconcavity assumption is ",sum( dati$quasiconc ))