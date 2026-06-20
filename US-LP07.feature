Feature: US-LP07 - Footer del Landing Page
  Como visitante del Landing Page
  Quiero acceder a información de contacto y enlaces adicionales desde cualquier punto del sitio
  Para encontrar datos legales, de soporte o de la empresa al finalizar mi recorrido

Scenario: Visualización del footer completo
  Given que el visitante hace scroll hasta el final del Landing Page
  When el footer entra en el viewport
  Then el sistema muestra el logo de Memora con su tagline
  And muestra las columnas de enlaces "Producto", "Empresa" y "Legal"
  And muestra la barra inferior con el copyright y los íconos de redes sociales
Examples:
  | INPUT |
  | Acción: Scroll hasta el final de la página |
  | OUTPUT |
  | Columnas de enlaces visibles: 3 |
  | Copyright visible: Sí |
  | Íconos sociales visibles: Sí |

Scenario: Navegación mediante un enlace del footer
  Given que el visitante se encuentra en el footer
  When hace clic en un enlace de la columna "Producto" (ej. "Cómo funciona")
  Then el sistema realiza scroll hasta la sección correspondiente del Landing Page
Examples:
  | INPUT |
  | Enlace seleccionado: "Cómo funciona" (columna Producto) |
  | OUTPUT |
  | Sección destino: "#como-funciona" |
  | Scroll ejecutado: Sí |

Scenario: Adaptación del footer en mobile
  Given que el visitante accede desde un dispositivo móvil
  When el footer se renderiza
  Then las columnas de enlaces se reorganizan en una sola columna apilada
  And la barra inferior cambia de disposición horizontal a centrada
Examples:
  | INPUT |
  | Dispositivo: Mobile (375px) |
  | OUTPUT |
  | Columnas mostradas: 1 |
  | Alineación barra inferior: Centrada |
