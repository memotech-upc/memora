Feature: US05 - Sección Cómo Funciona del Landing Page
  Como visitante del Landing Page
  Quiero ver el proceso de adopción de Memora en pasos simples
  Para entender que iniciar a usar la aplicación no requiere conocimientos técnicos

Scenario: Visualización de los tres pasos del proceso
  Given que el visitante hace scroll hasta la sección "Tres pasos para que tu familiar nunca olvide quién es"
  When la sección entra en el viewport
  Then el sistema muestra los pasos numerados: "1. Creás la cuenta familiar", "2. Tu familiar graba su primer video" y "3. Cada mañana, Memora lo acompaña"
  And cada paso muestra un número, un ícono y una descripción
Examples:
  | INPUT |
  | Acción: Scroll hasta sección "Cómo funciona" |
  | OUTPUT |
  | Pasos mostrados: 3 |
  | Línea conectora visible: Sí |

Scenario: Visualización de la línea conectora entre pasos en desktop
  Given que el visitante se encuentra en una pantalla de escritorio
  When la sección "Cómo funciona" se renderiza
  Then el sistema muestra una línea horizontal que conecta los círculos numerados de los tres pasos
Examples:
  | INPUT |
  | Dispositivo: Desktop (>1024px) |
  | OUTPUT |
  | Línea conectora visible: Sí |
  | Posición: Centrada entre los números |

Scenario: Adaptación de los pasos en mobile
  Given que el visitante accede desde un dispositivo móvil
  When la sección "Cómo funciona" se renderiza
  Then los tres pasos se reorganizan en una sola columna apilada verticalmente
  And la línea conectora horizontal se oculta
Examples:
  | INPUT |
  | Dispositivo: Mobile (375px) |
  | OUTPUT |
  | Columnas mostradas: 1 |
  | Línea conectora visible: No |
