console.log("hola mundo!");
const boton = document.getElementById("bob");
alert("esto es una alerta");
function avisar() {
    alert("¡Me has hecho clic!");
}
boton.addEventListener('click', avisar);
const asuma = number =>{ number+number }
// alert(saludoo("pepe"))

function saludoo(name){
    return(`hola ${name}`)

}
const saludo = name => `hola ${name}`;
const square = num => num*num;

alert(saludo("pepe"))
alert(square(4))

let array = [2]
array.unshift(1)
array.push(3)
alert(array)