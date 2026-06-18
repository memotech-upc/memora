Feature: US04 - Sistema de medallas por racha de uso
  Como adulto mayor
  Quiero ganar una medalla virtual al usar la app un cierto número de días seguidos
  Para sentirme motivado a mantener el hábito

Scenario: Desbloqueo de medalla por racha consecutiva
  Given que el sistema contabiliza los accesos diarios del usuario
  When el usuario registra actividad por un tiempo consecutivo determinado
  Then el Dashboard desbloquea una medalla dorada de "Usuario Activo"
  And esta se visualiza en su perfil
Examples:
  | INPUT |
  | Días consecutivos de uso: 7 |
  | OUTPUT |
  | Medalla desbloqueada: "Usuario Activo - 7 días" |
  | Visible en perfil: Sí |

Scenario: Interrupción de la racha por inactividad
  Given que el usuario tenía una racha activa de varios días
  When pasa un día completo sin registrar actividad en la app
  Then el sistema reinicia el contador de racha a 0
  And no se descuenta ninguna medalla ya obtenida anteriormente
Examples:
  | INPUT |
  | Racha previa: 5 días |
  | Días sin actividad: 1 |
  | OUTPUT |
  | Racha reiniciada: 0 |
  | Medallas previas conservadas: Sí |

Scenario: Notificación al alcanzar un nuevo hito de racha
  Given que el usuario está cerca de alcanzar un nuevo hito de días consecutivos
  When completa la actividad del día que cumple el hito
  Then el sistema muestra una animación de celebración junto con la nueva medalla
Examples:
  | INPUT |
  | Hito alcanzado: 30 días |
  | OUTPUT |
  | Animación mostrada: Sí |
  | Medalla otorgada: "Usuario Activo - 30 días" |
