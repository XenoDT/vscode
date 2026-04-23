/*
Arrow function que trabaje con arrays:
recorrec y modificar de alguna forma
que devuela el arrat con las modificaciones u otra cosa
*/
const input = document.getElementById('numInput');
const boton = document.getElementById('btnAgregar');
const lista = document.getElementById('listarNums');

function agregarNumero() {
    const texto = input.value.trim();
    if(texto == ""){
        alert("INTRODUZCA UNA PALABRA");
        return;
    }

    const nuevoNumero = document.createElement('li');

    agregarNumero.innerHTML = `
        <span>${texto}</span>
        <buton class="btn-eliminar">Eliminar</button>
    `;
    // agregarNumero.querySelector('span').addEventListener('click', function() {
    //     this.classList.toggle('completada');
    // });
    // agregarNumero.querySelector('.btn-eliminar').addEventListener('click', () => {
    //     nuevaTarea.remove();
    //});
    lista.appendChild(agregarNumero);
    input.value = "";
    input.focus();
}

boton.addEventListener('click', agregarNumero);

input.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') agregarNumero();
}) 

let nums = [];
const name = prompt("Introduce una palabra")
alert(name)
const nombreee = (name) => {
    let a = name.length
    nums.push(a)
    return;
}

nombreee(name)



alert(nums)
