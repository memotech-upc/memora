Feature: US-LP03 - Sección Problema del Landing Page
  Como visitante del Landing Page (familiar o cuidador)
  Quiero identificar situaciones cotidianas relacionadas con el olvido de mi familiar
  Para reconocer que Memora aborda un problema que también vivo en casa

Scenario: Visualización de las tarjetas de problemática
  Given que el visitante hace scroll hasta la sección "¿Reconocés alguna de estas situaciones?"
  When la sección entra en el viewport
  Then el sistema muestra tres tarjetas: "La llamada repetida de todos los días", "La frustración de no recordar" y "No podés estar siempre presente"
  And cada tarjeta presenta un ícono, una descripción y una cita testimonial
Examples:
  | INPUT |
  | Acción: Scroll hasta sección "Problema" |
  | OUTPUT |
  | Tarjetas mostradas: 3 |
  | Citas testimoniales visibles: 3 |

Scenario: Animación de aparición de las tarjetas (scroll reveal)
  Given que las tarjetas de problemática inicialmente tienen opacidad 0
  When el usuario hace scroll y la tarjeta entra en el viewport (umbral 10%)
  Then el sistema anima la tarjeta a opacidad 1 con desplazamiento vertical hacia su posición final
Examples:
  | INPUT |
  | Umbral de intersección: 0.1 |
  | Elemento: .pain-card |
  | OUTPUT |
  | Opacidad final: 1 |
  | Transform final: translateY(0) |

Scenario: Adaptación de las tarjetas en mobile
  Given que el visitante accede desde un dispositivo móvil
  When la sección "Problema" se renderiza
  Then las tres tarjetas se reorganizan en una sola columna apiladas verticalmente
Examples:
  | INPUT |
  | Dispositivo: Mobile (375px) |
  | OUTPUT |
  | Columnas mostradas: 1 |
  | Tarjetas visibles: 3 (apiladas) |
