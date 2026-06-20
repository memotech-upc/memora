Feature: US28 - Saludo personalizado
  Como Héctor
  Quiero recibir un saludo con mi nombre y la fecha actual
  Para sentir una bienvenida cálida

Scenario: El adulto mayor recibe un saludo personalizado al ingresar a la app
  Given que el sistema reconoce la sesión de Héctor
  When se carga la pantalla de inicio
  Then aparece el texto "Hola Héctor, hoy es lunes 15 de mayo"
  And se muestra de forma destacada en la parte superior de la pantalla

Examples:
| INPUT |
| Usuario en sesión: Héctor |
| Fecha actual: Lunes 15 de mayo |

| OUTPUT |
| Saludo mostrado: "Hola Héctor, hoy es lunes 15 de mayo" |


Scenario: El sistema falla al obtener el nombre del usuario para el saludo
  Given que se carga la pantalla de inicio
  When ocurre un error al recuperar el nombre del perfil de Héctor
  Then el sistema debe mostrar un saludo genérico
  And debe seguir indicando la fecha actual correctamente

Examples:
| INPUT |
| Condición: Falla al cargar el nombre del perfil |
| Fecha actual: Lunes 15 de mayo |

| OUTPUT |
| Saludo mostrado: "Hola, hoy es lunes 15 de mayo" |


Scenario: El saludo se actualiza automáticamente al cambiar de día
  Given que Héctor mantiene la app abierta hasta la medianoche
  When la fecha del sistema cambia al nuevo día
  Then el saludo de la pantalla de inicio debe actualizarse automáticamente
  And reflejar la nueva fecha sin requerir que Héctor reinicie la app

Examples:
| INPUT |
| Fecha previa: Lunes 15 de mayo (11:59 p.m.) |
| Fecha nueva: Martes 16 de mayo (12:00 a.m.) |

| OUTPUT |
| Saludo actualizado: "Hola Héctor, hoy es martes 16 de mayo" |
