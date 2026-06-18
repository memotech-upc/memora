Feature: US06 - Sección de Preguntas Frecuentes (FAQ) del Landing Page
  Como visitante del Landing Page
  Quiero consultar respuestas a las dudas más comunes sobre Memora
  Para resolver mis inquietudes antes de registrarme sin tener que contactar soporte

Scenario: Despliegue de una pregunta al hacer clic
  Given que el visitante se encuentra en la sección "Preguntas frecuentes" y todos los acordeones están cerrados
  When hace clic sobre el encabezado de una pregunta (ej. "¿Los videos son privados?")
  Then el sistema despliega la respuesta correspondiente
  And el ícono "+" de esa pregunta rota a una posición que indica el estado abierto
Examples:
  | INPUT |
  | Pregunta seleccionada: "¿Los videos son privados?" |
  | Estado previo: Cerrado |
  | OUTPUT |
  | Respuesta visible: Sí |
  | Ícono rotado: Sí (45°) |

Scenario: Cierre automático de la pregunta previamente abierta
  Given que una pregunta del FAQ ya se encuentra desplegada
  When el visitante hace clic en una pregunta diferente
  Then el sistema cierra la pregunta previamente abierta
  And despliega únicamente la nueva pregunta seleccionada
Examples:
  | INPUT |
  | Pregunta abierta previa: "¿Qué pasa si un día no graba?" |
  | Nueva pregunta seleccionada: "¿Tiene costo?" |
  | OUTPUT |
  | Preguntas abiertas simultáneamente: 1 |
  | Pregunta visible: "¿Tiene costo?" |

Scenario: Cierre de una pregunta ya abierta al volver a hacer clic
  Given que una pregunta del FAQ está desplegada
  When el visitante hace clic nuevamente sobre el mismo encabezado
  Then el sistema oculta la respuesta
  And el ícono vuelve a su posición original
Examples:
  | INPUT |
  | Pregunta seleccionada: "¿Funciona en Android e iOS?" |
  | Estado previo: Abierto |
  | OUTPUT |
  | Respuesta visible: No |
  | Ícono rotado: No |
