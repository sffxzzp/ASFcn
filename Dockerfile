FROM ghcr.io/justarchinet/archisteamfarm:latest
ENV ASF_USER asf
ENV ASPNETCORE_URLS=
ENV DOTNET_CLI_TELEMETRY_OPTOUT true
ENV DOTNET_NOLOGO true

RUN apt update && apt install -y curl debian-keyring debian-archive-keyring apt-transport-https
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt update && apt install caddy && rm -rf /var/lib/apt/lists/*

EXPOSE 1242
WORKDIR /app
COPY Caddyfile /app/
COPY entrypoint.sh /app/

HEALTHCHECK CMD ["pidof", "-q", "dotnet"]
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]