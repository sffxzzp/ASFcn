echo '127.0.0.1 steamcommunity.com www.steamcommunity.com' >> /etc/hosts
caddy start --config /app/Caddyfile
bash /app/ArchiSteamFarm-Service.sh --no-restart --process-required --system-required
