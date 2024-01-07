echo '127.0.0.1 steamcommunity.com www.steamcommunity.com store.steampowered.com' >> /etc/hosts
echo '{"Kestrel":{"Endpoints":{"HTTP":{"Url":"http://*:1242"}}}}' >> /app/config/IPC.config
caddy start --config /app/Caddyfile
bash /app/ArchiSteamFarm-Service.sh --no-restart --process-required --system-required
