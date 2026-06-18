Feature: US18 - Reproducción de recuerdos
  Como adulto mayor
  Quiero presionar un botón de "Play" en un recuerdo
  Para reproducir el video

Scenario: Reproducción exitosa de un video
  Given que un video tiene un audio asociado
  When el usuario toca el icono de reproducción
  Then el sistema reproduce el video en velocidad estándar
Examples:
  | INPUT |
  | Acción: Tap en botón Play |
  | OUTPUT |
  | Video reproducido: Sí |
  | Velocidad: Estándar (1x) |

Scenario: Pausa de la reproducción en curso
  Given que un video se encuentra en reproducción
  When el usuario toca la pantalla durante la reproducción
  Then el sistema pausa el video y muestra el botón de Play nuevamente
Examples:
  | INPUT |
  | Estado del video: Reproduciéndose |
  | Acción: Tap en pantalla |
  | OUTPUT |
  | Video pausado: Sí |
  | Botón Play visible: Sí |

Scenario: Reanudación tras finalizar el video
  Given que un video terminó de reproducirse por completo
  When el usuario toca nuevamente el botón de Play
  Then el sistema reproduce el video desde el inicio
Examples:
  | INPUT |
  | Estado previo: Video finalizado |
  | OUTPUT |
  | Reproducción reiniciada desde: 00:00 |
