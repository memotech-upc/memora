Feature: US19 - Destacar videos/fotos favoritos
  Como adulto mayor
  Quiero marcar con un corazón mis videos/fotos favoritos
  Para encontrarlas rápidamente en una sección especial

Scenario: El adulto mayor marca un recuerdo como favorito
  Given que Héctor visualiza un recuerdo en la Biblioteca
  When presiona el icono de corazón
  Then el sistema añade el recuerdo a la categoría de "Mis Favoritos"
  And el icono de corazón cambia a su estado activo

Examples:
| INPUT |
| Recuerdo visualizado: Foto "Nieta en el parque" |
| Acción: Toca el icono de corazón |

| OUTPUT |
| Recuerdo agregado a: "Mis Favoritos" |
| Icono de corazón: Estado activo (relleno) |


Scenario: El adulto mayor quita un recuerdo de la categoría de favoritos
  Given que un recuerdo ya está marcado como favorito
  When Héctor presiona nuevamente el icono de corazón sobre el mismo recuerdo
  Then el sistema debe eliminar el recuerdo de "Mis Favoritos"
  And el icono de corazón debe volver a su estado inactivo

Examples:
| INPUT |
| Recuerdo: Foto "Nieta en el parque" (ya marcada como favorita) |
| Acción: Toca nuevamente el icono de corazón |

| OUTPUT |
| Recuerdo eliminado de: "Mis Favoritos" |
| Icono de corazón: Estado inactivo |


Scenario: El sistema falla al guardar un recuerdo como favorito
  Given que Héctor presiona el icono de corazón sobre un recuerdo
  When ocurre un error de conexión al guardar el cambio
  Then el icono de corazón no debe cambiar de estado
  And el sistema debe mostrar el mensaje "No se pudo agregar a favoritos"

Examples:
| INPUT |
| Recuerdo seleccionado: Video "Almuerzo dominical" |
| Condición: Falla de conexión |

| OUTPUT |
| Mensaje de error: "No se pudo agregar a favoritos" |
