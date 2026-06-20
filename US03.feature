Feature: US03 - Notificación de actividad para el cuidador
  Como hija (familiar)
  Quiero recibir una notificación automática cuando mi padre use la app
  Para validar su actividad diaria y estar tranquila

Scenario: El cuidador recibe una alerta cuando el adulto mayor realiza una actividad
  Given que Héctor ha realizado una acción en su Dashboard o Biblioteca
  When el sistema detecta la actividad en tiempo real
  Then debe enviar una alerta push al celular de la hija
  And mostrar el mensaje "Héctor ha iniciado sus actividades"

Examples:
| INPUT |
| Usuario: Héctor |
| Acción detectada: Registro de estado de ánimo en el Dashboard |

| OUTPUT |
| Notificación push: "Héctor ha iniciado sus actividades" |
| Destinatario: Hija (familiar) |


Scenario: El cuidador tiene las notificaciones de actividad desactivadas
  Given que la hija desactivó las notificaciones de actividad en su configuración
  When Héctor realiza una acción en el Dashboard
  Then el sistema no debe enviar la alerta push
  And debe registrar la actividad solo en el historial del Dashboard

Examples:
| INPUT |
| Configuración de notificaciones: Desactivadas |
| Acción detectada: Visualización de un recuerdo en la Biblioteca |

| OUTPUT |
| Notificación push: No enviada |
| Registro: Guardado en el historial del Dashboard |


Scenario: El sistema falla al enviar la notificación de actividad
  Given que Héctor ha realizado una acción válida en la app
  When ocurre un error en el servicio de notificaciones push
  Then la alerta no debe llegar al dispositivo de la hija
  And el sistema debe reintentar el envío automáticamente

Examples:
| INPUT |
| Acción detectada: Registro de estado de ánimo |
| Condición: Falla del servicio de notificaciones |

| OUTPUT |
| Notificación push: No entregada |
| Estado: Reintento programado |


Scenario: El adulto mayor realiza varias actividades en un corto periodo de tiempo
  Given que Héctor realiza más de una acción en menos de 5 minutos
  When el sistema detecta las actividades consecutivas
  Then debe agrupar las alertas en una sola notificación
  And mostrar el mensaje "Héctor ha estado activo recientemente"

Examples:
| INPUT |
| Acciones detectadas: Registro de ánimo, visualización de foto, uso del calendario |
| Intervalo: 3 minutos |

| OUTPUT |
| Notificación push: "Héctor ha estado activo recientemente" |
| Cantidad de notificaciones enviadas: 1 |
