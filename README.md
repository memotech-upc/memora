# Memora — Tu identidad visual

![Status](https://img.shields.io/badge/status-en%20desarrollo-blue)
![License](https://img.shields.io/badge/license-academic-lightgrey)

## 📋 Sobre el proyecto

**Memora** es una aplicación móvil de reminiscencia activa diseñada para ayudar a adultos mayores en etapa preventiva de deterioro cognitivo leve a preservar su identidad personal y reforzar su memoria episódica mediante el registro audiovisual diario de sus vivencias.

La solución combina un módulo de validación obligatoria —donde el usuario visualiza el video del día anterior antes de iniciar su jornada— con un canal de comunicación simplificado para sus familiares y cuidadores, quienes pueden monitorear su bienestar emocional sin invadir su privacidad.

Este repositorio contiene la implementación del **Landing Page** del producto, desarrollado como parte del curso de Interacción Humano-Computadora y Tecnologías Móviles (IHC) en la Universidad Peruana de Ciencias Aplicadas (UPC).

## 🚀 Demo

🔗 **Landing Page en producción:** [https://[ORG].github.io/[REPO]/](https://[ORG].github.io/[REPO]/)

## 👥 Equipo — MemoTech

| Integrante | Código |
|---|---|
| Cardenas Olivera, Fabio Javier | U202315047 |
| Damacen Galindo, Italo Gianfranco | U202421392 |
| Huerta Araujo, Josue Miguel | U202422930 |
| Nicho Huillcañahui, Edwin Noe | U20241G306 |
| Pinto Zelada, Shalom | U202519563 |
| Sayago Vidal, Sebastián Leonardo | U202422642 |

## 🎯 Segmentos objetivo

### Segmento 1 — Adultos mayores en etapa preventiva
Personas de 60 a 75 años que mantienen su autonomía funcional pero han comenzado a experimentar episodios de olvido cotidiano. Usuarios de smartphones que prefieren interfaces visuales y directas, con poca tolerancia a la fatiga cognitiva derivada de interfaces complejas o basadas en texto.

### Segmento 2 — Familiares y cuidadores directos
Hijos, hijas o nietos con competencias digitales fluidas que, por motivos laborales o personales, no cohabitan permanentemente con el adulto mayor. Buscan soluciones de monitoreo no invasivo que les permitan conocer el estado emocional de su familiar sin necesidad de supervisión constante.

## ✨ Características principales

- **Sistema de Registro Visual Guiado** — sustituye el teclado por grabación de video y selección de etiquetas iconográficas, eliminando la barrera de la fatiga cognitiva.
- **Validación diaria de identidad** — el usuario debe visualizar el video del día anterior como requisito de acceso, reforzando la continuidad de su memoria episódica.
- **Línea de tiempo de reminiscencia** — biblioteca cronológica de recuerdos en video que el usuario puede explorar de forma autónoma.
- **Dashboard de acompañamiento para el cuidador** — permite monitorear la constancia de uso y el estado emocional reportado sin invadir la privacidad del usuario.
- **Canal de interacción emocional simplificada** — envío de reacciones y audios cortos entre el cuidador y el adulto mayor como refuerzo positivo.
- **Diseño inclusivo y accesible** — interfaz con iconografía de gran tamaño, alto contraste y áreas táctiles mínimas de 48x48dp, adaptada a las capacidades visuales y motrices del público objetivo.

## 🛠️ Stack tecnológico

- **HTML5 / CSS3 / JavaScript** — implementación del Landing Page
- **Figma** — wireframes, mock-ups, wireflow diagrams y prototipos de la app móvil
- **GitHub Pages** — despliegue y publicación del sitio
- **Git / GitFlow** — control de versiones y flujo de trabajo colaborativo

## 📂 Estructura del proyecto

```
memora-landing-page/
├── README.md
└── public/
    ├── index.html
    ├── favicon.ico
    └── assets/
        ├── styles/
        │   └── styles.css
        ├── images/
        └── scripts/
            └── main.js
```

## 🌳 Flujo de trabajo (GitFlow)

Este proyecto sigue el modelo [GitFlow](https://nvie.com/posts/a-successful-git-branching-model/) de Vincent Driessen:

- `main` — rama de producción, solo versiones estables.
- `develop` — rama de integración del desarrollo activo.
- `feature/<nombre>` — una rama por funcionalidad, creada a partir de `develop`.
- `release/<versión>` — preparación de una nueva versión siguiendo [Semantic Versioning](https://semver.org/).
- `hotfix/<descripción>` — correcciones urgentes sobre `main`.

Los mensajes de commit siguen el estándar [Conventional Commits](https://www.conventionalcommits.org/).

## 📄 Licencia

Proyecto académico desarrollado para el curso de IHC y Tecnologías Móviles — UPC, 2026.
