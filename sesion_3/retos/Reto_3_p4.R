#Reto_3_p4:
#Dado el conjunto de datos ndvi.zip 
#Cada imagen raster se tomó un día, a una hora y minutos concretos
#Queremos hacer un script que muestre la evolución del NDVI medio para las horas del día

#Cargo las librerias raster y rgdal 
library(raster)
library(rgdal)

horas <- c(12,13,14,15) #Creo el vector horas donde se almacenaran las horas
valores <- c() #Creo el vector valores vacio donde se almacenaran los valores de las medias de cada hora
i <- 1 #Creo un contador para acceder correctamente a la posicion dentro del vector valores donde se deben almacenar las distintas medias para las horas

#Creo un bucle que busque los tres ficheros para cada hora, los "junte" y realice la media de los valores para cada hora, obteniendo un único valor de ndvi para cada hora
for(h in horas){
  
  imagenes <- list.files(path="./ndvi", full.names=TRUE, pattern=paste("_", h, "..\\.jpg\\.asc$", sep=""))
  stack_imagen <- stack(imagenes)
  media2 <- mean(stack_imagen)
  media <- cellStats(media2,mean)
  
  valores[i] <- media #Almaceno en el vector valores, en la posición correspondiente la media para cada hora
  i <- i+1
  
  }
plot(horas, valores) #Muestra la gráfica obtenida


