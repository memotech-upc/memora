Feature: US-LP01 - Navegación principal del Landing Page
  Como visitante del Landing Page
  Quiero contar con una barra de navegación responsiva con accesos directos
  Para moverme rápidamente entre las secciones del sitio y registrarme

Scenario: Navegación exitosa mediante los links del navbar en desktop
  Given que el visitante se encuentra en el Landing Page de Memora en una pantalla de escritorio
  When hace clic en uno de los links del navbar ("Cómo funciona", "Para familias", "Testimonios" o "Preguntas")
  Then el sistema realiza un scroll suave hasta la sección correspondiente
  And el navbar permanece visible en la parte superior (sticky)
Examples:
  | INPUT |
  | Link seleccionado: "Cómo funciona" |
  | Dispositivo: Desktop (>1024px) |
  | OUTPUT |
  | Scroll ejecutado: Sí |
  | Sección visible: "Cómo funciona" |
  | Navbar visible: Sí |

Scenario: Apertura del menú hamburguesa en mobile
  Given que el visitante accede al Landing Page desde un dispositivo móvil (ancho ≤768px)
  When presiona el botón de menú hamburguesa ubicado en el navbar
  Then el sistema despliega el menú de navegación en formato vertical
  And el ícono del botón cambia su forma para indicar el estado abierto
Examples:
  | INPUT |
  | Dispositivo: Mobile (375px) |
  | Acción: Tap en botón hamburguesa |
  | OUTPUT |
  | Menú desplegado: Sí |
  | Ícono cambiado a "X": Sí |

Scenario: Cierre automático del menú mobile al seleccionar un link
  Given que el menú hamburguesa está abierto en un dispositivo móvil
  When el usuario selecciona uno de los links del menú
  Then el sistema navega a la sección correspondiente
  And el menú se cierra automáticamente
Examples:
  | INPUT |
  | Estado previo del menú: Abierto |
  | Link seleccionado: "Preguntas" |
  | OUTPUT |
  | Sección mostrada: "Preguntas frecuentes" |
  | Menú cerrado: Sí |

Scenario: Click en CTA principal del navbar
  Given que el visitante se encuentra en cualquier punto del Landing Page
  When hace clic en el botón "Empezar gratis →" del navbar
  Then el sistema redirige al visitante a la sección de registro (#cta)
Examples:
  | INPUT |
  | Botón seleccionado: "Empezar gratis →" |
  | OUTPUT |
  | Sección destino: "#cta" |
  | Scroll ejecutado: Sí |
