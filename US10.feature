Feature: US10 - Envío de mensajes de voz
  Como Héctor
  Quiero enviar audios manteniendo presionado un solo botón
  Para comunicarme sin la dificultad de escribir en un teclado

Scenario: Grabación y envío exitoso de un audio
  Given que el usuario está en el chat de Familia
  When mantiene presionado el icono del micrófono y luego lo suelta
  Then el sistema graba y envía el audio al soltarlo
Examples:
  | INPUT |
  | Acción: Mantener presionado el micrófono por 4 segundos |
  | OUTPUT |
  | Audio grabado: Sí |
  | Audio enviado: Sí |
  | Duración del audio: 4 segundos |

Scenario: Cancelación de la grabación al deslizar fuera del botón
  Given que el usuario está grabando un audio manteniendo presionado el micrófono
  When desliza el dedo fuera del área del botón antes de soltarlo
  Then el sistema cancela la grabación
  And no envía ningún audio
Examples:
  | INPUT |
  | Acción: Deslizar fuera del botón durante grabación |
  | OUTPUT |
  | Audio enviado: No |
  | Grabación cancelada: Sí |

Scenario: Audio demasiado corto
  Given que el usuario presiona y suelta el micrófono casi de inmediato
  When la duración de la grabación es menor a 1 segundo
  Then el sistema descarta la grabación
  And muestra un mensaje indicando que el audio fue muy corto
Examples:
  | INPUT |
  | Duración de la grabación: 0.5 segundos |
  | OUTPUT |
  | Audio enviado: No |
  | Mensaje mostrado: "Mantén presionado para grabar" |
