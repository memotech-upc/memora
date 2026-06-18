Feature: US26 - Visualización de último recuerdo
  Como Héctor
  Quiero ver la última foto subida por mi familia al inicio
  Para sentirme conectado emocionalmente desde el primer segundo

Scenario: Visualización exitosa del último recuerdo en el inicio
  Given que se ha subido contenido nuevo a la Biblioteca
  When el usuario entra a la app
  Then la pantalla de inicio muestra una vista previa en grande de la imagen más reciente
Examples:
  | INPUT |
  | Última subida: Foto del cumpleaños |
  | OUTPUT |
  | Vista previa mostrada: Sí |
  | Tamaño: Grande, destacado en pantalla de inicio |

Scenario: Sin contenido nuevo desde el último acceso
  Given que no se ha subido ningún recuerdo nuevo desde la última vez que el usuario abrió la app
  When el usuario entra a la app
  Then la pantalla de inicio muestra el recuerdo del día anterior como contenido principal
Examples:
  | INPUT |
  | Contenido nuevo desde último acceso: 0 |
  | OUTPUT |
  | Recuerdo mostrado: Recuerdo del día anterior |

Scenario: Acceso directo al recuerdo completo desde el inicio
  Given que el usuario visualiza la vista previa del último recuerdo en el inicio
  When toca sobre la vista previa
  Then el sistema lo redirige a la vista completa del recuerdo en la Biblioteca
Examples:
  | INPUT |
  | Acción: Tap en vista previa |
  | OUTPUT |
  | Pantalla destino: Biblioteca - vista completa del recuerdo |
