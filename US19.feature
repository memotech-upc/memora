Feature: US19 - Destacar videos/fotos favoritos
  Como adulto mayor
  Quiero marcar con un corazón mis videos/fotos favoritos
  Para encontrarlas rápidamente en una sección especial

Scenario: Marcado exitoso de un recuerdo como favorito
  Given que el usuario visualiza un recuerdo
  When presiona el icono de corazón
  Then el sistema añade el recuerdo a la categoría de "Mis Favoritos"
Examples:
  | INPUT |
  | Recuerdo: Video del 12/05 |
  | Acción: Tap en icono de corazón |
  | OUTPUT |
  | Agregado a Favoritos: Sí |

Scenario: Eliminación de un recuerdo de favoritos
  Given que un recuerdo ya se encuentra marcado como favorito
  When el usuario vuelve a presionar el icono de corazón sobre ese recuerdo
  Then el sistema lo elimina de la categoría "Mis Favoritos"
Examples:
  | INPUT |
  | Estado previo: Favorito |
  | Acción: Tap en icono de corazón |
  | OUTPUT |
  | Removido de Favoritos: Sí |

Scenario: Visualización de la sección de favoritos vacía
  Given que el usuario no ha marcado ningún recuerdo como favorito
  When accede a la sección "Mis Favoritos"
  Then el sistema muestra un mensaje indicando que aún no tiene favoritos guardados
Examples:
  | INPUT |
  | Recuerdos marcados: 0 |
  | OUTPUT |
  | Mensaje mostrado: "Aún no tienes recuerdos favoritos" |
