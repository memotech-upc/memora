Feature: US06 - Galería de logros históricos
  Como Héctor
  Quiero ver mis medallas ganadas anteriormente
  Para recordar mis avances y sentirme orgulloso de mi autonomía

Scenario: Visualización exitosa de la galería de medallas
  Given que el usuario ha ganado logros en semanas pasadas
  When toca la sección "Mis Premios" dentro del perfil
  Then el sistema despliega una cuadrícula con todos los iconos de las medallas obtenidas
Examples:
  | INPUT |
  | Acción: Tap en "Mis Premios" |
  | Medallas obtenidas: 4 |
  | OUTPUT |
  | Cuadrícula mostrada: Sí |
  | Medallas visibles: 4 |

Scenario: Galería vacía para un usuario nuevo
  Given que el usuario no ha obtenido ninguna medalla aún
  When accede a la sección "Mis Premios"
  Then el sistema muestra un mensaje motivacional indicando cómo obtener la primera medalla
Examples:
  | INPUT |
  | Medallas obtenidas: 0 |
  | OUTPUT |
  | Mensaje mostrado: "¡Usa la app todos los días para ganar tu primera medalla!" |

Scenario: Detalle de una medalla al seleccionarla
  Given que el usuario se encuentra en la galería de medallas
  When selecciona una medalla específica
  Then el sistema muestra la fecha en que fue obtenida y la condición que la desbloqueó
Examples:
  | INPUT |
  | Medalla seleccionada: "Usuario Activo - 7 días" |
  | OUTPUT |
  | Fecha de obtención mostrada: Sí |
  | Condición mostrada: "7 días consecutivos de uso" |
