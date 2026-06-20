Feature: US05 - Reporte de tendencia emocional semanal
  Como hija
  Quiero ver un gráfico sencillo de los estados de ánimo de mi padre
  Para detectar si ha tenido una semana difícil o triste

Scenario: La hija visualiza el resumen semanal del estado de ánimo de su padre
  Given que la hija accede a la vista de cuidador en el Dashboard
  When selecciona el filtro de "Resumen Semanal"
  Then el sistema muestra un gráfico de barras
  And refleja la frecuencia de estados de ánimo registrados por Héctor

Examples:
| INPUT |
| Filtro seleccionado: "Resumen Semanal" |
| Registros disponibles: Lunes a domingo |

| OUTPUT |
| Gráfico mostrado: Barras por estado de ánimo |
| Datos: Frecuencia de cada estado en la semana |


Scenario: La hija consulta el resumen semanal sin registros disponibles
  Given que Héctor no registró ningún estado de ánimo durante la semana
  When la hija selecciona el filtro de "Resumen Semanal"
  Then el sistema no debe mostrar el gráfico de barras
  And debe mostrar el mensaje "No hay datos disponibles esta semana"

Examples:
| INPUT |
| Filtro seleccionado: "Resumen Semanal" |
| Registros disponibles: 0 |

| OUTPUT |
| Mensaje: "No hay datos disponibles esta semana" |


Scenario: La hija intenta seleccionar un rango de fechas futuro
  Given que la hija se encuentra en la vista de cuidador del Dashboard
  When selecciona un rango de fechas posterior a la fecha actual
  Then el sistema no debe permitir la selección
  And debe mostrar el mensaje "No puedes consultar fechas futuras"

Examples:
| INPUT |
| Rango seleccionado: Semana siguiente a la actual |

| OUTPUT |
| Mensaje de error: "No puedes consultar fechas futuras" |


Scenario: El sistema falla al cargar el gráfico de tendencia emocional
  Given que la hija selecciona el filtro de "Resumen Semanal"
  When ocurre un error al cargar los datos del servidor
  Then el sistema no debe mostrar el gráfico
  And debe mostrar el mensaje "No se pudo cargar el reporte, inténtalo nuevamente"

Examples:
| INPUT |
| Filtro seleccionado: "Resumen Semanal" |
| Condición: Error de conexión con el servidor |

| OUTPUT |
| Mensaje de error: "No se pudo cargar el reporte, inténtalo nuevamente" |
