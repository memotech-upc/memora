Feature: US29 - Pantalla de carga simplificada
  Como Héctor
  Quiero ver una animación sencilla mientras la app carga
  Para entender que el sistema está trabajando

Scenario: La pantalla de carga se muestra correctamente al iniciar la app
  Given que la aplicación está iniciando
  When se descargan los datos necesarios
  Then se muestra el logo de Memora oscilando suavemente en el centro
  And la animación se mantiene hasta que la carga finaliza

Examples:
| INPUT |
| Estado de la app: Iniciando |
| Tiempo estimado de carga: 2 segundos |

| OUTPUT |
| Animación mostrada: Logo de Memora oscilando |
| Resultado: Transición a la pantalla de inicio |


Scenario: La carga de datos toma más tiempo del esperado
  Given que la aplicación está iniciando
  When la descarga de datos tarda más de lo habitual
  Then el sistema debe mantener la animación de carga activa
  And no debe congelarse ni mostrar la pantalla en blanco

Examples:
| INPUT |
| Estado de la app: Iniciando |
| Tiempo de carga: Más de 10 segundos |

| OUTPUT |
| Animación: Activa durante toda la espera |
| Pantalla en blanco: No mostrada |


Scenario: El sistema falla durante la pantalla de carga
  Given que la aplicación está iniciando
  When ocurre un error de conexión durante la descarga de datos
  Then la animación de carga debe detenerse
  And el sistema debe mostrar el mensaje "No se pudo iniciar Memora, inténtalo de nuevo" con un botón de reintentar

Examples:
| INPUT |
| Estado de la app: Iniciando |
| Condición: Error de conexión |

| OUTPUT |
| Mensaje de error: "No se pudo iniciar Memora, inténtalo de nuevo" |
| Acción disponible: Botón "Reintentar" |
