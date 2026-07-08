# MINI_INTRANET – Docker Deployment

Dieses Projekt stellt ein modulares Intranet für die **Alpine Systems AG** bereit, bestehend aus mehreren unabhängigen Docker-Services.  
Jeder Service liegt in einem eigenen Ordner und kann separat gestartet, gestoppt oder erweitert werden.

Das README ist bewusst **kurz, modular und erweiterbar** gehalten.

---

# 📦 Voraussetzungen

- Docker Desktop installiert und gestartet
- WSL2 (Ubuntu) aktiviert
- Docker Compose installiert
- Git installiert
- Terminalzugriff (Ubuntu WSL Terminal empfohlen)

---

# 📂 Projektstruktur

MINI_INTRANET/
│
├── Mini_Intranet/
│   ├── portainer/          # Docker Management UI (Marco)
│   ├── redmine/            # Projektmanagement (Marco)
│   ├── wordpress/          # Firmenhomepage (Marina)
│   └── mediawiki/          # Internes Wiki (Marina)
├── deploy.sh
├── ports.md
├── anleitung_deploy.md
├── Projektdokumentation.pdf
├── Präsentation.pdf
└── README.md

---

## 🌐 Service-Übersicht

|  Service  | URL                    | Zuständig |
|-----------|------------------------|-----------|
| Portainer | https://localhost:9443 | Marco     |
| Redmine   | http://localhost:8080  | Marco     |
| WordPress | http://localhost:8082  | Marina    |
| MediaWiki | http://localhost:8083  | Marina    |

---
## 🔧 Allgemeine Docker-Befehle

Starten:
```bash
docker compose up -d
```

Stoppen:
```bash
docker compose down
```

Reset (inkl. Volumes):
```bash
docker compose down -v
```

Status prüfen:
```bash
docker ps
```

---

## 1) Portainer
**Pfad:** `Mini_Intranet/portainer/`  
**Zweck:** Docker Management UI

Starten:
```bash
cd Mini_Intranet/portainer
docker compose up -d
```

**Zugriff:**
- https://localhost:9443

**Volume:**
- `portainer_data` – speichert Konfiguration & Benutzer

---

## 2) Redmine
**Pfad:** `Mini_Intranet/redmine/`  
**Zweck:** Projektmanagement & Ticketsystem

Starten:
```bash
cd Mini_Intranet/redmine
docker compose up -d
```

**Zugriff:**
- http://localhost:8080

**Standard-Login:**
| Feld         | Wert  |
|--------------|-------|
| Benutzername | admin |
| Passwort     | admin |

**Datenbank:**
| Feld     | Wert       |
|----------|------------|
| Host     | redmine-db |
| Benutzer | rmuser     |
| Passwort | rmpass     |

**Volumes:**
- `redmine_data` – Dateien
- `redmine_db_data` – MariaDB Daten

---

## 3) WordPress
**Pfad:** `Mini_Intranet/wordpress/`  
**Zweck:** Firmenhomepage & Blog der Alpine Systems AG

Starten:
```bash
cd Mini_Intranet/wordpress
docker compose up -d
```

**Zugriff:**
- http://localhost:8082

**Login-Daten:**
| Feld         | Wert                           |
|--------------|--------------------------------|
| Admin URL    | http://localhost:8082/wp-admin |
| Benutzername | admin                          |
| Passwort     | Infinit.1234                   |
| E-Mail       | admin@alpinesystems.ch         |

**Datenbank:**
| Feld      | Wert         |
|-----------|--------------|
| Container | wordpress-db |
| Datenbank | wordpress    |
| Benutzer  | wordpress    |
| Passwort  | wordpress123 |

**Volumes:**
- `wordpress_data` – WordPress Dateien
- `wordpress_db_data` – MySQL Daten

---

## 4) MediaWiki
**Pfad:** `mediawiki/`  
**Zweck:** Internes Wissens-Wiki der Alpine Systems AG

Starten:
```bash
cd mediawiki
docker compose up -d
```

**Zugriff:**
- http://localhost:8083

**Login-Daten:**
| Feld         | Wert                   |
|--------------|------------------------|
| Benutzername | admin                  |
| Passwort     | Admin12345!            |
| E-Mail       | admin@alpinesystems.ch |

**Datenbank:**
| Feld      | Wert         |
|-----------|--------------|
| Container | mediawiki-db |
| Datenbank | mediawiki    |
| Benutzer  | mediawiki    |
| Passwort  | mediawiki123 |

**Volumes:**
- `mediawiki_data` – Wiki Dateien
- `mediawiki_db_data` – MySQL Daten

---

## 🔐 Alle Login-Daten auf einen Blick

| Service   | URL                            | Benutzername | Passwort                   |
|-----------|--------------------------------|--------------|----------------------------|
| WordPress | http://localhost:8082/wp-admin | admin        | Infinit.1234               |
| MediaWiki | http://localhost:8083          | admin        | Admin12345!                |
| Redmine   | http://localhost:8080          | admin        | admin                      |
| Portainer | http://localhost:9000          | admin        | (beim ersten Start setzen) |

---

## ❓ Fehlerbehebung

| Problem                             | Lösung                                                |
|-------------------------------------|-------------------------------------------------------|
| `docker-compose: command not found` | Docker Desktop starten → WSL Integration aktivieren   |
| Container startet nicht             | `docker logs <containername>` ausführen               |
| Port bereits belegt                 | Port in `docker-compose.yml` anpassen                 |
| WSL Integration fehler              | Docker Desktop → Settings → WSL Integration → Restart |
| Seite nicht erreichbar              | `docker ps` prüfen ob Container Status "Up" hat       |