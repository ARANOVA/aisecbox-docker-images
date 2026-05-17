# AiSecBox - MongoDB Kingfisher

![AiSecBox](https://raw.githubusercontent.com/ARANOVA/aisecbox-docker-images/main/kingfisher/docs/assets/banner.png)

Professional secret scanning tool for developers, powered by [MongoDB Kingfisher](https://github.com/mongodb/kingfisher). This image is part of the **AiSecBox** ecosystem, designed to provide high-performance, SIMD-accelerated secret detection in any environment.

## 🚀 Key Features

- **Multi-Arch Support:** Optimized for both `amd64` and `arm64` (Intel/AMD and Apple Silicon/ARM).
- **Supply-Chain Secure:** Built directly from verified GitHub release binaries.
- **Fast & Lightweight:** Based on Debian Slim with minimal dependencies.
- **AiSecBox Integrated:** Designed to work seamlessly with `aisecbox-cli`.

## 🛠️ Usage

### Basic Scan
Scan the current directory for secrets:

```bash
docker run --rm -v "$(pwd)":/src aisecbox/kingfisher:latest scan /src
```

### With JSON Output
Generate a machine-readable report:

```bash
docker run --rm -v "$(pwd)":/src aisecbox/kingfisher:latest scan /src --format json
```

## ⚖️ License

This distribution is licensed under the Apache License 2.0. Kingfisher is an open-source project by MongoDB.

---
Built with ❤️ by [AiSecBox Team](https://aisecbox.com)
