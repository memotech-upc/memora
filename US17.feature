Feature: US17 - Organización de contenido
  Como hija
  Quiero asignar una fecha y descripción a las fotos que subo
  Para que mi padre tenga el contexto completo de lo que está viendo

Scenario: La hija publica una foto con fecha y descripción válidas
  Given que la hija está subiendo un archivo a la Biblioteca
  When completa los campos de fecha y texto correctamente
  And presiona el botón "Publicar"
  Then la foto se publica con esa información visible
  And queda disponible en la línea de tiempo de Héctor

Examples:
| INPUT |
| Fecha: "15/03/2024" |
| Descripción: "Almuerzo familiar de domingo" |

| OUTPUT |
| Foto publicada: Con fecha y descripción visibles |
| Ubicación: Biblioteca de Héctor |


Scenario: La hija intenta publicar una foto sin completar los campos requeridos
  Given que la hija está subiendo un archivo a la Biblioteca
  When deja vacíos los campos de fecha o descripción
  And presiona el botón "Publicar"
  Then el sistema no debe publicar la foto
  And debe mostrar el mensaje "Completa la fecha y descripción del recuerdo"

Examples:
| INPUT |
| Fecha: "" |
| Descripción: "" |

| OUTPUT |
| Mensaje de error: "Completa la fecha y descripción del recuerdo" |


Scenario: La hija ingresa una fecha inválida para la foto
  Given que la hija está subiendo un archivo a la Biblioteca
  When ingresa una fecha futura o con formato incorrecto
  And presiona el botón "Publicar"
  Then el sistema no debe permitir la publicación
  And debe mostrar el mensaje "Ingresa una fecha válida"

Examples:
| INPUT |
| Fecha: "31/02/2026" |
| Descripción: "Paseo al parque" |

| OUTPUT |
| Mensaje de error: "Ingresa una fecha válida" |


Scenario: El sistema falla al subir el archivo a la Biblioteca
  Given que la hija completa correctamente la fecha y descripción
  When ocurre un error al subir el archivo al servidor
  Then la foto no debe publicarse
  And el sistema debe mostrar el mensaje "No se pudo subir el recuerdo, inténtalo nuevamente"

Examples:
| INPUT |
| Fecha: "10/04/2024" |
| Descripción: "Visita al doctor" |
| Condición: Error de carga en el servidor |

| OUTPUT |
| Mensaje de error: "No se pudo subir el recuerdo, inténtalo nuevamente" |
