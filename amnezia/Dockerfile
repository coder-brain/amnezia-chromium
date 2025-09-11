FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV XRAY_VERSION=1.8.6

# Install runtime & GUI dependencies
RUN apt-get update && apt-get install -y \
    curl unzip tar iproute2 iptables ca-certificates \
    # DBus
    libdbus-1-3 dbus-x11 \
    # Fonts & rendering
    libfontconfig1 libfreetype6 \
    # OpenGL
    libgl1-mesa-glx libopengl0 \
    # Core X11
    libx11-6 libxext6 libxrandr2 libxrender1 \
    libxi6 libxtst6 libxfixes3 \
    # XCB base + extensions commonly needed by Qt
    libxcb1 libxcb-shm0 libxcb-icccm4 libxcb-image0 \
    libxcb-keysyms1 libxcb-render-util0 libxcb-shape0 \
    libxcb-util1 libxcb-xinerama0 libxcb-cursor0 \
    libxkbcommon0 libxkbcommon-x11-0 \
    # Audio & NSS
    libasound2 libnss3 libxshmfence1 \
    # Misc
    libglib2.0-0 \
    # Qt6 runtime
    libqt6core6 libqt6gui6 libqt6widgets6 \
    libqt6qml6 libqt6network6 libqt6dbus6 \
    libqt6quick6 libqt6quickcontrols2-6 \
    libqt6core5compat6 libqt6remoteobjects6
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip \
    && mkdir -p /usr/local/bin/xray \
    && unzip /tmp/xray.zip -d /usr/local/bin/xray \
    && rm /tmp/xray.zip \
    && chmod +x /usr/local/bin/xray/xray
ENV PATH="/usr/local/bin/xray:$PATH"
RUN rm -rf /var/lib/apt/lists/*



 COPY cache/AmneziaVPN_4.8.9.2_linux_x64.tar.zip /tmp/amnezia.tar.zip
# Download and extract installer
# RUN curl -L -o /tmp/amnezia.tar.zip \
#    # https://github.com/amnezia-vpn/amnezia-client/releases/download/4.8.9.2/AmneziaVPN_4.8.9.2_linux_x64.tar.zip

RUN unzip /tmp/amnezia.tar.zip -d /tmp \
    && tar -xf /tmp/AmneziaVPN_Linux_Installer.tar -C /tmp \
    && chmod +x /tmp/AmneziaVPN_Linux_Installer.bin \
    && ldd /tmp/AmneziaVPN_Linux_Installer.bin | grep "not found" || true \
    && /tmp/AmneziaVPN_Linux_Installer.bin \
         --al --am --confirm-command \
         -t /opt/AmneziaVPN install \
    && rm -rf /tmp/Amnezia*

COPY entrypoint.sh /entrypoint.sh
# Default command: run Amnezia GUI
ENTRYPOINT ["/entrypoint.sh"]
