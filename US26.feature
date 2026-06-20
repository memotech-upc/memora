Feature: US26 - Visualización de último recuerdo
  Como Héctor
  Quiero ver la última foto subida por mi familia al inicio
  Para sentirme conectado emocionalmente desde el primer segundo

Scenario: El adulto mayor ve la vista previa del recuerdo más reciente al ingresar
  Given que se ha subido contenido nuevo a la Biblioteca
  When Héctor entra a la app
  Then la pantalla de inicio muestra una vista previa en grande de la imagen más reciente
  And permite tocarla para ver el recuerdo completo

Examples:
| INPUT |
| Última foto subida: "Visita de los nietos" (hace 2 horas) |

| OUTPUT |
| Pantalla de inicio: Vista previa grande de "Visita de los nietos" |


Scenario: El adulto mayor ingresa a la app sin contenido subido aún
  Given que la familia no ha subido ningún recuerdo a la Biblioteca
  When Héctor entra a la app
  Then la pantalla de inicio no debe mostrar ninguna vista previa de imagen
  And debe mostrar un mensaje por defecto invitando a esperar nuevos recuerdos

Examples:
| INPUT |
| Recuerdos subidos: 0 |

| OUTPUT |
| Mensaje por defecto: "Pronto verás aquí tus recuerdos" |


Scenario: El sistema falla al cargar la vista previa del último recuerdo
  Given que existe un recuerdo reciente disponible en la Biblioteca
  When ocurre un error al cargar la vista previa en la pantalla de inicio
  Then el sistema debe mostrar un ícono de error en lugar de la imagen
  And debe permitir reintentar la carga

Examples:
| INPUT |
| Última foto subida: "Cena familiar" |
| Condición: Falla de carga de la imagen |

| OUTPUT |
| Ícono mostrado: Error de carga |
| Acción disponible: Reintentar |
