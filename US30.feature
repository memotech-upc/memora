Feature: US30 - Confirmación de cierre de app
  Como Héctor
  Quiero que la app me pregunte si realmente quiero salir
  Para evitar cerrar la sesión por un toque accidental en los botones

Scenario: El sistema solicita confirmación al presionar el botón de retroceso en el inicio
  Given que Héctor está en la pantalla de inicio
  When presiona el botón de retroceso del sistema
  Then aparece un mensaje preguntando "¿Deseas cerrar Memora?"
  And se muestran únicamente las opciones "Sí" y "No"

Examples:
| INPUT |
| Sección: Pantalla de inicio |
| Acción: Presiona el botón de retroceso |

| OUTPUT |
| Mensaje mostrado: "¿Deseas cerrar Memora?" |
| Opciones disponibles: "Sí", "No" |


Scenario: El adulto mayor confirma el cierre de la aplicación
  Given que el mensaje "¿Deseas cerrar Memora?" está visible en pantalla
  When Héctor selecciona la opción "Sí"
  Then el sistema debe cerrar la aplicación
  And finalizar la sesión actual

Examples:
| INPUT |
| Mensaje visible: "¿Deseas cerrar Memora?" |
| Opción seleccionada: "Sí" |

| OUTPUT |
| Aplicación: Cerrada |


Scenario: El adulto mayor cancela el cierre de la aplicación
  Given que el mensaje "¿Deseas cerrar Memora?" está visible en pantalla
  When Héctor selecciona la opción "No"
  Then el sistema debe cerrar el mensaje de confirmación
  And mantener la aplicación abierta en la pantalla de inicio

Examples:
| INPUT |
| Mensaje visible: "¿Deseas cerrar Memora?" |
| Opción seleccionada: "No" |

| OUTPUT |
| Aplicación: Permanece abierta |
| Mensaje de confirmación: Cerrado |


Scenario: El botón de retroceso se presiona fuera de la pantalla de inicio
  Given que Héctor se encuentra en una sección distinta a la pantalla de inicio
  When presiona el botón de retroceso del sistema
  Then el sistema no debe mostrar el mensaje de confirmación de cierre
  And debe navegar a la pantalla anterior con normalidad

Examples:
| INPUT |
| Sección actual: Biblioteca |
| Acción: Presiona el botón de retroceso |

| OUTPUT |
| Mensaje de confirmación: No mostrado |
| Navegación: A la pantalla anterior |
