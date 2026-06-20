Feature: US-LP02 - Sección Hero del Landing Page
  Como visitante del Landing Page
  Quiero visualizar de inmediato la propuesta de valor de Memora
  Para entender en pocos segundos qué hace la aplicación y decidir si registrarme

Scenario: Visualización completa de la sección Hero
  Given que el visitante ingresa al Landing Page de Memora
  When la página termina de cargar
  Then el sistema muestra el eyebrow "Reminiscencia activa para adultos mayores"
  And muestra el titular principal "Que Héctor recuerde quién es cada mañana"
  And muestra el mockup del teléfono con la pantalla de validación exitosa
Examples:
  | INPUT |
  | Acción: Carga de la página |
  | OUTPUT |
  | Eyebrow visible: Sí |
  | Titular visible: Sí |
  | Mockup visible: Sí |

Scenario: Click en CTA primario "Crear cuenta gratis"
  Given que el visitante se encuentra en la sección Hero
  When hace clic en el botón "Crear cuenta gratis"
  Then el sistema lo redirige a la sección de registro
Examples:
  | INPUT |
  | Botón seleccionado: "Crear cuenta gratis" |
  | OUTPUT |
  | Sección destino: "#cta" |
  | Acción registrada: Sí |

Scenario: Click en CTA secundario "Ver cómo funciona"
  Given que el visitante se encuentra en la sección Hero
  When hace clic en el enlace "Ver cómo funciona →"
  Then el sistema realiza scroll hasta la sección "Cómo funciona"
Examples:
  | INPUT |
  | Enlace seleccionado: "Ver cómo funciona →" |
  | OUTPUT |
  | Sección destino: "#como-funciona" |
  | Scroll ejecutado: Sí |

Scenario: Adaptación del Hero en dispositivo móvil
  Given que el visitante accede al Landing Page desde un dispositivo móvil
  When la sección Hero se renderiza
  Then el layout cambia de dos columnas a una sola columna centrada
  And el mockup del teléfono se reduce de tamaño y se posiciona debajo del texto
Examples:
  | INPUT |
  | Dispositivo: Mobile (375px) |
  | OUTPUT |
  | Columnas mostradas: 1 |
  | Orden: Texto primero, mockup después |
  | Overflow horizontal: No |
