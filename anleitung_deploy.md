# Anleitung: deploy.sh

Dieses Skript startet alle Docker-Compose Services des Mini_Intranet Projekts
(WordPress, MediaWiki, Redmine, Portainer) automatisch mit einem einzigen Befehl.

## Was das Skript macht

1. Geht die Ordner `wordpress`, `mediawiki`, `redmine` und `portainer` durch.
2. Führt in jedem Ordner mit vorhandener `docker-compose.yml` den Befehl
   `docker compose up -d` aus (Container starten im Hintergrund).
3. Liest am Ende `ports.md` aus und zeigt dir eine Übersicht mit den
   Aufruf-URLs aller gestarteten Dienste an.

## Voraussetzungen

- Docker und Docker Compose müssen installiert sein (`docker compose version`
  zum Prüfen).
- Das Skript muss im **Hauptordner** von `Mini_Intranet` liegen, auf gleicher
  Ebene wie die Unterordner `wordpress/`, `mediawiki/`, `redmine/`,
  `portainer/` sowie die Datei `ports.md`.
- Jeder Unterordner braucht eine gültige `docker-compose.yml`.

## Ausführung

1. Terminal im Projektordner `Mini_Intranet` öffnen.
2. Falls noch nicht ausführbar, einmalig Rechte setzen:
   ```bash
   chmod +x deploy.sh
   ```
3. Skript starten:
   ```bash
   ./deploy.sh
   ```

## Beispiel-Ausgabe

```
==> Starte Deployment aller Docker-Compose Services...

==> [wordpress] docker-compose.yml gefunden, starte Container...
==> [wordpress] erfolgreich gestartet.

==> [mediawiki] docker-compose.yml gefunden, starte Container...
==> [mediawiki] erfolgreich gestartet.

==> [redmine] docker-compose.yml gefunden, starte Container...
==> [redmine] erfolgreich gestartet.

==> [portainer] docker-compose.yml gefunden, starte Container...
==> [portainer] erfolgreich gestartet.

==> Alle Services abgearbeitet.

Installation abgeschlossen!

Dienste erreichbar unter:
   Redmine:     http://localhost:8080
   Portainer:   http://localhost:9443
   WordPress:   http://localhost:8082
   MediaWiki:   http://localhost:8083
```

## Hinweise

- Fehlt in einem Ordner die `docker-compose.yml`, wird nur eine Warnung
  ausgegeben und die restlichen Services werden trotzdem gestartet.
- Die angezeigten URLs stammen direkt aus `ports.md`. Wenn sich ein Port
  ändert, reicht es, ihn in `ports.md` **und** in der jeweiligen
  `docker-compose.yml` anzupassen.
- Zum Stoppen aller Container (nicht Teil dieses Skripts) kannst du in jedem
  Ordner einzeln `docker compose down` ausführen.