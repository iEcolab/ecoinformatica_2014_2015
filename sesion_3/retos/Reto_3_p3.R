#Algoritmo que haga la media de 10 temperaturas indicadas por el usuario


suma <-0 #Creo la variable suma
for(k in 1:10){ #Creo un bucle para que el usuario introduzca 10 valores de temperatura y realice la media de estos valores
  print("Introduce la temperatura") #Escribe "introduce la temperatura" para que el usuario introduzca el valor de temperatura que quiera
  temp <-scan(nmax=1) #Almaceno la temperatura introducida
  suma <- suma + temp #Se suma el valor introducido con el acumulado
}
resultado <- suma/k #Creo la variable resultado que es el valor de la suma total entre el numero de temperaturas introducidas (media)
print(resultado) #Muestro el resultado obtenido
