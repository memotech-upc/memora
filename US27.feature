Feature: US27 - Botón de auxilio rápido
  Como Héctor
  Quiero tener un botón de "Pedir ayuda" siempre visible en el inicio
  Para contactar a mi familia rápidamente en caso de emergencia

Scenario: Llamada de emergencia exitosa
  Given que el usuario está en la pantalla principal
  When presiona el botón rojo de emergencia ("Sirena roja") por 3 segundos
  Then el sistema realiza una llamada automática al contacto configurado
Examples:
  | INPUT |
  | Acción: Mantener presionado el botón de emergencia por 3 segundos |
  | OUTPUT |
  | Llamada iniciada: Sí |
  | Destinatario: Contacto de emergencia configurado |

Scenario: Cancelación de la llamada antes de completar el tiempo requerido
  Given que el usuario presiona el botón de emergencia
  When suelta el botón antes de completar los 3 segundos
  Then el sistema cancela la acción y no realiza ninguna llamada
Examples:
  | INPUT |
  | Tiempo de presión: 1.5 segundos |
  | OUTPUT |
  | Llamada iniciada: No |

Scenario: Botón de emergencia sin contacto configurado
  Given que no se ha configurado ningún contacto de emergencia (ver US21)
  When el usuario presiona el botón de auxilio rápido
  Then el sistema muestra un mensaje indicando que debe configurar un contacto primero
Examples:
  | INPUT |
  | Contacto de emergencia configurado: No |
  | OUTPUT |
  | Llamada iniciada: No |
  | Mensaje mostrado: "Pide a tu familiar que configure un contacto de emergencia" |
