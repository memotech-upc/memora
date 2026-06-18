Feature: US17 - Organización de contenido
  Como hija
  Quiero asignar una fecha y descripción a las fotos que subo
  Para que mi padre tenga el contexto completo de lo que está viendo

Scenario: Publicación exitosa de una foto con contexto
  Given que la hija está subiendo un archivo a la Biblioteca
  When completa los campos de fecha y texto
  Then la foto se publica con esa información visible
Examples:
  | INPUT |
  | Fecha asignada: "20/04/2026" |
  | Descripción: "Cumpleaños de Carlos" |
  | OUTPUT |
  | Foto publicada: Sí |
  | Información visible: "20/04/2026 - Cumpleaños de Carlos" |

Scenario: Intento de publicación sin descripción
  Given que la hija sube una foto a la Biblioteca
  When deja vacío el campo de descripción y confirma la publicación
  Then el sistema publica la foto solo con la fecha asignada
Examples:
  | INPUT |
  | Fecha asignada: "20/04/2026" |
  | Descripción: (vacío) |
  | OUTPUT |
  | Foto publicada: Sí |
  | Información visible: "20/04/2026" |

Scenario: Edición de la descripción de una foto ya publicada
  Given que una foto ya fue publicada con una descripción previa
  When la hija edita el texto de la descripción
  Then el sistema actualiza la información visible sin alterar la fecha original
Examples:
  | INPUT |
  | Descripción previa: "Cumpleaños de Carlos" |
  | Nueva descripción: "Cumpleaños de Carlos en familia" |
  | OUTPUT |
  | Descripción actualizada: Sí |
  | Fecha conservada: "20/04/2026" |
