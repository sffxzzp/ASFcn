FROM ghcr.io/justarchinet/archisteamfarm:latest
ENV ASF_USER=asf
ENV ASPNETCORE_URLS=
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV DOTNET_NOLOGO=true

RUN apt update && apt install -y curl debian-keyring debian-archive-keyring apt-transport-https libnss3-tools
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/testing/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-testing-archive-keyring.gpg
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/testing/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-testing.list
RUN apt update && apt install caddy && rm -rf /var/lib/apt/lists/*

EXPOSE 1242
WORKDIR /app
COPY Caddyfile /app/
COPY entrypoint.sh /app/

HEALTHCHECK CMD ["pidof", "-q", "ArchiSteamFarm"]
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
