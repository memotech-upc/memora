Feature: US22 - Personalización del avatar
  Como Héctor
  Quiero poder elegir entre una foto o un avatar personalizable como foto de perfil
  Para sentirme identificado y reconocido dentro de la aplicación

Scenario: El adulto mayor actualiza su avatar con una imagen de la galería
  Given que Héctor está editando su Perfil
  When selecciona editar (icono de lápiz) y elige una imagen de la galería
  Then el sistema actualiza su avatar
  And lo refleja en todas las secciones de la aplicación

Examples:
| INPUT |
| Sección: Perfil |
| Imagen seleccionada: "foto_nueva.jpg" desde la galería |

| OUTPUT |
| Avatar actualizado: "foto_nueva.jpg" |
| Ubicación: Visible en todas las secciones |


Scenario: El adulto mayor cancela la selección de una nueva imagen
  Given que Héctor abrió el selector de imágenes de la galería
  When cierra el selector sin elegir ninguna imagen
  Then el sistema no debe modificar el avatar actual
  And debe mantener la imagen previamente configurada

Examples:
| INPUT |
| Avatar actual: "foto_anterior.jpg" |
| Acción: Cierra el selector sin elegir imagen |

| OUTPUT |
| Avatar: Sin cambios ("foto_anterior.jpg") |


Scenario: El adulto mayor selecciona un archivo con formato no compatible
  Given que Héctor está seleccionando una imagen desde la galería
  When elige un archivo con un formato no soportado por el sistema
  Then el sistema no debe actualizar el avatar
  And debe mostrar el mensaje "Formato de imagen no compatible"

Examples:
| INPUT |
| Archivo seleccionado: "documento.pdf" |

| OUTPUT |
| Mensaje de error: "Formato de imagen no compatible" |


Scenario: El sistema falla al subir la nueva imagen de perfil
  Given que Héctor selecciona una imagen válida de la galería
  When ocurre un error al subir la imagen al servidor
  Then el avatar no debe actualizarse
  And el sistema debe mostrar el mensaje "No se pudo actualizar tu foto de perfil"

Examples:
| INPUT |
| Imagen seleccionada: "foto_familia.jpg" |
| Condición: Error de carga en el servidor |

| OUTPUT |
| Mensaje de error: "No se pudo actualizar tu foto de perfil" |
