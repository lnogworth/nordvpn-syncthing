# Use a lightweight base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    gnupg2 \
    lsb-release \
    ca-certificates \
    software-properties-common

# Install NordVPN
RUN curl -sSL https://downloads.nordcdn.com/apps/linux/install.sh | sh -n

# Install Syncthing
RUN curl -s https://syncthing.net/release-key.txt | apt-key add -
RUN echo "deb https://apt.syncthing.net/ syncthing stable" > /etc/apt/sources.list.d/syncthing.list
RUN apt-get update && apt-get install -y syncthing

# Copy the startup script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose Syncthing Web UI port
EXPOSE 8384

# Set the entrypoint to the startup script
ENTRYPOINT ["/usr/local/bin/start.sh"]