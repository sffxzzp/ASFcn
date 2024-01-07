echo '127.0.0.1 steamcommunity.com www.steamcommunity.com store.steampowered.com' >> /etc/hosts
if [ ! -f "/app/config/IPC.config" ]; then
    echo '{"Kestrel":{"Endpoints":{"HTTP":{"Url":"http://*:1242"}}}}' >> /app/config/IPC.config
fi
if [ ! -f "/app/config/ASF.json" ]; then
    echo '{"IPCPassword":"asfcnasfcn"}' >> /app/config/ASF.json
fi
caddy start --config /app/Caddyfile
bash /app/ArchiSteamFarm-Service.sh --no-restart --process-required --system-required
