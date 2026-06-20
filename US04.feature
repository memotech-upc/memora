Feature: US04 - Sistema de medallas por racha de uso
  Como adulto mayor
  Quiero ganar una medalla virtual al usar la app un cierto número de días seguidos
  Para sentirme motivado a mantener el hábito

Scenario: El adulto mayor obtiene una medalla por mantener su racha de uso
  Given que el sistema contabiliza los accesos diarios de Héctor
  When registra actividad por un tiempo consecutivo de 7 días
  Then el Dashboard desbloquea una medalla dorada de "Usuario Activo"
  And la medalla se visualiza en el perfil

Examples:
| INPUT |
| Racha de uso: 7 días consecutivos |

| OUTPUT |
| Medalla desbloqueada: "Usuario Activo" |
| Ubicación: Visible en el Dashboard y en el Perfil |


Scenario: La racha de uso del adulto mayor se interrumpe
  Given que Héctor llevaba una racha de 5 días consecutivos
  When deja de ingresar a la app durante un día completo
  Then el sistema debe reiniciar el contador de racha a 0
  And no debe otorgar la medalla correspondiente

Examples:
| INPUT |
| Racha previa: 5 días consecutivos |
| Días sin actividad: 1 |

| OUTPUT |
| Racha actual: 0 días |
| Medalla otorgada: Ninguna |


Scenario: El adulto mayor cumple los días requeridos pero ya posee la medalla
  Given que Héctor ya obtuvo la medalla de "Usuario Activo" en una racha anterior
  When completa nuevamente 7 días consecutivos de uso
  Then el sistema no debe duplicar la medalla en el perfil
  And debe mostrar un mensaje de refuerzo motivacional

Examples:
| INPUT |
| Medalla previa: "Usuario Activo" (ya obtenida) |
| Nueva racha completada: 7 días |

| OUTPUT |
| Medallas en perfil: 1 (sin duplicados) |
| Mensaje: "¡Sigues siendo un Usuario Activo!" |


Scenario: El sistema falla al contabilizar la racha de uso
  Given que Héctor ha cumplido los 7 días consecutivos requeridos
  When ocurre un error en el conteo de accesos del sistema
  Then la medalla no debe desbloquearse
  And el sistema debe registrar la incidencia para su revisión

Examples:
| INPUT |
| Racha registrada por el usuario: 7 días |
| Condición: Falla en el conteo del sistema |

| OUTPUT |
| Medalla otorgada: No |
| Incidencia: Registrada para revisión |
