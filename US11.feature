Feature: US11 - Visualización de fotos
  Como Héctor
  Quiero ver las fotos recibidas en pantalla completa
  Para reconocer a mis familiares con mayor claridad

Scenario: Expansión exitosa de una foto a pantalla completa
  Given que el usuario recibió una imagen en el chat
  When toca la fotografía
  Then esta se expande a pantalla completa con un botón de cierre visible en una de las esquinas superiores
Examples:
  | INPUT |
  | Acción: Tap en miniatura de foto |
  | OUTPUT |
  | Foto expandida: Sí |
  | Botón de cierre visible: Sí |

Scenario: Cierre de la vista de pantalla completa
  Given que una foto se encuentra expandida en pantalla completa
  When el usuario presiona el botón de cierre
  Then el sistema regresa a la conversación del chat
Examples:
  | INPUT |
  | Acción: Tap en botón de cierre |
  | OUTPUT |
  | Vista de chat restaurada: Sí |

Scenario: Zoom sobre la foto en pantalla completa
  Given que una foto se encuentra expandida en pantalla completa
  When el usuario realiza un gesto de pellizco (pinch) sobre la imagen
  Then el sistema aplica zoom sobre la foto manteniendo la calidad visual
Examples:
  | INPUT |
  | Gesto: Pinch to zoom |
  | OUTPUT |
  | Zoom aplicado: Sí |
