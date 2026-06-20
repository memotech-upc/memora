Feature: US15 - Visualización cronológica
  Como Héctor
  Quiero ver mis fotos ordenadas por fecha en una línea de tiempo
  Para entender la secuencia de los eventos de mi vida

Scenario: El adulto mayor visualiza sus recuerdos ordenados cronológicamente
  Given que Héctor se encuentra en la sección Biblioteca
  When desliza hacia abajo
  Then el sistema muestra las fotos ordenadas de la más reciente a la más antigua
  And conserva la fecha visible en cada recuerdo

Examples:
| INPUT |
| Sección: Biblioteca |
| Fotos disponibles: 12 |

| OUTPUT |
| Orden mostrado: De la más reciente a la más antigua |
| Fecha visible: En cada foto de la línea de tiempo |


Scenario: El adulto mayor ingresa a la Biblioteca sin recuerdos guardados
  Given que aún no se ha subido ningún recuerdo a la Biblioteca
  When Héctor ingresa a la sección Biblioteca
  Then el sistema no debe mostrar ninguna línea de tiempo
  And debe mostrar el mensaje "Aún no hay recuerdos guardados"

Examples:
| INPUT |
| Sección: Biblioteca |
| Fotos disponibles: 0 |

| OUTPUT |
| Mensaje: "Aún no hay recuerdos guardados" |


Scenario: El sistema falla al cargar la línea de tiempo de recuerdos
  Given que Héctor ingresa a la sección Biblioteca
  When ocurre un error al cargar los recuerdos almacenados
  Then la línea de tiempo no debe mostrarse
  And el sistema debe mostrar el mensaje "No se pudieron cargar tus recuerdos" con un botón de reintentar

Examples:
| INPUT |
| Sección: Biblioteca |
| Condición: Error al recuperar datos del servidor |

| OUTPUT |
| Mensaje de error: "No se pudieron cargar tus recuerdos" |
| Acción disponible: Botón "Reintentar" |
