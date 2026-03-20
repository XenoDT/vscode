document.addEventListener('DOMContentLoaded', () => {
    const modalHTML = `
        <div id="custom-alert" class="modal-overlay" style="display: none;">
            <div class="modal-content">
                <h2 id="modal-title">¡Atención!</h2>
                <p id="modal-message"></p>
                <button id="modal-close-btn">¡Entendido!</button>
            </div>
        </div>`;
    document.body.insertAdjacentHTML('beforeend', modalHTML);

    const modal = document.getElementById('custom-alert');
    const modalTitle = document.getElementById('modal-title');
    const modalMsg = document.getElementById('modal-message');
    const modalBtn = document.getElementById('modal-close-btn');
    window.pokeAlert = (titulo, mensaje) => {
        modalTitle.innerText = titulo;
        modalMsg.innerText = mensaje;
        modal.style.display = 'flex';
    };
    modalBtn.addEventListener('click', () => {
        modal.style.display = 'none';
    });
    modal.addEventListener('click', (e) => {
        if (e.target === modal) modal.style.display = 'none';
    });
    const pokemonImages = document.querySelectorAll('table img, .galeria img');
    pokemonImages.forEach(img => {
        img.style.cursor = 'pointer';
        img.addEventListener('click', () => {
            const name = img.alt || "este Pokémon";
            img.animate([
                { transform: 'translateY(0)' },
                { transform: 'translateY(-15px)' },
                { transform: 'translateY(0)' }
            ], { duration: 300 });
            window.pokeAlert("¡Avistamiento!", `Has seleccionado a ${name}. ¡Parece que quiere unirse a tu equipo!`);
        });
    });
    const contactForm = document.querySelector('form');
    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            const name = document.getElementById('name').value;
            const comments = document.getElementById('coments').value;

            if (comments.length < 300) {
                e.preventDefault();
                window.pokeAlert("Error de Registro", `Entrenador ${name}, tu comentario es muy breve. Necesitamos al menos 300 caracteres para procesar tu informe.`);
            } else {
                window.pokeAlert("¡Éxito!", "Tu mensaje ha sido enviado al Laboratorio del Profesor Oak.");
            }
        });
    }
    const asideLinks = document.querySelectorAll('.aside a[href^="#"]');
    asideLinks.forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);

            if (targetElement) {
                e.preventDefault();
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

});