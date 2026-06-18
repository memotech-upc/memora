Feature: US02 - Visualización de metas diarias
  Como adulto mayor
  Quiero ver una barra de color que se llena conforme interactúo con la app
  Para sentir que estoy logrando mis objetivos diarios

Scenario: Avance de la barra de progreso al completar una acción
  Given que el usuario tiene tareas de interacción pendientes en el día
  When completa una acción (ver videos/fotos o usar el calendario)
  Then la barra de progreso en el Dashboard aumenta su porcentaje visualmente
Examples:
  | INPUT |
  | Acción completada: "Ver recuerdo del día" |
  | Progreso previo: 25% |
  | OUTPUT |
  | Progreso actualizado: 50% |
  | Animación de avance: Sí |

Scenario: Barra de progreso al completar el 100% de las tareas
  Given que el usuario ha completado todas las tareas asignadas para el día
  When realiza la última acción pendiente
  Then la barra de progreso llega al 100%
  And el sistema dispara el mensaje de refuerzo positivo (HU08)
Examples:
  | INPUT |
  | Progreso previo: 80% |
  | Acción completada: "Grabar video diario" |
  | OUTPUT |
  | Progreso final: 100% |
  | Mensaje de refuerzo mostrado: Sí |

Scenario: Visualización de la barra sin tareas completadas
  Given que el usuario inicia sesión por primera vez en el día
  When accede al Dashboard
  Then la barra de progreso se muestra vacía (0%)
Examples:
  | INPUT |
  | Tareas completadas: 0 |
  | OUTPUT |
  | Progreso mostrado: 0% |
