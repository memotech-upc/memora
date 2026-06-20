Feature: US21 - Contactos de emergencia
  Como hija/familiar
  Quiero configurar números de marcado rápido
  Para que mi padre pueda pedir ayuda con un solo toque en caso de necesidad

Scenario: La hija configura un contacto de emergencia válido
  Given que la hija está en la configuración de seguridad
  When ingresa un número telefónico de emergencia válido
  And presiona el botón "Guardar"
  Then el sistema habilita un botón de acceso directo en la pantalla de inicio
  And asocia el número configurado a dicho botón

Examples:
| INPUT |
| Número de emergencia: "987654321" |
| Acción: Clic en el botón "Guardar" |

| OUTPUT |
| Botón de acceso directo: Habilitado en la pantalla de inicio |
| Número asociado: "987654321" |


Scenario: La hija intenta guardar el contacto de emergencia sin ingresar un número
  Given que la hija está en la configuración de seguridad
  When deja el campo de número telefónico vacío
  And presiona el botón "Guardar"
  Then el sistema no debe guardar ningún contacto
  And debe mostrar el mensaje "Ingresa un número de emergencia"

Examples:
| INPUT |
| Número de emergencia: "" |
| Acción: Clic en el botón "Guardar" |

| OUTPUT |
| Mensaje de error: "Ingresa un número de emergencia" |


Scenario: La hija ingresa un número de emergencia con formato inválido
  Given que la hija está en la configuración de seguridad
  When ingresa un número incompleto o con letras
  And presiona el botón "Guardar"
  Then el sistema no debe guardar el contacto
  And debe mostrar el mensaje "Ingresa un número de teléfono válido"

Examples:
| INPUT |
| Número de emergencia: "98abc21" |
| Acción: Clic en el botón "Guardar" |

| OUTPUT |
| Mensaje de error: "Ingresa un número de teléfono válido" |


Scenario: El sistema falla al guardar el contacto de emergencia
  Given que la hija ingresa un número de emergencia válido
  When ocurre un error de conexión al guardar la configuración
  Then el botón de acceso directo no debe habilitarse
  And el sistema debe mostrar el mensaje "No se pudo guardar el contacto, inténtalo de nuevo"

Examples:
| INPUT |
| Número de emergencia: "912345678" |
| Condición: Falla de conexión |

| OUTPUT |
| Mensaje de error: "No se pudo guardar el contacto, inténtalo de nuevo" |
