# Dockerfile for AiSecBox - MongoDB Kingfisher
# Optimization: Downloads pre-compiled binaries from GitHub Releases to avoid slow/failing Rust builds.

# Stage 1: Downloader
FROM debian:bookworm-slim AS downloader

RUN apt-get update && apt-get install -y curl tar && rm -rf /var/lib/apt/lists/*

# Arguments provided by buildx
ARG TARGETARCH
ARG KINGFISHER_VERSION=v1.99.0

WORKDIR /tmp

RUN set -ex; \
    # Map Docker arch to Kingfisher asset naming
    case "${TARGETARCH}" in \
        amd64) ARCH="x64" ;; \
        arm64) ARCH="arm64" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}"; exit 1 ;; \
    esac; \
    # Filenames for v1.99.0 are like kingfisher-linux-x64.tgz
    URL="https://github.com/mongodb/kingfisher/releases/download/${KINGFISHER_VERSION}/kingfisher-linux-${ARCH}.tgz"; \
    echo "Downloading ${URL}..."; \
    curl -fL "${URL}" -o kingfisher.tgz; \
    tar -xzf kingfisher.tgz; \
    # The binary is named 'kingfisher' inside the tgz
    mv kingfisher /usr/local/bin/kingfisher;

# Stage 2: Runtime
FROM debian:bookworm-slim

# Metadata
LABEL org.opencontainers.image.title="AiSecBox - MongoDB Kingfisher" \
      org.opencontainers.image.description="Professional secret scanning tool, built from MongoDB Kingfisher used in AiSecBox ecosystem." \
      org.opencontainers.image.vendor="AiSecBox" \
      org.opencontainers.image.source="https://github.com/ARANOVA/aisecbox-docker-images" \
      org.opencontainers.image.licenses="Apache-2.0"

# Install minimal runtime dependencies
RUN apt-get update && apt-get install -y ca-certificates libssl3 && rm -rf /var/lib/apt/lists/*

# Copy the binary from the downloader
COPY --from=downloader /usr/local/bin/kingfisher /usr/local/bin/kingfisher

RUN chmod +x /usr/local/bin/kingfisher

ENTRYPOINT ["kingfisher"]
CMD ["--help"]
