/*
Arrow function que trabaje con arrays:
recorrec y modificar de alguna forma
que devuela el arrat con las modificaciones u otra cosa
*/
const input = document.getElementById('numInput');
const boton = document.getElementById('btnAgregar');
const lista = document.getElementById('listarNums');
let palabras = [];
function agregarNumero() {
    const texto = input.value.trim();
    if(texto == ""){
        alert("INTRODUZCA UNA PALABRA");
        return;
    }
    palabras.push(texto)
    const lengtha = nombreee(palabras);
    const lastLengtha = lengtha[lengtha.length - 1];
    const nuevoNumero = document.createElement('li');
    if (lastLengtha == 67){
        nuevoNumero.innerHTML = `
        <span>RETRASADO</span>
        <button class="btn-eliminar">Eliminar</button>
    `;
    }else if( lastLengtha == 69){
        nuevoNumero.innerHTML = `
        <span>Salido</span>
        <button class="btn-eliminar">Eliminar</button>`
    } else{
    nuevoNumero.innerHTML = `
        <span>${lastLengtha}</span>
        <button class="btn-eliminar">Eliminar</button>
    `;
    }
    nuevoNumero.querySelector('span').addEventListener('click', function() {
        this.classList.toggle('completada');
    });
    nuevoNumero.querySelector('.btn-eliminar').addEventListener('click', () => {
        nuevoNumero.remove();
    });
    lista.appendChild(nuevoNumero);
    input.value = "";
    input.focus();
}

boton.addEventListener('click', agregarNumero);

input.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') agregarNumero();
}) 

let nums = [];
const nombreee = arr => arr.map( p => p.length);
