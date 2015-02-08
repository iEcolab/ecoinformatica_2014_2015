#Algoritmo que multiplique 5 números introducidos por el usuario.

multiplicacion <- 1 #Creo la variable "multiplicación"
for (k in 1:5){  #Creo un bucle para multiplicar 5 números que introducira el usuario
  print ("introduce un numero") #Escribe "introduce un numero" para que el usuario introduzca el número que quiera
  x <- scan (nmax=1) #Almaceno el valor introducido      
  
  multiplicacion <- multiplicacion * x #Se multiplica el valor introducido con lo acumulado hasta el momento
}
print (multiplicacion) #Escribe el resultado de multiplicacion de los cinco numeros introducidos
