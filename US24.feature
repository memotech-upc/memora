Feature: US24 - Actualización de datos de salud
  Como hija/familiar
  Quiero registrar alergias o condiciones médicas en el perfil
  Para que cualquier persona que asista a mi padre tenga esa información a la mano

Scenario: Registro exitoso de una observación de salud
  Given que la hija está en la sección "Estado de salud" del Perfil
  When escribe una nueva observación de salud
  Then la información queda guardada y visible en caso de emergencia
Examples:
  | INPUT |
  | Observación ingresada: "Alergia a la penicilina" |
  | OUTPUT |
  | Observación guardada: Sí |
  | Visible en caso de emergencia: Sí |

Scenario: Edición de una observación de salud existente
  Given que ya existe una observación de salud registrada
  When la hija modifica el texto de la observación
  Then el sistema actualiza la información guardada
Examples:
  | INPUT |
  | Observación previa: "Alergia a la penicilina" |
  | Observación actualizada: "Alergia a la penicilina y al polen" |
  | OUTPUT |
  | Información actualizada: Sí |

Scenario: Eliminación de una observación de salud
  Given que existe una observación de salud que ya no es vigente
  When la hija la elimina desde la sección de edición
  Then el sistema remueve la observación del perfil
Examples:
  | INPUT |
  | Acción: Eliminar observación |
  | OUTPUT |
  | Observación eliminada: Sí |
