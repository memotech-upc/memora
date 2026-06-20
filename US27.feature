Feature: US27 - Botón de auxilio rápido
  Como Héctor
  Quiero tener un botón de "Pedir ayuda" siempre visible en el inicio
  Para contactar a mi familia rápidamente en caso de emergencia

Scenario: El adulto mayor activa una llamada de emergencia
  Given que Héctor está en la pantalla principal
  When presiona el botón rojo de emergencia ("Sirena roja") durante 3 segundos
  Then el sistema realiza una llamada automática al contacto configurado
  And muestra en pantalla el nombre del contacto que está siendo llamado

Examples:
| INPUT |
| Sección: Pantalla principal |
| Duración de la presión: 3 segundos |
| Contacto configurado: "Hija - María" |

| OUTPUT |
| Llamada realizada: A "Hija - María" |
| Pantalla mostrada: "Llamando a María..." |


Scenario: El adulto mayor suelta el botón antes del tiempo requerido
  Given que Héctor está en la pantalla principal
  When presiona el botón rojo de emergencia menos de 3 segundos
  Then el sistema no debe activar la llamada de emergencia
  And debe mostrar el mensaje "Mantén presionado para pedir ayuda"

Examples:
| INPUT |
| Duración de la presión: 1.5 segundos |

| OUTPUT |
| Llamada: No activada |
| Mensaje: "Mantén presionado para pedir ayuda" |


Scenario: El adulto mayor presiona el botón sin tener un contacto de emergencia configurado
  Given que Héctor no tiene ningún contacto de emergencia configurado
  When presiona el botón rojo de emergencia durante 3 segundos
  Then el sistema no debe realizar ninguna llamada
  And debe mostrar el mensaje "No tienes un contacto de emergencia configurado"

Examples:
| INPUT |
| Contacto de emergencia configurado: Ninguno |
| Duración de la presión: 3 segundos |

| OUTPUT |
| Mensaje de error: "No tienes un contacto de emergencia configurado" |


Scenario: El sistema falla al realizar la llamada de emergencia
  Given que Héctor presiona el botón de emergencia durante 3 segundos
  When ocurre un error de red o del dispositivo al intentar conectar la llamada
  Then la llamada no debe establecerse
  And el sistema debe mostrar el mensaje "No se pudo realizar la llamada, inténtalo de nuevo"

Examples:
| INPUT |
| Contacto configurado: "Hija - María" |
| Condición: Falla de red al realizar la llamada |

| OUTPUT |
| Mensaje de error: "No se pudo realizar la llamada, inténtalo de nuevo" |
