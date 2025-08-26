# chromium/Dockerfile
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# System deps + Chromium + common runtime libs
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    chromium \
    fonts-liberation \
    xdg-utils \
    libnss3 \
    libxss1 \
    libasound2 \
    libgbm1 \
    libgtk-3-0 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libx11-xcb1 \
    libxcomposite1 \
    libxrandr2 \
    libxdamage1 \
    libxtst6 \
    && rm -rf /var/lib/apt/lists/*

# If you need a non-root user, you can add one — but for X11 via /tmp/.X11-unix
# root is simplest. We rely on --no-sandbox.
#
# USER chrome

# Default command: launch Chromium (Debian binary is `chromium`, not `chromium-browser`)
CMD ["chromium", "--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu"]