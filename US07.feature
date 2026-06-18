Feature: US07 - Alerta de inactividad prolongada para el cuidador
  Como hija (familiar-cuidador)
  Quiero que la app me avise si mi adulto mayor no ha abierto el Dashboard en muchas horas
  Para llamarlo y verificar si está bien

Scenario: Envío de alerta tras 8 horas de inactividad
  Given que el sistema monitorea el tiempo desde el último acceso
  When pasan más de 8 horas sin actividad detectada
  Then el sistema envía una notificación de prioridad alta al dispositivo de la hija
Examples:
  | INPUT |
  | Horas sin actividad: 8 |
  | OUTPUT |
  | Notificación enviada: Sí |
  | Prioridad: Alta |

Scenario: Cancelación de la alerta al detectarse actividad antes del límite
  Given que han transcurrido 6 horas sin actividad del adulto mayor
  When el usuario abre la app y realiza alguna acción
  Then el sistema cancela el contador de inactividad
  And no se envía ninguna alerta
Examples:
  | INPUT |
  | Horas transcurridas antes de actividad: 6 |
  | OUTPUT |
  | Alerta enviada: No |
  | Contador reiniciado: Sí |

Scenario: Escalamiento de la alerta tras inactividad mayor a 24 horas
  Given que han transcurrido más de 24 horas sin actividad del adulto mayor
  When el sistema detecta este periodo crítico
  Then envía una segunda alerta marcada como urgente
  And sugiere contactar directamente al adulto mayor
Examples:
  | INPUT |
  | Horas sin actividad: 26 |
  | OUTPUT |
  | Alerta urgente enviada: Sí |
  | Sugerencia mostrada: "Te recomendamos llamar a Héctor" |
