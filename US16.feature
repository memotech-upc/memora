Feature: US16 - Marcado de sentimientos
  Como adulto mayor
  Quiero marcar cómo me siento al ver un recuerdo específico
  Para que mi familia sepa qué videos/fotos me generan mayor alegría

Scenario: El adulto mayor marca un sentimiento sobre un recuerdo visualizado
  Given que Héctor ha visto un video o una foto en la Biblioteca
  When selecciona un emoticón de sentimiento
  Then el sistema guarda esa reacción asociada al recuerdo
  And la muestra junto a la fotografía o video correspondiente

Examples:
| INPUT |
| Recuerdo visualizado: Foto "Cumpleaños 2019" |
| Emoticón seleccionado: "😍" |

| OUTPUT |
| Reacción guardada: "😍" asociada a "Cumpleaños 2019" |


Scenario: El adulto mayor cambia el sentimiento ya marcado en un recuerdo
  Given que Héctor ya marcó un sentimiento en un recuerdo de la Biblioteca
  When selecciona un emoticón distinto sobre el mismo recuerdo
  Then el sistema debe reemplazar el sentimiento anterior
  And conservar únicamente la última reacción seleccionada

Examples:
| INPUT |
| Sentimiento previo: "😢" |
| Nuevo sentimiento seleccionado: "😊" |

| OUTPUT |
| Reacción guardada: "😊" (reemplaza a "😢") |


Scenario: El sistema falla al guardar el sentimiento marcado
  Given que Héctor selecciona un emoticón de sentimiento sobre un recuerdo
  When ocurre un error de conexión al guardar la reacción
  Then el sentimiento no debe quedar registrado
  And el sistema debe mostrar el mensaje "No se pudo guardar tu reacción"

Examples:
| INPUT |
| Emoticón seleccionado: "😮" |
| Condición: Falla de conexión |

| OUTPUT |
| Mensaje de error: "No se pudo guardar tu reacción" |
