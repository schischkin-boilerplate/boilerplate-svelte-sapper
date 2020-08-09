#!sh

echo "Adapting Caddyfile.."
caddy adapt --config /caddy/Caddyfile

echo "Starting web application.."
node index.js
