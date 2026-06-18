Feature: US25 - Selección de idioma y región
  Como hija/familiar
  Quiero configurar la app en el idioma nativo de mi padre
  Para eliminar barreras lingüísticas que dificulten su comprensión

Scenario: Cambio exitoso de idioma
  Given que la hija accede a los ajustes regionales
  When selecciona el idioma "Español"
  Then todos los menús y mensajes del sistema se traducen inmediatamente
Examples:
  | INPUT |
  | Idioma seleccionado: "Español" |
  | OUTPUT |
  | Interfaz traducida: Sí |
  | Tiempo de aplicación: Inmediato |

Scenario: Idioma no disponible
  Given que la hija busca un idioma no soportado por la aplicación
  When intenta seleccionarlo en la lista de ajustes regionales
  Then el sistema no lo muestra como opción disponible
Examples:
  | INPUT |
  | Idioma buscado: "Quechua" |
  | OUTPUT |
  | Idioma disponible en lista: No |

Scenario: Persistencia del idioma seleccionado tras cerrar sesión
  Given que se configuró previamente el idioma "Español" para la cuenta
  When el usuario cierra sesión y vuelve a ingresar
  Then el sistema mantiene el idioma configurado anteriormente
Examples:
  | INPUT |
  | Idioma configurado previamente: "Español" |
  | OUTPUT |
  | Idioma tras reingreso: "Español" |
