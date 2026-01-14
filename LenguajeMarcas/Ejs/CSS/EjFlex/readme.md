# Ejercicio CSS Responsive
Tienes que crear un archivo `style.css` que haga el sitio *responsive* usando Flexbox y Media Queries.

Al documento `index.html` que se entrega, pon las clases e ids a las etiquetas que consideres necesarias.

## Parte 1: Layout básico con Flexbox

1. **Navegación**: Los elementos de la lista en `<nav>` deben estar en horizontal usando Flexbox.
2. **Contenido principal**: `<main>` debe usar Flexbox para colocar:
    - La `<section>` con los `<article>` alineados la izquierda. Cada `<article>` tiene un tamaño original de 220px.
    - El `<aside>` a la derecha
3. **Servicios**: Los 3 servicios deben estar en horizontal usando Flexbox.
4. **Footer**: Los enlaces de redes sociales deben estar en horizontal usando Flexbox
5. Haz que el `<nav>` se quede pegado en lo alto de la pantalla cuando se hace scroll hacia abajo. 

## Parte 2: Media Queries para Responsive

Crear dos reglas con `@media`:

1. **Para tablets (max-width: 768px)**:
    - Los artículos dentro de la sección principal deben cambiar a un ancho original de 150px, y deben estar centrados dentro del contenedor.
    - Los servicios deben cambiar para estar centrados y con un ancho original de 300px
    - Puedes decrementar el `gap`, `margin` y/o `padding` si lo consideras.
2. **Para móviles (max-width: 480px)**:
    - La navegación debe cambiar a vertical, los botones deben ocupar el 80% del ancho
    - El layout de `<main>` debe cambiar: `<aside>` debe ir **debajo** de la sección principal
    - Los artículos deben cambiar a **1 columna**, y ocupar todo el ancho de su contenedor
    - Los servicios deben cambiar a **1 columna**, ocupando todo el ancho
    - El footer debe tener los enlaces en **vertical** y ocupando el 80% del ancho

## Parte 3: Estilos visuales (opcional)

Añadir estilos básicos para mejorar la apariencia:
- Colores de fondo diferenciados para cada sección
- Espaciado (padding y margin) adecuado
- Bordes o sombras para separar visualmente las secciones


## Cómo quedará:
Tienes que utilizar la propiedad `display: flex` para hacer el ejercicio. Jueva con las reglas `@media` para cambiar los valores de `flex-direction` y de `flex-grow`.

### En desktop (>768px):
```
┌─────────────────────────────────────┐
│            HEADER + NAV             │
├───────────────┬─────────────────────┤
│               │                     │
│   ARTÍCULOS   │      ASIDE          │
│   (3 cols)    │                     │
│               │                     │
├───────────────┴─────────────────────┤
│        SERVICIOS (3 cols)           │
├─────────────────────────────────────┤
│              FOOTER                 │
└─────────────────────────────────────┘
```

### En tablet (480-768px):
```
┌─────────────────────────────────────┐
│            HEADER + NAV             │
├───────────────┬─────────────────────┤
│               │                     │
│   ARTÍCULOS   │      ASIDE          │
│   (2 cols)    │                     │
│               │                     │
├───────────────┴─────────────────────┤
│        SERVICIOS (2 cols)           │
├─────────────────────────────────────┤
│              FOOTER                 │
└─────────────────────────────────────┘
```

### En móvil (480px):
```
┌─────────────────────────────────────┐
│              HEADER                 │
├─────────────────────────────────────┤
│          NAV (vertical)             │
├─────────────────────────────────────┤
│          ARTÍCULOS (1 col)          │
├─────────────────────────────────────┤
│              ASIDE                  │
├─────────────────────────────────────┤
│         SERVICIOS (1 col)           │
├─────────────────────────────────────┤
│         FOOTER (vertical)           │
└─────────────────────────────────────┘
```