Feature: US-LP08 - Responsividad general del Landing Page
  Como visitante del Landing Page desde cualquier dispositivo
  Quiero que el sitio se adapte correctamente al tamaño de mi pantalla
  Para tener una experiencia de navegación cómoda sin desplazamiento horizontal ni elementos rotos

Scenario: Renderizado correcto en pantalla de escritorio
  Given que el visitante accede al Landing Page desde un dispositivo de escritorio (ancho >1024px)
  When la página termina de cargar
  Then el sistema muestra el layout completo en múltiples columnas según cada sección
  And no se presenta scroll horizontal
Examples:
  | INPUT |
  | Ancho de viewport: 1440px |
  | OUTPUT |
  | Scroll horizontal: No |
  | Layout: Multi-columna |

Scenario: Renderizado correcto en tablet
  Given que el visitante accede al Landing Page desde una tablet (ancho entre 769px y 1024px)
  When la página termina de cargar
  Then el sistema ajusta los paddings de las secciones a un valor reducido
  And mantiene el layout sin elementos desbordados
Examples:
  | INPUT |
  | Ancho de viewport: 900px |
  | OUTPUT |
  | Scroll horizontal: No |
  | Padding de sección: 48px |

Scenario: Renderizado correcto en mobile sin overflow horizontal
  Given que el visitante accede al Landing Page desde un dispositivo móvil (ancho ≤768px)
  When la página termina de cargar
  Then el sistema aplica overflow-x: hidden a nivel de html y body
  And todas las grillas de tarjetas colapsan a una sola columna
  And el mockup del teléfono se redimensiona y queda contenido dentro de su contenedor
Examples:
  | INPUT |
  | Ancho de viewport: 375px |
  | OUTPUT |
  | Scroll horizontal: No |
  | Columnas en grillas: 1 |
  | Mockup desbordado: No |

Scenario: Renderizado correcto en mobile de pantalla muy pequeña
  Given que el visitante accede al Landing Page desde un dispositivo móvil de pantalla reducida (ancho ≤400px)
  When la página termina de cargar
  Then el sistema reduce el tamaño de fuente del titular principal
  And reduce el tamaño del mockup del teléfono a 200px de ancho
Examples:
  | INPUT |
  | Ancho de viewport: 360px |
  | OUTPUT |
  | Tamaño de fuente H1: 30px |
  | Ancho de mockup: 200px |
  | Scroll horizontal: No |
