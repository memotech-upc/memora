Feature: US25 - Selección de idioma y región
  Como hija/familiar
  Quiero configurar la app en el idioma nativo de mi padre
  Para eliminar barreras lingüísticas que dificulten su comprensión

Scenario: La hija configura el idioma de la aplicación correctamente
  Given que la hija accede a los ajustes regionales
  When selecciona el idioma "Español"
  Then todos los menús y mensajes del sistema se traducen inmediatamente
  And la configuración queda guardada para futuras sesiones

Examples:
| INPUT |
| Sección: Ajustes regionales |
| Idioma seleccionado: "Español" |

| OUTPUT |
| Idioma aplicado: "Español" |
| Traducción: Inmediata en menús y mensajes |


Scenario: La hija cambia el idioma de la aplicación entre varias opciones
  Given que la app está configurada actualmente en "Español"
  When la hija selecciona un idioma distinto en los ajustes regionales
  Then el sistema debe actualizar todos los textos sin necesidad de reiniciar la app
  And debe reflejar el nuevo idioma de inmediato en la pantalla actual

Examples:
| INPUT |
| Idioma actual: "Español" |
| Idioma seleccionado: "Quechua" |

| OUTPUT |
| Idioma aplicado: "Quechua" |
| Reinicio de la app: No requerido |


Scenario: El sistema falla al aplicar el cambio de idioma seleccionado
  Given que la hija selecciona un nuevo idioma en los ajustes regionales
  When ocurre un error al cargar los textos traducidos
  Then los menús y mensajes no deben actualizarse al nuevo idioma
  And el sistema debe mostrar el mensaje "No se pudo aplicar el idioma seleccionado"

Examples:
| INPUT |
| Idioma seleccionado: "Aimara" |
| Condición: Falla al cargar las traducciones |

| OUTPUT |
| Mensaje de error: "No se pudo aplicar el idioma seleccionado" |
