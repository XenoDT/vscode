/*Ejercicio 2

Pregunta (prompt) edad y clasifícala en:

    "Infante" (0-5 años)
    "Niñe" (6-12 años)
    "Adolescente" (13-17 años)
    "Adulte" (18-64 años)
    "Jubilade" (65+ años) */

let age = "";
do{
    age = prompt("Cual es tu edad")
if(age <= 5){
    age = prompt("eres un infante")
} 
else if(age <= 12 ){
    age = prompt("Eres un crio")
}
else if(age <= 17){
    age = prompt("Eres un adolescente")
}
else if(age <= 64){
    age = prompt("Eres un adulto")
}
else if(age >=65){
    age = prompt("ers un jubilado")
}
}while(age != 69)