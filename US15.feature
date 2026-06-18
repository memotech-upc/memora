Feature: US15 - Visualización cronológica
  Como Héctor
  Quiero ver mis fotos ordenadas por fecha en una línea de tiempo
  Para entender la secuencia de los eventos de mi vida

Scenario: Visualización exitosa de la línea de tiempo
  Given que el usuario se encuentra en la sección Biblioteca
  When desliza hacia abajo
  Then el sistema muestra las fotos de la más reciente a la más antigua
Examples:
  | INPUT |
  | Acción: Scroll hacia abajo en Biblioteca |
  | OUTPUT |
  | Orden de las fotos: Más reciente primero |

Scenario: Biblioteca vacía para un usuario nuevo
  Given que el usuario no ha grabado ningún video ni recibido fotos aún
  When accede a la sección Biblioteca
  Then el sistema muestra un mensaje invitando a grabar el primer recuerdo
Examples:
  | INPUT |
  | Cantidad de recuerdos: 0 |
  | OUTPUT |
  | Mensaje mostrado: "Aún no tienes recuerdos. ¡Grabá tu primer video!" |

Scenario: Carga de más contenido al llegar al final de la lista
  Given que el usuario hace scroll hasta el final de los recuerdos cargados
  When continúa desplazándose hacia abajo
  Then el sistema carga automáticamente recuerdos más antiguos (paginación)
Examples:
  | INPUT |
  | Recuerdos cargados inicialmente: 20 |
  | OUTPUT |
  | Recuerdos adicionales cargados: 20 |
