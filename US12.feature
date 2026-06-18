Feature: US12 - Alerta de nuevos mensajes
  Como hija/familiar
  Quiero recibir notificaciones push de los mensajes de mi padre
  Para responder en el menor tiempo posible

Scenario: Notificación exitosa de un nuevo mensaje
  Given que la app está en segundo plano
  When el padre envía un mensaje
  Then el sistema muestra una notificación con su nombre
Examples:
  | INPUT |
  | Remitente: Héctor |
  | Estado de la app: Segundo plano |
  | OUTPUT |
  | Notificación mostrada: Sí |
  | Contenido: "Héctor te envió un mensaje" |

Scenario: Agrupación de notificaciones por múltiples mensajes
  Given que el padre envía varios mensajes en un corto periodo de tiempo
  When el sistema detecta más de un mensaje sin leer del mismo remitente
  Then agrupa las notificaciones en una sola con el conteo de mensajes nuevos
Examples:
  | INPUT |
  | Mensajes enviados sin leer: 3 |
  | OUTPUT |
  | Notificación agrupada: Sí |
  | Texto mostrado: "Héctor te envió 3 mensajes" |

Scenario: Sin notificación cuando la app está en primer plano en el chat
  Given que la hija tiene la app abierta y se encuentra en la pantalla de chat con su padre
  When el padre envía un nuevo mensaje
  Then el sistema no genera una notificación push
  And el mensaje aparece directamente en la conversación
Examples:
  | INPUT |
  | Pantalla activa: Chat con Héctor |
  | OUTPUT |
  | Notificación push enviada: No |
  | Mensaje visible en chat: Sí |
