Feature: US22 - Personalización del avatar
  Como Héctor
  Quiero poder elegir entre una foto o un avatar personalizable como foto de perfil
  Para sentirme identificado y reconocido dentro de la aplicación

Scenario: Cambio exitoso del avatar desde la galería
  Given que el usuario está editando su Perfil
  When selecciona editar (icono de lápiz) y elige una imagen de la galería
  Then el sistema actualiza su avatar en todas las secciones
Examples:
  | INPUT |
  | Imagen seleccionada: Foto de la galería |
  | OUTPUT |
  | Avatar actualizado: Sí |
  | Visible en: Perfil, Dashboard, Chat |

Scenario: Selección de un avatar predefinido
  Given que el usuario no desea usar una foto personal
  When elige uno de los avatares ilustrados predefinidos por la app
  Then el sistema lo aplica como su foto de perfil
Examples:
  | INPUT |
  | Avatar seleccionado: "Avatar predefinido 3" |
  | OUTPUT |
  | Avatar actualizado: Sí |

Scenario: Cancelación del cambio de avatar
  Given que el usuario inició el proceso de edición del avatar
  When presiona "Cancelar" antes de confirmar la selección
  Then el sistema conserva el avatar previo sin modificaciones
Examples:
  | INPUT |
  | Acción: Cancelar edición |
  | OUTPUT |
  | Avatar modificado: No |
