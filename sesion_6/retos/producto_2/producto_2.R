#Cargo las librerias sp, rgdal, classInt y RColorBrewer
library(sp)
library(rgdal)
library(classInt)
library(RColorBrewer)

n <- 3:5 #Numero de clases que voy a usar en los diferentes clusters

#Leo la tabla robles_ecoinfo
info <- read.table("robles_ecoinfo.csv",header = TRUE,sep=',')

info2 <- info[,-1]#Quito la primera columna
info2 <-info2[,-1]#Quito la segunda columna

#Creo un bucle
for(n_cluster in n){
  
#Realizo el cluster
mi_cluster <- kmeans (info2, n_cluster, iter.max = 200, nstart = 3)
#Extraigo el campo cluster del cluster
cluster <- mi_cluster$cluster
#Cojo las coordenadas x e y de "robles_ecoinfo"
x <- info$x
y <- info$y
#Hago una tabla con los valores del cluster, x e y
robles<-data.frame(cluster,x,y)

### Uso el script pintar_mapa ###

#Cargamos libreria raster y obtenemos los ficheros de imágenes para una hora determinada
### Para el siguiente fragmento de script, suponemos que:
### - Tienes una variable que se llama robles
### - La variable robles es un data.frame
### - que el data.frame tiene una columna que se llama pvalue
### - que tiene dos columnas, x e y
### - que tiene una columna que se llama "cluster" que indica a qué cluster pertenece.


## OJO: esta variable debería de estar en vuestro script
## variable con el número de cluster con el que estamos probando
## definimos las coordenadas de los puntos
coordinates(robles) =~x+y
## definimos el sistema de coordenadas WGS84
proj4string(robles)=CRS("+init=epsg:23030")

## obtenemos n_cluster colores para una paleta de colores que se llama "Spectral", para cada cluster creado
plotclr <- rev(brewer.pal(n_cluster, "Spectral"))

## plot, asignando el color en función del cluster al que pertenece
plot(robles, col=plotclr[robles$cluster], pch=19, cex = .6, main = paste("Poblaciones de robledal con Clusters=",n_cluster))
}


