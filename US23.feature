Feature: US23 - Tutoriales de uso simple
  Como Héctor
  Quiero acceder a videos cortos de ayuda dentro de mi perfil
  Para aprender a usar las funciones de la app si se me olvidan

Scenario: Reproducción exitosa de un tutorial
  Given que el usuario pulsa el botón de "Ayuda"
  When selecciona un tema (ej. "Cómo enviar un audio")
  Then el sistema reproduce un video tutorial simplificado
Examples:
  | INPUT |
  | Tema seleccionado: "Cómo enviar un audio" |
  | OUTPUT |
  | Video tutorial reproducido: Sí |
  | Duración: <90 segundos |

Scenario: Listado de todos los temas disponibles
  Given que el usuario accede a la sección de Ayuda
  When visualiza la pantalla principal de tutoriales
  Then el sistema muestra una lista de temas disponibles con miniaturas representativas
Examples:
  | INPUT |
  | Acción: Acceder a sección "Ayuda" |
  | OUTPUT |
  | Temas listados: 5 |

Scenario: Búsqueda de un tutorial específico
  Given que el usuario se encuentra en la sección de Ayuda
  When escribe una palabra clave en el buscador de tutoriales
  Then el sistema filtra y muestra únicamente los tutoriales relacionados
Examples:
  | INPUT |
  | Palabra clave: "grabar" |
  | OUTPUT |
  | Resultados mostrados: Tutoriales relacionados con grabación |
