Feature: US08 - Mensajes de refuerzo positivo dinámicos
  Como Héctor
  Quiero leer frases de aliento cuando veo mi progreso o termino de grabar el video diario
  Para reforzar mi confianza en el uso de la plataforma

Scenario: Mensaje de refuerzo al completar el progreso diario
  Given que el usuario completa el progreso diario
  When visualiza la barra de progreso completa
  Then aparece una ventana emergente con un mensaje de aliento personalizado
Examples:
  | INPUT |
  | Progreso: 100% |
  | OUTPUT |
  | Mensaje mostrado: "¡Excelente trabajo, Héctor! Tu familia está orgullosa" |
  | Ventana emergente: Sí |

Scenario: Mensaje de refuerzo tras grabar un video
  Given que el usuario finaliza la grabación de su video diario
  When el video se guarda exitosamente
  Then el sistema muestra un mensaje breve de felicitación
Examples:
  | INPUT |
  | Acción: Guardar video diario |
  | OUTPUT |
  | Mensaje mostrado: "Bien hecho, Héctor" |

Scenario: Variación de mensajes para evitar repetición
  Given que el usuario ha recibido el mismo mensaje de refuerzo en sesiones anteriores
  When completa una nueva acción que dispara un mensaje de refuerzo
  Then el sistema selecciona una frase distinta de un banco de mensajes predefinidos
Examples:
  | INPUT |
  | Último mensaje mostrado: "Bien hecho, Héctor" |
  | OUTPUT |
  | Nuevo mensaje mostrado: "¡Sigue así, lo estás haciendo genial!" |
  | Mensaje repetido: No |
