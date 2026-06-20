Feature: US11 - Visualización de fotos
  Como Héctor
  Quiero ver las fotos recibidas en pantalla completa
  Para reconocer a mis familiares con mayor claridad

Scenario: El adulto mayor amplía una fotografía recibida en el chat
  Given que Héctor recibió una imagen en el chat de Familia
  When toca la fotografía
  Then esta se expande a pantalla completa
  And se muestra un botón de cierre visible en una de las esquinas superiores

Examples:
| INPUT |
| Sección: Chat de Familia |
| Acción: Toca la fotografía recibida |

| OUTPUT |
| Vista: Imagen expandida a pantalla completa |
| Elemento visible: Botón de cierre en esquina superior |


Scenario: El adulto mayor cierra la vista ampliada de la fotografía
  Given que Héctor tiene una fotografía expandida en pantalla completa
  When presiona el botón de cierre
  Then el sistema debe regresar a la vista del chat de Familia
  And debe mantener la posición previa en la conversación

Examples:
| INPUT |
| Vista actual: Imagen en pantalla completa |
| Acción: Toca el botón de cierre |

| OUTPUT |
| Vista: Regresa al chat de Familia |
| Posición: Conversación previa conservada |


Scenario: El sistema falla al cargar la fotografía en pantalla completa
  Given que Héctor toca una fotografía recibida en el chat
  When la imagen no puede descargarse correctamente
  Then el sistema no debe mostrar la imagen ampliada
  And debe mostrar el mensaje "No se pudo cargar la imagen"

Examples:
| INPUT |
| Sección: Chat de Familia |
| Condición: Imagen corrupta o falla de descarga |

| OUTPUT |
| Mensaje de error: "No se pudo cargar la imagen" |
