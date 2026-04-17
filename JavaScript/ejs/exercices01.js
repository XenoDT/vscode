/*Ejercicio 1

Escribe un programa que pida a le usuarie por una ventana emergente (prompt) un número 
y muestre los siguientes mensajes ([X] es el número introducido):

    "El número [X] es par" si el número es divisible por 2
    "El número [X] es impar" si no lo es



Ejercicio 3

Usando un bucle for, crea una variable de tipo string
 que contenga los números del 15 al 1 (incluidos) múltiplos de 3. Después muestra la variable por consola.
Ejercicio 4

Pide (prompt) un número n y calcula la suma de todos los números desde 1 hasta n usando un bucle while.
Ejercicio 5

Pide (prompt) un número y muestra su tabla de multiplicar del 1 al 10 usando un bucle.
Ejercicio 6

Genera un número aleatorio entre 1 y 100. Le usuarie tiene que adivinarlo. El programa debe:

    Decirle si el número es mayor o menor después de cada intento
    Contar el número de intentos
    Terminar cuando acierte
*/
const number = prompt("Introduce un numero");

if(number % 2 == 0){
    alert("El numero " + number +" es par")

}else{
    alert("El numero " + number + " es impar")
}
