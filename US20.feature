Feature: US20 - Recordatorio de efemérides
  Como Héctor
  Quiero recibir una notificación si hoy se cumple el aniversario de un video/foto guardado
  Para celebrar momentos especiales del pasado

Scenario: Aviso exitoso de efeméride
  Given que una foto coincide con la fecha actual (pero de años anteriores)
  When el usuario abre la app
  Then aparece un aviso de "Un día como hoy"
Examples:
  | INPUT |
  | Fecha actual: "15/06" |
  | Fecha del recuerdo: "15/06/2024" |
  | OUTPUT |
  | Aviso mostrado: "Un día como hoy" |
  | Recuerdo asociado mostrado: Sí |

Scenario: Sin efemérides para el día actual
  Given que ningún recuerdo coincide con la fecha actual de años anteriores
  When el usuario abre la app
  Then el sistema no muestra ningún aviso de efeméride
Examples:
  | INPUT |
  | Recuerdos coincidentes con la fecha: 0 |
  | OUTPUT |
  | Aviso mostrado: No |

Scenario: Múltiples efemérides en el mismo día
  Given que existen dos o más recuerdos guardados con la misma fecha de años distintos
  When el usuario abre la app en esa fecha
  Then el sistema agrupa los recuerdos en un solo aviso desplegable
Examples:
  | INPUT |
  | Recuerdos coincidentes: 2 (2023 y 2024) |
  | OUTPUT |
  | Aviso agrupado mostrado: Sí |
  | Recuerdos incluidos: 2 |
