Feature: US28 - Saludo personalizado
  Como Héctor
  Quiero recibir un saludo con mi nombre y la fecha actual
  Para sentir una bienvenida cálida

Scenario: Visualización exitosa del saludo personalizado
  Given que el sistema reconoce la sesión del usuario
  When se carga el inicio
  Then aparece un texto de saludo con su nombre y la fecha actual
Examples:
  | INPUT |
  | Usuario: Héctor |
  | Fecha actual: "Lunes 15 de mayo" |
  | OUTPUT |
  | Texto mostrado: "Hola Héctor, hoy es lunes 15 de mayo" |

Scenario: Saludo adaptado al horario del día
  Given que el sistema obtiene la hora actual del dispositivo
  When carga la pantalla de inicio
  Then ajusta el saludo según el momento del día (mañana, tarde o noche)
Examples:
  | INPUT |
  | Hora actual: 19:30 |
  | OUTPUT |
  | Texto mostrado: "Buenas noches Héctor, hoy es lunes 15 de mayo" |

Scenario: Saludo para un usuario sin nombre configurado
  Given que el usuario no completó su nombre durante el registro
  When carga la pantalla de inicio
  Then el sistema muestra un saludo genérico sin nombre propio
Examples:
  | INPUT |
  | Nombre configurado: No |
  | OUTPUT |
  | Texto mostrado: "Hola, hoy es lunes 15 de mayo" |
