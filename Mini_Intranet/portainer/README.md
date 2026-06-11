# Portainer – AlpineSystems AG

## Zweck
Portainer dient als Monitoring- und Verwaltungsoberfläche für alle Docker-Container.

## Zugriff
- URL: http://localhost:9000
- Admin-User wird beim ersten Start im Browser eingerichtet.

## Persistenz
Die Daten werden im Volume `portainer_data` gespeichert:
- Pfad im Container: /data

## Besonderheit
Portainer greift über `/var/run/docker.sock` direkt auf den Docker-Daemon zu.
