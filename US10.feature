Feature: US10 - Envío de mensajes de voz
  Como Héctor
  Quiero enviar audios manteniendo presionado un solo botón
  Para comunicarme sin la dificultad de escribir en un teclado

Scenario: El adulto mayor envía un mensaje de voz correctamente
  Given que Héctor está en el chat de Familia
  When mantiene presionado el icono del micrófono y habla
  And suelta el icono al terminar de grabar
  Then el sistema graba el audio
  And lo envía automáticamente al chat de Familia

Examples:
| INPUT |
| Sección: Chat de Familia |
| Duración de la grabación: 8 segundos |

| OUTPUT |
| Audio: Enviado al chat de Familia |
| Duración mostrada: 0:08 |


Scenario: El adulto mayor suelta el botón antes de grabar audio suficiente
  Given que Héctor está en el chat de Familia
  When mantiene presionado el icono del micrófono menos de 1 segundo
  And suelta el botón inmediatamente
  Then el sistema no debe enviar ningún audio
  And debe mostrar el mensaje "Mantén presionado para grabar"

Examples:
| INPUT |
| Sección: Chat de Familia |
| Duración de la presión: 0.4 segundos |

| OUTPUT |
| Audio: No enviado |
| Mensaje: "Mantén presionado para grabar" |


Scenario: El adulto mayor cancela la grabación deslizando el dedo fuera del botón
  Given que Héctor está grabando un audio en el chat de Familia
  When desliza el dedo fuera del icono del micrófono antes de soltarlo
  Then el sistema debe cancelar la grabación
  And no debe enviar ningún audio al chat

Examples:
| INPUT |
| Sección: Chat de Familia |
| Acción: Deslizar el dedo fuera del botón de grabación |

| OUTPUT |
| Audio: Grabación cancelada |
| Mensaje: "Audio cancelado" |


Scenario: El sistema falla al enviar el audio grabado
  Given que Héctor graba y suelta el botón de micrófono correctamente
  When ocurre un error de conexión al momento de enviar el audio
  Then el audio no debe llegar al chat de Familia
  And debe quedar marcado como "No enviado" con opción de reintentar

Examples:
| INPUT |
| Sección: Chat de Familia |
| Duración de la grabación: 5 segundos |
| Condición: Sin conexión a internet |

| OUTPUT |
| Estado del audio: "No enviado" |
| Acción disponible: Botón "Reintentar" |
