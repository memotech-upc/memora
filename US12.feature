Feature: US12 - Alerta de nuevos mensajes
  Como hija/familiar
  Quiero recibir notificaciones push de los mensajes de mi padre
  Para enterarme en el menor tiempo posible

Scenario: La hija recibe una notificación push al recibir un mensaje nuevo
  Given que la app está en segundo plano en el dispositivo de la hija
  When Héctor envía un mensaje en el chat de Familia
  Then el sistema muestra una notificación con el nombre de Héctor
  And la notificación incluye una vista previa del mensaje

Examples:
| INPUT |
| Estado de la app: Segundo plano |
| Mensaje enviado: "Hola hija, ya comí" |

| OUTPUT |
| Notificación push: "Héctor: Hola hija, ya comí" |


Scenario: La hija tiene desactivadas las notificaciones de nuevos mensajes
  Given que la hija desactivó las notificaciones push en su configuración
  When Héctor envía un mensaje en el chat de Familia
  Then el sistema no debe mostrar la notificación push
  And el mensaje debe quedar visible al abrir la app manualmente

Examples:
| INPUT |
| Configuración de notificaciones: Desactivadas |
| Mensaje enviado: "Te quiero mucho" |

| OUTPUT |
| Notificación push: No enviada |
| Mensaje en el chat: Visible al ingresar a la app |


Scenario: El sistema falla al enviar la notificación de un nuevo mensaje
  Given que Héctor envía un mensaje válido en el chat de Familia
  When ocurre un error en el servicio de notificaciones push
  Then la notificación no debe llegar al dispositivo de la hija
  And el sistema debe dejar el envío pendiente para reintento

Examples:
| INPUT |
| Mensaje enviado: "Buenos días" |
| Condición: Falla del servicio de notificaciones |

| OUTPUT |
| Notificación push: No entregada |
| Estado: Reintento programado |


Scenario: Héctor envía varios mensajes seguidos en un corto periodo
  Given que Héctor envía más de un mensaje en menos de un minuto
  When el sistema detecta los mensajes consecutivos
  Then debe agrupar las notificaciones en una sola alerta
  And mostrar la cantidad de mensajes nuevos recibidos

Examples:
| INPUT |
| Mensajes enviados: 3 mensajes en 40 segundos |

| OUTPUT |
| Notificación push: "Héctor te envió 3 mensajes nuevos" |
| Cantidad de notificaciones mostradas: 1 |
