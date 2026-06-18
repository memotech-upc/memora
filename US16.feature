Feature: US16 - Marcado de sentimientos
  Como adulto mayor
  Quiero marcar cómo me siento al ver un recuerdo específico
  Para que mi familia sepa qué videos/fotos me generan mayor alegría

Scenario: Registro exitoso de un sentimiento asociado a un recuerdo
  Given que el usuario ha visto un video o una foto en la Biblioteca
  When selecciona un emoticón de sentimiento
  Then el sistema guarda esa reacción asociada al recuerdo
Examples:
  | INPUT |
  | Recuerdo visualizado: Video del 12/05 |
  | Emoticón seleccionado: "Feliz" |
  | OUTPUT |
  | Sentimiento guardado: "Feliz" |
  | Asociado al recuerdo: Sí |

Scenario: Cambio del sentimiento ya registrado en un recuerdo
  Given que un recuerdo ya tiene un sentimiento asociado
  When el usuario selecciona un emoticón distinto sobre el mismo recuerdo
  Then el sistema reemplaza el sentimiento anterior por el nuevo
Examples:
  | INPUT |
  | Sentimiento previo: "Tranquilo" |
  | Nuevo sentimiento: "Encantado" |
  | OUTPUT |
  | Sentimiento final: "Encantado" |

Scenario: Visualización del sentimiento por parte del cuidador
  Given que el adulto mayor marcó un sentimiento sobre un recuerdo
  When el cuidador visualiza ese mismo recuerdo desde su vista de Biblioteca
  Then el sistema muestra el sentimiento marcado junto al recuerdo
Examples:
  | INPUT |
  | Recuerdo: Video del 12/05 |
  | OUTPUT |
  | Sentimiento visible para el cuidador: "Encantado" |
