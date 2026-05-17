# AiSecBox Docker Images

Este repositorio centraliza las imágenes oficiales de Docker para el ecosistema **AiSecBox**. Estas imágenes están diseñadas para ser seguras, ligeras y compatibles con múltiples arquitecturas (amd64 y arm64).

## 📁 Estructura del Repositorio

- `.github/workflows/`: Pipelines de CI/CD para la construcción y publicación automática.
- `kingfisher/`: Imagen optimizada de la herramienta de escaneo de secretos [MongoDB Kingfisher](https://github.com/mongodb/kingfisher).

## 🚀 Cómo Generar una Imagen (Manual)

Cada imagen cuenta con un script de automatización en su carpeta `scripts/build.sh`. Estos scripts utilizan `docker buildx` para generar imágenes multi-arquitectura.

### Requisitos previos
- Docker Desktop (con Buildx habilitado).
- Haber iniciado sesión en Docker Hub: `docker login -u [username]`.

### Construcción de Kingfisher
Para construir y subir la imagen de Kingfisher a Docker Hub:

1. Entra en la carpeta de la herramienta:
    `cd kingfisher`


2. Ejecuta el script indicando la versión de Kingfisher que deseas compilar (basada en las tags de su repo oficial):
    `./scripts/build.sh v1.99.0 [username]`

El script se encargará de:
- Crear un constructor multi-arch si no existe.
- Compilar para `linux/amd64` y `linux/arm64`.
- Etiquetar como `[username]/kingfisher:<version>` y `[username]/kingfisher:latest`.
- Subir (push) las imágenes y el manifiesto automáticamente a Docker Hub.

## 🤖 GitHub Actions

El repositorio está configurado con **GitHub Actions** para facilitar la gestión:

1. Ve a la pestaña **Actions** en GitHub.
2. Selecciona el workflow **Build Kingfisher Image**.
3. Haz clic en **Run workflow**.
4. Introduce la versión deseada (ej. `v1.99.0`).

> **Nota:** Requiere que los secretos `DOCKERHUB_USERNAME` y `DOCKERHUB_TOKEN` estén configurados en el repositorio.

---
Built with ❤️ by [AiSecBox Team](https://aisecbox.com)
