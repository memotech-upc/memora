Feature: US13 - Confirmación visual de lectura
  Como Héctor
  Quiero ver un indicador gráfico cuando mi hija lea mis mensajes
  Para tener la certeza de que he sido escuchado

Scenario: El indicador de lectura cambia al ser leído el mensaje
  Given que Héctor envió un mensaje en el chat de Familia
  When la hija abre el chat en su dispositivo
  Then el icono del mensaje debe cambiar de color
  And mostrarse como check de lectura confirmado

Examples:
| INPUT |
| Mensaje enviado: "Ya tomé mis medicinas" |
| Acción de la hija: Abre el chat |

| OUTPUT |
| Icono del mensaje: Check de lectura (color cambiado) |


Scenario: El mensaje permanece sin leer por la hija
  Given que Héctor envió un mensaje en el chat de Familia
  When la hija aún no ha abierto el chat
  Then el icono del mensaje debe mantenerse en su color original
  And no debe mostrarse como leído

Examples:
| INPUT |
| Mensaje enviado: "¿Cuándo vienes a visitarme?" |
| Estado del chat de la hija: No abierto |

| OUTPUT |
| Icono del mensaje: Sin cambios (no leído) |


Scenario: El sistema falla al actualizar el estado de lectura
  Given que la hija abrió el chat y leyó el mensaje de Héctor
  When ocurre un error de sincronización en el servidor
  Then el icono del mensaje no debe actualizarse a leído
  And el sistema debe reintentar la sincronización del estado

Examples:
| INPUT |
| Mensaje leído por la hija: Sí |
| Condición: Falla de sincronización |

| OUTPUT |
| Icono del mensaje: Sin actualizar |
| Estado: Reintento de sincronización programado |
