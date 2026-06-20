Feature: US02 - Visualización de metas diarias
  Como adulto mayor
  Quiero ver una barra de color que se llena conforme interactúo con la app
  Para sentir que estoy logrando mis objetivos diarios

Scenario: La barra de progreso aumenta al completar una acción del día
  Given que Héctor tiene tareas de interacción pendientes en el día
  When completa una acción, como ver videos/fotos o usar el calendario
  Then la barra de progreso en el Dashboard aumenta su porcentaje visualmente
  And refleja el nuevo avance acumulado

Examples:
| INPUT |
| Progreso previo: 25% |
| Acción completada: "Ver video del día" |

| OUTPUT |
| Progreso actualizado: 50% |
| Barra de progreso: Visualmente actualizada en el Dashboard |


Scenario: El adulto mayor completa todas las metas del día
  Given que Héctor ha completado todas las tareas de interacción del día
  When la última acción pendiente es registrada por el sistema
  Then la barra de progreso debe llegar al 100%
  And el sistema debe mostrar un mensaje de felicitación

Examples:
| INPUT |
| Progreso previo: 75% |
| Acción completada: "Última tarea del calendario" |

| OUTPUT |
| Progreso actualizado: 100% |
| Mensaje: "¡Completaste todas tus metas de hoy!" |


Scenario: El adulto mayor inicia un nuevo día sin actividad registrada
  Given que es la primera vez que Héctor ingresa a la app en el día
  When el Dashboard se carga
  Then la barra de progreso debe mostrarse en 0%
  And debe indicar las tareas pendientes del día

Examples:
| INPUT |
| Fecha: Nuevo día |
| Acciones completadas: 0 |

| OUTPUT |
| Progreso mostrado: 0% |
| Tareas pendientes: "Ver recuerdos, usar el calendario" |


Scenario: El sistema falla al actualizar la barra de progreso
  Given que Héctor completa una acción de interacción válida
  When ocurre un error de sincronización con el servidor
  Then la barra de progreso no debe actualizarse
  And el sistema debe mostrar el mensaje "No se pudo actualizar tu progreso"

Examples:
| INPUT |
| Acción completada: "Ver foto del día" |
| Condición: Falla de sincronización |

| OUTPUT |
| Mensaje de error: "No se pudo actualizar tu progreso" |
