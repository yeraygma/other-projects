# nMDS Charco El Pal-Mar stations similarities

rm(list=ls()) #clear workspace
graphics.off() 

#libraries


#SET WORKING DIRECTORY AND LOAD DATA FILE
setwd ("C:\\Users\\Administrator\\Documents\\R\\palm")

#GET DATA
#data2<-read.table("C:\\Users\\administrator\\Documents\\R\\MDS_poliquetos\\poliquetosmds.txt",dec = ",", header=T)

#el archivo tiene que estar guardado en excel en formato "text MS2" con extensión txt cuando se guarda
data<-read.table("C:\\Users\\administrator\\Documents\\R\\palm\\pdatani.txt", dec = ",", header=T)
data.env <-read.table("C:\\Users\\administrator\\Documents\\R\\palm\\data.env.txt", dec = ",", header=T)
#data <- lapply(data, function(x) as.numeric(as.character(x)))







#data<-data.frame(data, row.names=data$name) Si se activa esta línea se quitan los nombres de las estaciones
#data$especies<-NULL


# RUN NMDS and plot it
#hay que instalar packages permute y lattice
library(vegan)

data_NMDS<-metaMDS(data,k=2,trymax=1000, distance = "bray")

pchs<- c(1:3)
gr.sitio <- factor(data.env$sitio)
gr.piso <- factor(data.env$piso)
col.gr <- c("blue", "red")

plot(data_NMDS, type = "n", display = "sites")
orditorp(data_NMDS,display="sites",col="dark grey",air=0.01)
points(data_NMDS, display = "sites", pch = pchs[gr.piso], col = col.gr[gr.sitio])
legend("topright", legend=levels(gr.sitio), bty = "n", col= c("black"), pch = pchs)
legend("bottomright", legend = levels(gr.piso), bty = "n", col = col.gr, pch=c(30),)