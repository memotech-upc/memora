Feature: US07 - Alerta de inactividad prolongada para el cuidador
  Como hija (familiar-cuidador)
  Quiero que la app me avise si mi adulto mayor no ha abierto el Dashboard en muchas horas
  Para llamarlo y verificar si está bien

Scenario: El cuidador recibe una alerta de prioridad alta por inactividad prolongada
  Given que el sistema monitorea el tiempo desde el último acceso de Héctor
  When pasan más de 8 horas sin actividad detectada
  Then el sistema envía una notificación de prioridad alta al dispositivo de la hija
  And el mensaje indica el tiempo de inactividad detectado

Examples:
| INPUT |
| Último acceso de Héctor: 07:00 a.m. |
| Hora actual: 04:00 p.m. (9 horas sin actividad) |

| OUTPUT |
| Notificación: Prioridad alta |
| Mensaje: "Héctor no ha tenido actividad en las últimas 9 horas" |


Scenario: El adulto mayor registra actividad antes de cumplirse las 8 horas
  Given que han transcurrido menos de 8 horas desde el último acceso de Héctor
  When Héctor abre el Dashboard y realiza una acción
  Then el sistema no debe enviar la alerta de inactividad
  And debe reiniciar el contador de tiempo de inactividad

Examples:
| INPUT |
| Tiempo transcurrido desde el último acceso: 6 horas |
| Acción detectada: Registro de estado de ánimo |

| OUTPUT |
| Notificación de inactividad: No enviada |
| Contador de inactividad: Reiniciado a 0 |


Scenario: El sistema falla al monitorear el tiempo de inactividad
  Given que han transcurrido más de 8 horas sin actividad de Héctor
  When ocurre un error en el servicio que monitorea la actividad
  Then la alerta de inactividad no debe enviarse
  And el sistema debe registrar la incidencia para su revisión

Examples:
| INPUT |
| Tiempo sin actividad: 10 horas |
| Condición: Falla del servicio de monitoreo |

| OUTPUT |
| Notificación enviada: No |
| Incidencia: Registrada para revisión |


Scenario: La inactividad del adulto mayor se prolonga por varios días consecutivos
  Given que Héctor no ha registrado actividad durante más de 24 horas
  When el sistema vuelve a detectar el umbral de inactividad
  Then debe enviar una nueva alerta de prioridad alta a la hija
  And debe indicar que la inactividad supera las 24 horas

Examples:
| INPUT |
| Tiempo sin actividad: 26 horas |

| OUTPUT |
| Notificación: Prioridad alta |
| Mensaje: "Héctor lleva más de 24 horas sin actividad" |
