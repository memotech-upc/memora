Feature: US09 - Sincronización instantánea de métricas
  Como hija (familiar-cuidador)
  Quiero que el Dashboard se actualice sin refrescar la app
  Para tener información veraz al instante

Scenario: Sincronización exitosa de un cambio en tiempo real
  Given que la hija tiene la sección Dashboard abierta en su móvil
  When el padre realiza un cambio en su tablet (ej. registra su estado de ánimo)
  Then los datos en la pantalla de la hija cambian automáticamente mediante sincronización en la nube
Examples:
  | INPUT |
  | Cambio realizado por: Héctor |
  | Acción: Registro de estado de ánimo |
  | OUTPUT |
  | Dashboard actualizado sin refresh manual: Sí |
  | Tiempo de sincronización: <5 segundos |

Scenario: Sincronización diferida por pérdida de conexión
  Given que el dispositivo de la hija pierde conexión temporalmente
  When el padre realiza una acción durante ese periodo
  Then el sistema almacena el cambio en cola
  And lo sincroniza al recuperar la hija la conexión
Examples:
  | INPUT |
  | Estado de conexión de la hija: Sin internet |
  | OUTPUT |
  | Cambios en cola: Sí |
  | Sincronización al reconectar: Sí |

Scenario: Indicador visual de estado de sincronización
  Given que el Dashboard está abierto
  When ocurre cualquier sincronización exitosa
  Then el sistema muestra un indicador breve de "Sincronizado hace instantes"
Examples:
  | INPUT |
  | Evento: Sincronización completada |
  | OUTPUT |
  | Indicador mostrado: "Sincronizado hace instantes" |
