Feature: US05 - Reporte de tendencia emocional semanal
  Como hija
  Quiero ver un gráfico sencillo de los estados de ánimo de mi padre
  Para detectar si ha tenido una semana difícil o triste

Scenario: Visualización exitosa del resumen semanal
  Given que el cuidador accede a la vista de cuidador en el Dashboard
  When selecciona el filtro de "Resumen Semanal"
  Then el sistema muestra un gráfico de barras con la frecuencia de estados de ánimo registrados
Examples:
  | INPUT |
  | Filtro seleccionado: "Resumen Semanal" |
  | OUTPUT |
  | Gráfico mostrado: Sí |
  | Días con datos: 7 |

Scenario: Resumen semanal con días sin registro
  Given que el adulto mayor no registró su estado de ánimo en uno o más días de la semana
  When el cuidador visualiza el resumen semanal
  Then el sistema marca esos días como "Sin registro" en el gráfico
Examples:
  | INPUT |
  | Días sin registro: 2 |
  | OUTPUT |
  | Días marcados como "Sin registro": 2 |
  | Gráfico generado: Sí |

Scenario: Alerta visual ante predominancia de estados negativos
  Given que más del 50% de los registros de la semana corresponden a estados de ánimo negativos
  When el cuidador visualiza el resumen semanal
  Then el sistema resalta el gráfico con un indicador de atención
Examples:
  | INPUT |
  | Porcentaje de estados negativos: 60% |
  | OUTPUT |
  | Indicador de atención mostrado: Sí |
