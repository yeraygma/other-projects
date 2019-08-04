#power test and effect size analysis

rm(list=ls()) #clear workspace
graphics.off()
install.packages('pwr')
install.packages('lsr')


library(pwr)
library(lsr)

#Power analysis del t-test de acuerdo con Cohen 1988.
#el Effect size indica si las diferencias resultado del test son pequeñas, medianas o grandes, independientemente del p-value
#nota: Cohen effect size = d; effect size small --> d = 0.1-0.3; effect size medium -> d = 0.5-0.79; effect size large > 0.8
a <- c(1,1,2,2,3,4,3,4,3)
b <- c(3,4,3,2,3,4,3,2,3)

#cohen's d effect size
#ver http://rcompanion.org/handbook/I_03.html

cohensD (sodium ~instructor , data = Data)

#con el resultado de d = x, incluirlo en la siguiente función 

pwr.t.test(n = 25, d = 0.8 , sig.level = 0.05, type = "two.sample" )
#un valor aceptable de power es 0.8