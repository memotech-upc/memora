Feature: US14 - Reacciones con emojis gigantes
  Como Héctor
  Quiero responder con iconos de reacciones grandes
  Para expresar mis emociones fácilmente

Scenario: El adulto mayor reacciona a un mensaje recibido
  Given que Héctor visualiza un mensaje recibido en el chat de Familia
  When selecciona una de las reacciones rápidas
  Then el emoji debe aparecer debajo del mensaje original
  And debe mostrarse con un tamaño grande y visible

Examples:
| INPUT |
| Mensaje recibido: "Te mando un fuerte abrazo" |
| Reacción seleccionada: "❤️" |

| OUTPUT |
| Reacción mostrada: "❤️" debajo del mensaje |


Scenario: El adulto mayor cambia la reacción ya colocada en un mensaje
  Given que Héctor ya reaccionó a un mensaje con un emoji
  When selecciona una reacción distinta sobre el mismo mensaje
  Then el sistema debe reemplazar la reacción anterior
  And mostrar únicamente el nuevo emoji seleccionado

Examples:
| INPUT |
| Reacción previa: "👍" |
| Nueva reacción seleccionada: "😂" |

| OUTPUT |
| Reacción mostrada: "😂" (reemplaza a "👍") |


Scenario: El sistema falla al guardar la reacción seleccionada
  Given que Héctor selecciona una reacción rápida sobre un mensaje
  When ocurre un error de conexión al guardar la reacción
  Then el emoji no debe mostrarse debajo del mensaje
  And el sistema debe mostrar el mensaje "No se pudo enviar tu reacción"

Examples:
| INPUT |
| Reacción seleccionada: "😮" |
| Condición: Falla de conexión |

| OUTPUT |
| Mensaje de error: "No se pudo enviar tu reacción" |
