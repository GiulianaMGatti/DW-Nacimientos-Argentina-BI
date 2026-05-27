# Arquitectura de Datos y Dashboard Analítico sobre Nacimientos en Argentina (2005–2022)

## 📌 Descripción del Proyecto

Este proyecto fue desarrollado como trabajo integrador dentro de la Diplomatura en Bases de Datos de la UTN (Universidad Tecnológica Nacional).

El objetivo principal consistió en diseñar una solución integral de análisis de datos aplicada al estudio de los nacimientos registrados en la República Argentina durante el período 2005–2022, utilizando herramientas de ETL, modelado dimensional, SQL y Business Intelligence.

A partir de datos abiertos del Ministerio de Salud de la Nación Argentina, se construyó un Data Warehouse orientado al análisis multidimensional de indicadores demográficos, sociales y sanitarios.

---

# 🎯 Objetivos

- Diseñar un proceso ETL para limpieza y transformación de datos.
- Construir un modelo dimensional tipo estrella (Star Schema).
- Implementar un Data Warehouse en SQL Server.
- Crear métricas analíticas mediante SQL y DAX.
- Desarrollar dashboards interactivos en Power BI.
- Analizar relaciones entre variables:
  - edad materna,
  - nivel educativo,
  - maternidad adolescente,
  - prematuridad,
  - bajo peso al nacer,
  - distribución territorial.

---

# 🛠️ Tecnologías Utilizadas

| Herramienta | Uso |
|---|---|
| Python (Pandas) | ETL y limpieza de datos |
| SQL Server | Data Warehouse |
| SQL | Consultas y modelado |
| Power BI | Dashboard y visualización |
| DAX | KPIs y métricas analíticas |
| GitHub | Versionado y publicación |

---

# 🧱 Arquitectura del Proyecto

## Flujo de trabajo

```text
Datos abiertos (CSV)
        ↓
ETL en Python (Pandas)
        ↓
Transformación y limpieza
        ↓
Carga en SQL Server
        ↓
Modelo Estrella (Data Warehouse)
        ↓
Consultas SQL + Medidas DAX
        ↓
Dashboard interactivo en Power BI
```

---

# 📂 Estructura del Repositorio

```text
Proyecto-Nacimientos-Argentina-BI/
│
├── data/
├── python/
├── sql/
├── dashboard/
├── docs/
├── screenshots/
└── README.md
```

---

# 👩‍💻 Autor

## Giuliana Mandrini Gatti

Proyecto realizado en el marco de la Diplomatura en Bases de Datos – UTN.

