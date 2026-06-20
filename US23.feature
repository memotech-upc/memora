Feature: US23 - Tutoriales de uso simple
  Como Héctor
  Quiero acceder a videos cortos de ayuda dentro de mi perfil
  Para aprender a usar las funciones de la app si se me olvidan

Scenario: El adulto mayor reproduce un tutorial disponible
  Given que Héctor pulsa el botón de "Ayuda"
  When selecciona un tema, por ejemplo "Cómo enviar un audio"
  Then el sistema reproduce un video tutorial simplificado
  And muestra controles grandes y de fácil uso durante la reproducción

Examples:
| INPUT |
| Botón pulsado: "Ayuda" |
| Tema seleccionado: "Cómo enviar un audio" |

| OUTPUT |
| Video tutorial: Reproducido |
| Controles: Botones grandes visibles |


Scenario: El adulto mayor selecciona un tema sin tutorial disponible
  Given que Héctor pulsa el botón de "Ayuda"
  When selecciona un tema que aún no cuenta con video tutorial
  Then el sistema no debe reproducir ningún video
  And debe mostrar el mensaje "Tutorial no disponible"

Examples:
| INPUT |
| Tema seleccionado: "Cómo cambiar el idioma" (sin tutorial) |

| OUTPUT |
| Mensaje: "Tutorial no disponible" |


Scenario: El sistema falla al cargar el video tutorial por falta de conexión
  Given que Héctor selecciona un tema con tutorial disponible
  When no cuenta con conexión a internet
  Then el video tutorial no debe cargarse
  And el sistema debe mostrar el mensaje "No se pudo cargar el tutorial, verifica tu conexión"

Examples:
| INPUT |
| Tema seleccionado: "Cómo ver mis fotos" |
| Condición: Sin conexión a internet |

| OUTPUT |
| Mensaje de error: "No se pudo cargar el tutorial, verifica tu conexión" |
