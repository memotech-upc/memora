Feature: US21 - Contactos de emergencia
  Como hija/familiar
  Quiero configurar números de marcado rápido
  Para que mi padre pueda pedir ayuda con un solo toque en caso de necesidad

Scenario: Configuración exitosa de un contacto de emergencia
  Given que la hija está en la configuración de seguridad
  When ingresa un número telefónico de emergencia
  Then se habilita un botón de acceso directo en la pantalla de inicio
Examples:
  | INPUT |
  | Número ingresado: "+51 987654321" |
  | OUTPUT |
  | Botón de acceso directo habilitado: Sí |

Scenario: Intento de registrar un número telefónico inválido
  Given que la hija está configurando un contacto de emergencia
  When ingresa un número con formato incorrecto
  Then el sistema muestra un mensaje de error y no guarda el contacto
Examples:
  | INPUT |
  | Número ingresado: "12345" |
  | OUTPUT |
  | Contacto guardado: No |
  | Mensaje de error: "Ingresa un número de teléfono válido" |

Scenario: Actualización de un contacto de emergencia existente
  Given que ya existe un contacto de emergencia configurado
  When la hija edita el número y guarda los cambios
  Then el sistema actualiza el contacto vinculado al botón de acceso directo
Examples:
  | INPUT |
  | Número anterior: "+51 987654321" |
  | Número nuevo: "+51 912345678" |
  | OUTPUT |
  | Contacto actualizado: Sí |
