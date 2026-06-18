Feature: US30 - Confirmación de cierre de app
  Como Héctor
  Quiero que la app me pregunte si realmente quiero salir
  Para evitar cerrar la sesión por un toque accidental en los botones

Scenario: Confirmación exitosa de cierre
  Given que el usuario presiona el botón de retroceso del sistema
  When se encuentra en la pantalla de inicio
  Then aparece un mensaje grande preguntando "¿Deseas cerrar Memora?" con las opciones de "Sí" y "No"
Examples:
  | INPUT |
  | Acción: Botón de retroceso en pantalla de inicio |
  | OUTPUT |
  | Mensaje de confirmación mostrado: Sí |
  | Opciones disponibles: "Sí" y "No" |

Scenario: Cancelación del cierre de la app
  Given que el mensaje de confirmación de cierre está visible
  When el usuario selecciona la opción "No"
  Then el sistema cierra el mensaje y permanece en la pantalla de inicio
Examples:
  | INPUT |
  | Opción seleccionada: "No" |
  | OUTPUT |
  | App cerrada: No |
  | Pantalla actual: Inicio |

Scenario: Confirmación y cierre efectivo de la app
  Given que el mensaje de confirmación de cierre está visible
  When el usuario selecciona la opción "Sí"
  Then el sistema cierra la aplicación completamente
Examples:
  | INPUT |
  | Opción seleccionada: "Sí" |
  | OUTPUT |
  | App cerrada: Sí |
