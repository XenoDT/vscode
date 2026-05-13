const titulo_ppal = document.getElementById('titulo-ppal');
const inicio = document.getElementById('enlace-inicio');

console.log(titulo_ppal);

titulo_ppal.innerHTML = "<i>Esternocleidomastoideo<i>"



inicio.setAttribute('href','www.google.com')
inicio.setAttribute('target','_blank')
const intro = document.getElementById('parrafo-intro');
const lista = document.getElementById('mi-lista');

const fruta = document.createElement('li');
fruta.innerHTML = 'nuez';
fruta.classList.add('item')
lista.appendChild(fruta)
const btn = document.getElementById('btn-enviar');
const fom = document.getElementById('formulario');
const cm = document.getElementById('campo-mensaje')
fom.addEventListener('mouseenter', (e) => fom.classList.toggle('activo'))
fom.addEventListener('mouseleave', (e) => fom.classList.toggle('activo'))
const name = document.getElementById('campo-nombre');
const naml = document.getElementById('label-nombre')
name.addEventListener('input',() => {if (name.value == ""){
    naml.textContent = "Nombre:"
}else{
    naml.textContent = name.value
}});

