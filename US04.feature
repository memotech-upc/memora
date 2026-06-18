Feature: US04 - Sección Funcionalidades del Landing Page
  Como visitante del Landing Page
  Quiero conocer las características principales de Memora
  Para entender de qué manera la aplicación resuelve el problema de la memoria episódica

Scenario: Visualización de las tarjetas de funcionalidades
  Given que el visitante hace scroll hasta la sección "Una rutina diaria que preserva la identidad"
  When la sección entra en el viewport
  Then el sistema muestra tres tarjetas: "Validación diaria de identidad", "Grabación visual guiada" y "Dashboard sin complicaciones"
  And cada tarjeta presenta un ícono representativo y una descripción breve
Examples:
  | INPUT |
  | Acción: Scroll hasta sección "Funcionalidades" |
  | OUTPUT |
  | Tarjetas mostradas: 3 |
  | Íconos visibles: 3 |

Scenario: Resaltado visual de la tarjeta destacada
  Given que las tres tarjetas de funcionalidades están visibles
  When el sistema renderiza la tarjeta "Grabación visual guiada"
  Then esta tarjeta se muestra con un borde superior de color distintivo respecto a las otras dos
Examples:
  | INPUT |
  | Tarjeta evaluada: "Grabación visual guiada" |
  | OUTPUT |
  | Borde destacado: Sí |
  | Color de borde: Azul institucional (#1B55B0) |

Scenario: Adaptación de las tarjetas en mobile
  Given que el visitante accede desde un dispositivo móvil
  When la sección "Funcionalidades" se renderiza
  Then las tarjetas se reorganizan en una sola columna
Examples:
  | INPUT |
  | Dispositivo: Mobile (375px) |
  | OUTPUT |
  | Columnas mostradas: 1 |
