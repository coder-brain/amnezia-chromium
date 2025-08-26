FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install runtime & GUI dependencies
RUN apt-get update && apt-get install -y \
    curl unzip iproute2 iptables ca-certificates \
    libxcb-xinerama0 libxcb-cursor0 libgl1-mesa-glx \
    libx11-6 libxext6 libxcb1 libxrandr2 libxrender1 libxi6 libxtst6 libxfixes3 \
    && rm -rf /var/lib/apt/lists/*

# Download and extract Amnezia GUI client
RUN curl -L -o /tmp/amnezia.tar.zip \
    https://github.com/amnezia-vpn/amnezia-client/releases/download/4.8.9.2/AmneziaVPN_4.8.9.2_linux_x64.tar.zip \
    && unzip /tmp/amnezia.tar.zip -d /opt/amnezia \
    && rm /tmp/amnezia.tar.zip

# Optional: adjust binary permissions
RUN chmod +x /opt/amnezia/AmneziaVPN

# Copy user configuration into container
COPY config.json /etc/amnezia/config.json

# Run the full GUI client
CMD ["/opt/amnezia/AmneziaVPN", "--config", "/etc/amnezia/config.json"]