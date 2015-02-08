#Algoritmo que dado un umbral por el usuario, 
#dados 10 números por el usuario,
#cuente cuántos de esos números supera el umbral indicado


contador <- 0 #Creo la variable "contador"
print("Introduce un umbral") #Escribe "introduce un umbral" para que el usuario introduzca el valor umbral que desee
umbral <- scan(nmax=1) #Almaceno el umbral introducido 
for(k in 1:10){ #Creo un bucle para que el usuario introduzca 10 numeros y cuente cuantos de estos numeros superan el umbral previamente introducido
  print("Introduce un numero")#Escribe "introduce un número" para que el usuario introduzca el numero que quiera
  x <- scan(nmax=1)#Almaceno el numero introducido
  if(x > umbral){ #Si el numero introducido es mayor que el valor umbral
    contador <- contador+1 #Aumenta en una unidad el contador (Cuenta el numero dado)
  }
}
print(paste("Cantidad de numeros que superan el umbral:",contador)) #Mostrar la cantidad de numeros que supero el umbral
