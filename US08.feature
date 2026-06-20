Feature: US08 - Mensajes de refuerzo positivo dinámicos
  Como Héctor
  Quiero leer frases de aliento cuando veo mi progreso o termino de grabar el video diario o subir fotos
  Para reforzar mi confianza en el uso de la plataforma

Scenario: El adulto mayor recibe un mensaje de aliento al completar su progreso diario
  Given que Héctor completa el progreso diario
  When visualiza la barra de progreso completa
  Then debe aparecer una ventana emergente
  And mostrar la frase "¡Excelente trabajo, Héctor! Tu familia está orgullosa"

Examples:
| INPUT |
| Progreso del día: 100% |

| OUTPUT |
| Ventana emergente: Mostrada |
| Frase: "¡Excelente trabajo, Héctor! Tu familia está orgullosa" |


Scenario: El adulto mayor no completa el progreso diario
  Given que Héctor tiene tareas de interacción pendientes en el día
  When su progreso diario aún no llega al 100%
  Then el sistema no debe mostrar la ventana emergente de refuerzo positivo
  And debe mantener visible el porcentaje actual de avance

Examples:
| INPUT |
| Progreso del día: 60% |

| OUTPUT |
| Ventana emergente: No mostrada |
| Progreso visible: 60% |


Scenario: El sistema falla al mostrar el mensaje de refuerzo positivo
  Given que Héctor completa el progreso diario al 100%
  When ocurre un error al cargar el componente de la ventana emergente
  Then la frase de aliento no debe mostrarse
  And el sistema debe registrar el error sin interrumpir el uso de la app

Examples:
| INPUT |
| Progreso del día: 100% |
| Condición: Falla al cargar el componente de mensajes |

| OUTPUT |
| Ventana emergente: No mostrada |
| Incidencia: Registrada internamente |
