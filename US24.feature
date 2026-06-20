Feature: US24 - Actualización de datos de salud
  Como hija/familiar
  Quiero registrar alergias o condiciones médicas en el perfil
  Para que cualquier persona que asista a mi padre tenga esa información a la mano

Scenario: La hija registra una nueva observación de salud
  Given que la hija está en la sección "Estado de salud" del Perfil
  When escribe una nueva observación de salud
  And presiona el botón "Guardar"
  Then la información queda guardada
  And visible en caso de emergencia

Examples:
| INPUT |
| Observación: "Alergia a la penicilina" |
| Acción: Clic en el botón "Guardar" |

| OUTPUT |
| Observación guardada: "Alergia a la penicilina" |
| Visibilidad: Disponible en caso de emergencia |


Scenario: La hija intenta guardar la observación de salud sin escribir contenido
  Given que la hija está en la sección "Estado de salud" del Perfil
  When deja el campo de observación vacío
  And presiona el botón "Guardar"
  Then el sistema no debe guardar ninguna observación
  And debe mostrar el mensaje "Escribe una observación antes de guardar"

Examples:
| INPUT |
| Observación: "" |
| Acción: Clic en el botón "Guardar" |

| OUTPUT |
| Mensaje de error: "Escribe una observación antes de guardar" |


Scenario: La hija ingresa una observación que excede el límite de caracteres permitido
  Given que la hija está en la sección "Estado de salud" del Perfil
  When escribe una observación que supera el límite de 300 caracteres
  And presiona el botón "Guardar"
  Then el sistema no debe permitir guardar el texto completo
  And debe mostrar el mensaje "La observación supera el límite de caracteres permitido"

Examples:
| INPUT |
| Observación: Texto de 350 caracteres |
| Acción: Clic en el botón "Guardar" |

| OUTPUT |
| Mensaje de error: "La observación supera el límite de caracteres permitido" |


Scenario: El sistema falla al guardar la observación de salud
  Given que la hija escribe una observación válida en el campo de salud
  When ocurre un error de conexión al guardar la información
  Then la observación no debe quedar registrada
  And el sistema debe mostrar el mensaje "No se pudo guardar la información, inténtalo nuevamente"

Examples:
| INPUT |
| Observación: "Hipertensión arterial controlada" |
| Condición: Falla de conexión |

| OUTPUT |
| Mensaje de error: "No se pudo guardar la información, inténtalo nuevamente" |
