Feature: US01 - Registro de estado de ánimo diario
  Como adulto mayor
  Quiero marcar cómo me siento hoy con un icono grande
  Para que mi familia sepa que estoy bien sin tener que escribir

Scenario: Registro exitoso del estado de ánimo
  Given que el usuario se encuentra en la sección Dashboard
  When selecciona uno de los iconos visuales de estado de ánimo
  Then el sistema registra su elección
  And muestra un mensaje de confirmación en pantalla
Examples:
  | INPUT |
  | Icono seleccionado: "Feliz" |
  | OUTPUT |
  | Estado registrado: Sí |
  | Mensaje de confirmación: "Estado de ánimo guardado" |

Scenario: Cambio del estado de ánimo ya registrado en el día
  Given que el usuario ya registró un estado de ánimo previamente en el día
  When selecciona un icono de estado de ánimo distinto al ya guardado
  Then el sistema reemplaza el registro anterior por el nuevo
  And actualiza el mensaje de confirmación
Examples:
  | INPUT |
  | Estado previo: "Tranquilo" |
  | Nuevo estado seleccionado: "Emocionado" |
  | OUTPUT |
  | Estado actualizado: Sí |
  | Estado final guardado: "Emocionado" |

Scenario: Intento de registro sin conexión a internet
  Given que el dispositivo del usuario no tiene conexión a internet
  When el usuario selecciona un icono de estado de ánimo
  Then el sistema almacena el registro localmente
  And lo sincroniza automáticamente al recuperar la conexión
Examples:
  | INPUT |
  | Estado de conexión: Sin internet |
  | Icono seleccionado: "Triste" |
  | OUTPUT |
  | Registro local guardado: Sí |
  | Sincronización pendiente: Sí |
