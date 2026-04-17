/*Ejercicio 4

Pide (prompt) un número n y calcula la suma de todos los números desde 1 hasta n usando un bucle while.*/

const num = prompt("Introduce un numero")

let num2 = 1;
let sum = 0;
while(num2 != num){
    sum += num2;
    num2++;
}
alert(`${sum}`)