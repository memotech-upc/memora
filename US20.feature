Feature: US20 - Recordatorio de efemérides
  Como Héctor
  Quiero recibir una notificación si hoy se cumple el aniversario de un video/foto guardado
  Para celebrar momentos especiales del pasado

Scenario: El adulto mayor recibe un aviso de aniversario al abrir la app
  Given que una foto coincide con la fecha actual de años anteriores
  When Héctor abre la app
  Then el sistema muestra el aviso "Un día como hoy"
  And presenta el recuerdo correspondiente a esa fecha

Examples:
| INPUT |
| Fecha actual: 15 de marzo |
| Foto coincidente: "Cumpleaños de Héctor" (15 de marzo de 2019) |

| OUTPUT |
| Aviso mostrado: "Un día como hoy" |
| Recuerdo presentado: "Cumpleaños de Héctor" |


Scenario: No existen recuerdos coincidentes con la fecha actual
  Given que ninguna foto coincide con la fecha actual de años anteriores
  When Héctor abre la app
  Then el sistema no debe mostrar ningún aviso de efeméride
  And debe cargar la pantalla de inicio con normalidad

Examples:
| INPUT |
| Fecha actual: 2 de febrero |
| Fotos coincidentes: 0 |

| OUTPUT |
| Aviso de efeméride: No mostrado |
| Pantalla de inicio: Cargada con normalidad |


Scenario: El sistema falla al verificar las efemérides del día
  Given que existe contenido en la Biblioteca coincidente con la fecha actual
  When ocurre un error en el proceso que verifica las efemérides
  Then el aviso "Un día como hoy" no debe mostrarse
  And el sistema debe registrar la incidencia sin interrumpir el uso de la app

Examples:
| INPUT |
| Fecha actual: 20 de junio |
| Condición: Falla en el proceso de verificación |

| OUTPUT |
| Aviso mostrado: No |
| Incidencia: Registrada internamente |


Scenario: Varios recuerdos coinciden con la misma fecha de aniversario
  Given que más de un recuerdo coincide con la fecha actual de años anteriores
  When Héctor abre la app
  Then el sistema debe agrupar todos los recuerdos coincidentes en un solo aviso
  And permitir desplazarse entre ellos como un carrusel

Examples:
| INPUT |
| Fecha actual: 10 de mayo |
| Fotos coincidentes: "Día de la Madre 2018", "Día de la Madre 2020" |

| OUTPUT |
| Aviso mostrado: "Un día como hoy" |
| Recuerdos agrupados: 2 (en formato carrusel) |
