#!/bin/bash
set -e

# ROOTDIR = Verzeichnis, in dem dieses Skript liegt (enthält ports.md, README.md, etc.)
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# BASEDIR = Unterordner, in dem die eigentlichen Service-Ordner liegen
# (wordpress/, mediawiki/, redmine/, portainer/)
BASEDIR="$ROOTDIR/Mini_Intranet"
PORTS_FILE="$ROOTDIR/ports.md"

# Liste der Unterordner mit docker-compose.yml
SERVICES=("wordpress" "mediawiki" "redmine" "portainer")

if [ ! -d "$BASEDIR" ]; then
    echo "FEHLER: Unterordner 'Mini_Intranet' nicht gefunden unter $BASEDIR"
    exit 1
fi

echo "==> Starte Deployment aller Docker-Compose Services..."

for SERVICE in "${SERVICES[@]}"; do
    COMPOSE_FILE="$BASEDIR/$SERVICE/docker-compose.yml"

    if [ -f "$COMPOSE_FILE" ]; then
        echo ""
        echo "==> [$SERVICE] docker-compose.yml gefunden, starte Container..."
        (cd "$BASEDIR/$SERVICE" && docker compose up -d)
        echo "==> [$SERVICE] erfolgreich gestartet."
    else
        echo "==> [$SERVICE] WARNUNG: Keine docker-compose.yml gefunden unter $COMPOSE_FILE, übersprungen."
    fi
done

echo ""
echo "==> Alle Services abgearbeitet."
echo ""
echo "Installation abgeschlossen!"
echo ""
echo "Dienste erreichbar unter:"

if [ -f "$PORTS_FILE" ]; then
    grep -E ':[0-9]+.*→' "$PORTS_FILE" | while read -r LINE; do
        PORT=$(echo "$LINE" | grep -oE ':[0-9]+' | head -1 | tr -d ':')
        NAME=$(echo "$LINE" | sed -E 's/.*→\s*//' | tr -d '\r')

        # Wenn der Dienst Portainer ist → HTTPS verwenden
        if echo "$NAME" | grep -qi "portainer"; then
            printf "   %-12s https://localhost:%s\n" "$NAME:" "$PORT"
        else
            printf "   %-12s http://localhost:%s\n" "$NAME:" "$PORT"
        fi
    done
else
    echo "   WARNUNG: ports.md nicht gefunden unter $PORTS_FILE"
fi