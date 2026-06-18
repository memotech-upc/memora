Feature: US29 - Pantalla de carga simplificada
  Como Héctor
  Quiero ver una animación sencilla mientras la app carga
  Para entender que el sistema está trabajando

Scenario: Visualización exitosa de la pantalla de carga
  Given que la aplicación está iniciando
  When se descargan los datos
  Then se muestra el logo de Memora oscilando suavemente en el centro
Examples:
  | INPUT |
  | Estado: Aplicación iniciando |
  | OUTPUT |
  | Logo animado mostrado: Sí |
  | Posición: Centro de la pantalla |

Scenario: Carga prolongada por conexión lenta
  Given que la pantalla de carga supera los 5 segundos de duración
  When el sistema detecta una conexión lenta
  Then muestra un mensaje adicional indicando que la carga está tomando más tiempo de lo habitual
Examples:
  | INPUT |
  | Tiempo de carga: 6 segundos |
  | OUTPUT |
  | Mensaje adicional mostrado: "Esto está tomando más tiempo de lo normal" |

Scenario: Transición fluida al finalizar la carga
  Given que la pantalla de carga ha completado la descarga de datos
  When el sistema termina de cargar
  Then realiza una transición suave hacia la pantalla de inicio
Examples:
  | INPUT |
  | Estado: Carga completada |
  | OUTPUT |
  | Transición a pantalla de inicio: Suave (fade) |
