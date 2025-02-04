echo '127.0.0.1 steamcommunity.com www.steamcommunity.com store.steampowered.com api.steampowered.com github.com' >> /etc/hosts
if [ ! -f "/app/config/IPC.config" ]; then
    echo '{"Kestrel":{"Endpoints":{"HTTP":{"Url":"http://*:1242"}}}}' >> /app/config/IPC.config
fi
if [ ! -f "/app/config/ASF.json" ]; then
    echo '{"IPCPassword":"asfcnasfcn","UpdateChannel": 0,"UpdatePeriod": 0,"Statistics": false}' >> /app/config/ASF.json
fi
caddy start --config /app/Caddyfile
bash /asf/ArchiSteamFarm-Service.sh --no-restart --system-required
