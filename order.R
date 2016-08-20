orderedECI=dECI[order(dECI)]

orderedECI[orderedECI >= quantile(orderedECI)[2] & orderedECI <= quantile(orderedECI)[4]]
