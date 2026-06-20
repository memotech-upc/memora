Feature: US18 - Reproducción de recuerdos
  Como adulto mayor
  Quiero presionar un botón de Play en un recuerdo
  Para reproducir el video

Scenario: El adulto mayor reproduce un video con audio asociado
  Given que un video tiene un audio asociado en la Biblioteca
  When Héctor toca el icono de reproducción
  Then el sistema reproduce el video en velocidad estándar
  And reproduce el audio asociado simultáneamente

Examples:
| INPUT |
| Recuerdo seleccionado: Video "Cumpleaños 2019" con audio |
| Acción: Toca el icono "Play" |

| OUTPUT |
| Video: Reproducido en velocidad estándar |
| Audio: Reproducido junto con el video |


Scenario: El adulto mayor intenta reproducir un recuerdo que solo es una fotografía
  Given que el recuerdo seleccionado por Héctor es únicamente una fotografía
  When ingresa a visualizar el recuerdo
  Then el sistema no debe mostrar el icono de reproducción
  And debe mostrar la imagen de forma estática

Examples:
| INPUT |
| Recuerdo seleccionado: Foto "Reunión familiar" (sin video) |

| OUTPUT |
| Icono de reproducción: No visible |
| Vista: Imagen estática |


Scenario: El sistema falla al reproducir el video del recuerdo
  Given que Héctor toca el icono de reproducción de un video
  When ocurre un error durante la carga del archivo de video
  Then el sistema no debe reproducir el contenido
  And debe mostrar el mensaje "No se pudo reproducir el video"

Examples:
| INPUT |
| Recuerdo seleccionado: Video "Paseo en el parque" |
| Condición: Falla de carga del archivo |

| OUTPUT |
| Mensaje de error: "No se pudo reproducir el video" |
