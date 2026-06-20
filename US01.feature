Feature: US01 - Registro de estado de ánimo diario
  Como adulto mayor
  Quiero marcar cómo me siento hoy con un icono grande
  Para que mi familia sepa que estoy bien sin tener que escribir

Scenario: El adulto mayor registra su estado de ánimo seleccionando un icono
  Given que Héctor se encuentra en la sección Dashboard
  When selecciona uno de los iconos visuales de estado de ánimo
  Then el sistema registra su elección
  And muestra un mensaje de confirmación en pantalla

Examples:
| INPUT |
| Sección: Dashboard |
| Acción: Toca el icono "😊 Feliz" |

| OUTPUT |
| Registro: Estado de ánimo "Feliz" guardado |
| Mensaje: "Tu estado de ánimo fue registrado" |


Scenario: El adulto mayor intenta avanzar sin seleccionar ningún icono
  Given que Héctor se encuentra en la sección Dashboard
  When no selecciona ningún icono de estado de ánimo
  And presiona el botón "Continuar"
  Then el sistema no debe registrar ningún estado de ánimo
  And debe mostrar el mensaje "Selecciona cómo te sientes hoy"

Examples:
| INPUT |
| Sección: Dashboard |
| Icono seleccionado: Ninguno |
| Acción: Clic en el botón "Continuar" |

| OUTPUT |
| Mensaje de error: "Selecciona cómo te sientes hoy" |


Scenario: El adulto mayor intenta registrar el estado de ánimo más de una vez en el mismo día
  Given que Héctor ya registró su estado de ánimo hoy
  When ingresa nuevamente a la sección Dashboard
  And selecciona otro icono de estado de ánimo
  Then el sistema debe actualizar el registro existente del día
  And mostrar el mensaje "Tu estado de ánimo de hoy fue actualizado"

Examples:
| INPUT |
| Registro previo: "Feliz" (08:00 a.m.) |
| Nuevo icono seleccionado: "Cansado" (06:00 p.m.) |

| OUTPUT |
| Registro: Estado de ánimo actualizado a "Cansado" |
| Mensaje: "Tu estado de ánimo de hoy fue actualizado" |


Scenario: El sistema falla al guardar el estado de ánimo seleccionado
  Given que Héctor se encuentra en la sección Dashboard
  When selecciona un icono de estado de ánimo
  And ocurre un error de conexión con el servidor
  Then el sistema no debe guardar el registro
  And debe mostrar el mensaje "No se pudo guardar tu estado, inténtalo de nuevo"

Examples:
| INPUT |
| Sección: Dashboard |
| Acción: Toca el icono "😢 Triste" |
| Condición: Sin conexión a internet |

| OUTPUT |
| Mensaje de error: "No se pudo guardar tu estado, inténtalo de nuevo" |
