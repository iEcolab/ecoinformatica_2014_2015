#Cargo las librerias Kendall, sp, rgdal, classInt y RColorBrewer
library('Kendall')  
library(sp)
library(rgdal)
library(classInt)
library(RColorBrewer)


v <- c()#Creo un vector (v) que almacena los valores del ndvi de un pixel para todos los años
m <- c()#Almacena los valores del Analisis MannKendall de robledal
m2 <-c()#Almacena los valores del Analisis MannKendall de nieve
tau <-c()
pvalue <- c()
lat <- c()
lng <- c()

#######ROBLEDAL########
#Leo la table de ndvi_robledal
ndvi <- read.table("ndvi_robledal.csv",header = TRUE,sep=';')

#Creo un bucle 
for(k in 1:1814){
  
  #Almaceno la latitud y longitud de cada pixel
  lat[k] <-ndvi$lat[(k-1)*13+1] 
  lng[k] <-ndvi$lng[(k-1)*13+1]
  
  
 for(i in 1:13){
   
   #Almaceno el valor del ndvi de cada año para cada pixel
   v[i]=ndvi$ndvi_i[(k-1)*13+i] 
 }
 #Realizo el analisis MannKendall
 m <- MannKendall(v)
 #Extraigo tau y pvalor
 tau[k] <-m$tau[1] 
 pvalue[k] <- m$sl[1]
}

#Uso script pintar#

#Pintar mapas
tendencias=data.frame(tau,pvalue,lat,lng)
## definimos las coordenadas de los puntos
coordinates(tendencias) =~lng+lat
## definimos el sistema de coordenadas WGS84
proj4string(tendencias)=CRS("+init=epsg:4326")

## partimos los valores de tau en 5 clases
clases <- classIntervals(tendencias$tau, n = 5)
## obtenemos cinco colores para una paleta de colores que se llama "Spectral"
plotclr <- rev(brewer.pal(5, "Spectral"))
## Asociamos los valores de tau a su valor correspondiente
colcode <- findColours(clases, plotclr)

## plot sin tener en cuenta
plot(tendencias, col=colcode, pch=19, cex = .6, main = "Mapa de tendencias del ndvi")
## mostramos la leyenda
legend("topright", legend=names(attr(colcode, "table")), fill=attr(colcode, "palette"), bty="n")

###### pintar el mapa

tendencias$significativa <- ifelse(tendencias$pvalue < 0.05, 1, 2)
## plot sin tener en cuenta
plot(tendencias, col=colcode, pch=c(17, 19)[as.numeric(tendencias$significativa)], cex = .6, main = "Mapa de tendencias significativas del ndvi")
## mostramos la leyenda
legend("topright", legend=names(attr(colcode, "table")), fill=attr(colcode, "palette"), bty="n")






#########NIEVE#######
#Leo la tabla nieve_robledal
nieve <- read.table("nieve_robledal.csv",header =TRUE, sep=';')

#Creo un bucle
for(k in 1:593){
  #Almaceno la latitud y longitud de cada pixel
  lat[k] <-nieve$lat[(k-1)*12+1]
  lng[k] <-nieve$lng[(k-1)*12+1]
  
  for(i in 1:12){
    #Alamaceno el valor del scd de cada año para cada pixel
    v[i]=nieve$scd[(k-1)*12+i] 
  }
  #Realizo el Analisis MannKendall
  m2<- MannKendall(v)
  #Extraigo los valores de tau y pvalor
  tau[k] <-m2$tau[1] 
  pvalue[k] <- m2$sl[1]
 
}

#Uso el script pintar#

tendencias=data.frame(tau,pvalue,lat,lng)
## definimos las coordenadas de los puntos
coordinates(tendencias) =~lng+lat
## definimos el sistema de coordenadas WGS84
proj4string(tendencias)=CRS("+init=epsg:4326")

## partimos los valores de tau en 5 clases
clases <- classIntervals(tendencias$tau, n = 5)
## obtenemos cinco colores para una paleta de colores que se llama "Spectral"
plotclr <- rev(brewer.pal(5, "Spectral"))
## Asociamos los valores de tau a su valor correspondiente
colcode <- findColours(clases, plotclr)

## plot sin tener en cuenta
plot(tendencias, col=colcode, pch=19, cex = .6, main = "Mapa de tendencias de la nieve")
## mostramos la leyenda
legend("topright", legend=names(attr(colcode, "table")), fill=attr(colcode, "palette"), bty="n")

###### pintar el mapa

tendencias$significativa <- ifelse(tendencias$pvalue < 0.05, 1, 2)
## plot sin tener en cuenta
plot(tendencias, col=colcode, pch=c(17, 19)[as.numeric(tendencias$significativa)], cex = .6, main = "Mapa de tendencias significativas de la nieve")
## mostramos la leyenda
legend("topright", legend=names(attr(colcode, "table")), fill=attr(colcode, "palette"), bty="n")




