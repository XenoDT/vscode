//seccion 1
const btn_saludo = document.getElementById('btn-saludo');
const saludo = document.getElementById('saludo');
const btn_mensaje = document.getElementById('btn-mensaje');
const mensaje = document.getElementById('mensaje');
const btn_up = document.getElementById('btn-subir');
const btn_dwn = document.getElementById('btn-bajar');
const cont = document.getElementById('contador');
let contt = 0;
btn_saludo.addEventListener('click', () => saludo.textContent = "¡Hola, JavaScript!")
btn_mensaje.addEventListener('click', () => mensaje.innerHTML = 'Este párrafo contiene <strong>texto con etiquetas</strong>.')
btn_up.addEventListener('click', () => {contt++; cont.innerHTML= `${contt}`});
btn_dwn.addEventListener('click', () => {contt--; cont.innerHTML= contt});
console.log(contt);
//seccion 2
const enlace = document.getElementById('enlace');
const btn_enlace = document.getElementById('btn-enlace');
const imagen = document.getElementById('imagen');
const btn_imagen = document.getElementById('btn-imagen');
const btn_alt = document.getElementById('btn-alt');
btn_enlace.addEventListener('click', () => enlace.setAttribute('href','https://www.wikipedia.org'));
btn_imagen.addEventListener('click', () => imagen.setAttribute('src', 'https://picsum.photos/200/100?random=2'));
btn_alt.addEventListener('click', ()=> console.log(imagen.getAttribute('alt')));
//seccion 3
const btn_add = document.getElementById('btn-add');
const btn_remove = document.getElementById('btn-remove');
const btn_toggle = document.getElementById('btn-toggle');
const btn_grande = document.getElementById('btn-grande');
const color = document.getElementById('btn-color');
const ver = document.getElementById('btn-vet');
const texto = document.getElementById('texto-clases');
let colorC = 0;
btn_add.addEventListener('click', () => texto.classList.add('resaltado'));
btn_remove.addEventListener('click', () => texto.classList.remove('resaltado'));
btn_toggle.addEventListener('click', () => texto.classList.toggle('tachado'));
btn_grande.addEventListener('click', () => texto.classList.toggle('grande'));
color.addEventListener('click', () => {
    if (colorC == 0){
        colorC++;
        texto.classList.remove('azul');
        texto.classList.add('rojo');
        
    } else if (colorC == 1){
        colorC++;
        texto.classList.remove('rojo');
        texto.classList.add('verde');
        
    } else if (colorC == 2){
        texto.classList.remove('verde')
        texto.classList.add('azul')
        colorC = 0;
    }
    console.log(colorC)
})
ver.addEventListener('click', () => console.log(texto.classList))