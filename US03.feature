Feature: US03 - Notificación de actividad para el cuidador
  Como hija (familiar)
  Quiero recibir una notificación automática cuando mi padre use la app
  Para validar su adopción diaria y estar tranquila

Scenario: Notificación exitosa al detectar actividad
  Given que el adulto mayor ha realizado una acción en su Dashboard o biblioteca
  When el sistema detecta la actividad en tiempo real
  Then la hija recibe una alerta push en su celular indicando que el usuario ha iniciado sus actividades
Examples:
  | INPUT |
  | Acción detectada: "Apertura de la app" |
  | Usuario: "Héctor" |
  | OUTPUT |
  | Notificación enviada: Sí |
  | Mensaje: "Héctor ha iniciado sus actividades" |

Scenario: Notificación no enviada por falta de configuración del cuidador
  Given que el cuidador no ha vinculado su cuenta como familiar autorizado
  When el adulto mayor realiza una actividad en la app
  Then el sistema no envía ninguna notificación
  And registra el evento únicamente en el historial interno
Examples:
  | INPUT |
  | Cuenta familiar vinculada: No |
  | OUTPUT |
  | Notificación enviada: No |
  | Evento registrado en historial: Sí |

Scenario: Notificación retrasada por falta de conexión del cuidador
  Given que el dispositivo del cuidador no tiene conexión a internet en el momento de la actividad
  When el adulto mayor completa una acción
  Then el sistema encola la notificación
  And la entrega en cuanto el dispositivo del cuidador recupera la conexión
Examples:
  | INPUT |
  | Conexión del cuidador: Sin internet |
  | OUTPUT |
  | Notificación encolada: Sí |
  | Entrega diferida: Sí |
