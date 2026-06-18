Feature: US13 - Confirmación visual de lectura
  Como Héctor
  Quiero ver un indicador gráfico cuando mi hija lea mis mensajes
  Para tener la certeza de que he sido escuchado

Scenario: Cambio del indicador al leerse el mensaje
  Given que el usuario envió un mensaje
  When su hija abre el chat en su dispositivo
  Then el icono del mensaje cambia de color (check de lectura)
Examples:
  | INPUT |
  | Mensaje enviado por: Héctor |
  | Acción de la hija: Abrir chat |
  | OUTPUT |
  | Check de lectura mostrado: Sí |
  | Color del check: Azul |

Scenario: Mensaje entregado pero no leído
  Given que el usuario envió un mensaje y la hija recibió la notificación
  When la hija aún no ha abierto la conversación
  Then el icono del mensaje se muestra en estado "entregado" sin marcar como leído
Examples:
  | INPUT |
  | Estado del mensaje: Entregado |
  | Chat abierto por la hija: No |
  | OUTPUT |
  | Check de lectura mostrado: No |
  | Check de entrega mostrado: Sí |

Scenario: Mensaje no entregado por falta de conexión del receptor
  Given que el dispositivo de la hija no tiene conexión a internet
  When el usuario le envía un mensaje
  Then el icono del mensaje permanece en estado "enviado" hasta que el mensaje llegue al servidor del receptor
Examples:
  | INPUT |
  | Conexión de la hija: Sin internet |
  | OUTPUT |
  | Check de entrega mostrado: No |
  | Estado mostrado: "Enviado" |
