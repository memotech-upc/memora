Feature: US06 - Galería de logros históricos
  Como Héctor
  Quiero ver mis medallas ganadas anteriormente
  Para recordar mis avances y sentirme orgulloso de mi autonomía

Scenario: El adulto mayor visualiza la galería completa de medallas obtenidas
  Given que Héctor ha ganado logros en semanas pasadas
  When toca la sección "Mis Premios" dentro del perfil
  Then el sistema despliega una cuadrícula
  And muestra todos los iconos de las medallas obtenidas

Examples:
| INPUT |
| Sección: Perfil > "Mis Premios" |
| Medallas obtenidas: "Usuario Activo", "Primera Semana" |

| OUTPUT |
| Cuadrícula mostrada: 2 medallas |
| Iconos: "Usuario Activo", "Primera Semana" |


Scenario: El adulto mayor consulta la galería sin haber obtenido medallas
  Given que Héctor aún no ha obtenido ninguna medalla
  When toca la sección "Mis Premios" dentro del perfil
  Then el sistema no debe mostrar ninguna cuadrícula de iconos
  And debe mostrar el mensaje "Aún no tienes medallas, ¡sigue usando Memora!"

Examples:
| INPUT |
| Sección: Perfil > "Mis Premios" |
| Medallas obtenidas: 0 |

| OUTPUT |
| Mensaje: "Aún no tienes medallas, ¡sigue usando Memora!" |


Scenario: El sistema falla al cargar la galería de logros
  Given que Héctor toca la sección "Mis Premios" dentro del perfil
  When ocurre un error al recuperar la información de medallas
  Then la cuadrícula no debe mostrarse
  And el sistema debe mostrar el mensaje "No se pudieron cargar tus premios" con un botón de reintentar

Examples:
| INPUT |
| Sección: Perfil > "Mis Premios" |
| Condición: Error al recuperar datos del servidor |

| OUTPUT |
| Mensaje de error: "No se pudieron cargar tus premios" |
| Acción disponible: Botón "Reintentar" |
