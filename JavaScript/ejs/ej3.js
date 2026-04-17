/*Ejercicio 3

Usando un bucle for, crea una variable de tipo string
 que contenga los números del 15 al 1 (incluidos) múltiplos de 3. Después muestra la variable por consola.*/

let a = [];
for(let i = 1; i <= 15; i++){
    a.unshift(`${i}`)
}
alert(a)