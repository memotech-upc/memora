Feature: US09 - Sincronización instantánea de métricas
  Como hija (familiar-cuidador)
  Quiero que el Dashboard se actualice sin refrescar la app
  Para tener información veraz al instante

Scenario: El Dashboard de la hija se actualiza automáticamente al recibir un cambio
  Given que la hija tiene la sección Dashboard abierta en su móvil
  When Héctor realiza un cambio en su tablet
  Then los datos en la pantalla de la hija cambian automáticamente
  And la actualización ocurre mediante sincronización en la nube

Examples:
| INPUT |
| Cambio realizado por Héctor: Nuevo estado de ánimo registrado |
| Pantalla de la hija: Dashboard abierto |

| OUTPUT |
| Dashboard de la hija: Actualizado automáticamente |
| Método: Sincronización en la nube |


Scenario: El dispositivo de la hija pierde la conexión a internet
  Given que la hija tiene la sección Dashboard abierta sin conexión a internet
  When Héctor realiza un cambio en su tablet
  Then el sistema no debe sincronizar los datos en tiempo real
  And debe mostrar el indicador "Sin conexión"

Examples:
| INPUT |
| Cambio realizado por Héctor: Nueva foto vista en la Biblioteca |
| Conexión de la hija: Sin internet |

| OUTPUT |
| Dashboard de la hija: No actualizado |
| Indicador mostrado: "Sin conexión" |


Scenario: Se recupera la conexión luego de una pérdida temporal de sincronización
  Given que el dispositivo de la hija recuperó la conexión a internet
  When existían cambios pendientes de sincronizar
  Then el sistema debe actualizar el Dashboard con los últimos datos disponibles
  And debe ocultar el indicador "Sin conexión"

Examples:
| INPUT |
| Cambios pendientes: 2 (estado de ánimo, progreso diario) |
| Conexión recuperada: Sí |

| OUTPUT |
| Dashboard de la hija: Actualizado con los últimos datos |
| Indicador "Sin conexión": Oculto |
