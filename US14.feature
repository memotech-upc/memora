Feature: US14 - Reacciones con Emojis gigantes
  Como Héctor
  Quiero responder con iconos de reacciones grandes
  Para expresar mis emociones fácilmente

Scenario: Reacción exitosa a un mensaje recibido
  Given que el usuario visualiza un mensaje recibido
  When selecciona una de las reacciones rápidas
  Then el emoji aparece debajo del mensaje original
Examples:
  | INPUT |
  | Mensaje recibido: Foto de los nietos |
  | Reacción seleccionada: "❤️" |
  | OUTPUT |
  | Emoji visible debajo del mensaje: Sí |

Scenario: Cambio de una reacción ya enviada
  Given que el usuario ya reaccionó a un mensaje con un emoji
  When selecciona una reacción diferente sobre el mismo mensaje
  Then el sistema reemplaza la reacción anterior por la nueva
Examples:
  | INPUT |
  | Reacción previa: "😊" |
  | Nueva reacción seleccionada: "❤️" |
  | OUTPUT |
  | Reacción final mostrada: "❤️" |
  | Reacciones simultáneas en el mensaje: 1 |

Scenario: Eliminación de una reacción al volver a seleccionarla
  Given que el usuario reaccionó previamente a un mensaje con un emoji específico
  When vuelve a tocar la misma reacción
  Then el sistema elimina la reacción del mensaje
Examples:
  | INPUT |
  | Reacción previa: "👍" |
  | Acción: Tap sobre la misma reacción |
  | OUTPUT |
  | Reacción visible: No |
