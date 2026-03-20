// Seleccionamos los elementos del DOM una sola vez (eficiencia)
const input = document.getElementById('tareaInput');
const boton = document.getElementById('btnAgregar');
const lista = document.getElementById('listaTareas');

// Función para añadir una tarea
function agregarTarea() {
    const texto = input.value.trim();

    if (texto === "") {
        alert("¡Escribe algo primero!");
        return;
    }

    // Crear el elemento de la lista (li)
    const nuevaTarea = document.createElement('li');
    
    // Usamos Template Literals para insertar HTML interno
    nuevaTarea.innerHTML = `
        <span>${texto}</span>
        <button class="btn-eliminar">Eliminar</button>
    `;

    // Evento para marcar como completada al hacer clic en el texto
    nuevaTarea.querySelector('span').addEventListener('click', function() {
        this.classList.toggle('completada');
    });

    // Evento para eliminar la tarea
    nuevaTarea.querySelector('.btn-eliminar').addEventListener('click', () => {
        nuevaTarea.remove();
    });

    // Añadir a la lista y limpiar el input
    lista.appendChild(nuevaTarea);
    input.value = "";
    input.focus();
}

// Escuchar el clic del botón
boton.addEventListener('click', agregarTarea);

// Escuchar la tecla "Enter" para mayor comodidad
input.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') agregarTarea();
});