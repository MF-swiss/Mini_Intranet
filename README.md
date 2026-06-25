# MINI_INTRANET – Docker Deployment

Dieses Projekt stellt ein modulares Intranet bereit, bestehend aus mehreren unabhängigen Docker‑Services.  
Jeder Service liegt in einem eigenen Ordner und kann separat gestartet, gestoppt oder erweitert werden.

Das README ist bewusst **kurz, modular und erweiterbar** gehalten.

---

# 📦 Voraussetzungen

- Docker installiert  
- Docker Compose installiert  
- Terminalzugriff

---

# 📂 Projektstruktur

MINI_INTRANET/
│
├── Mini_Intranet/
│   ├── portainer/
│   └── redmine/
├── deploy.sh
└── ports.md

git pu
---

# 🔧 Allgemeine Docker-Befehle

Starten:

```bash
docker compose up -d
Stoppen:

bash
docker compose down
Reset (inkl. Volumes):

bash
docker compose down -v
Status prüfen:

bash
docker ps
1) Portainer
Pfad: Mini_Intranet/portainer/  
Zweck: Docker Management UI

Starten:

bash
docker compose up -d
Zugriff:

http://localhost:9000

https://localhost:9443

Volume:

portainer_data – speichert Konfiguration & Benutzer

2) Redmine
Pfad: Mini_Intranet/redmine/  
Zweck: Projektmanagement & Ticketsystem

Starten:

bash
docker compose up -d
Zugriff:

http://localhost:8080

Standard‑Login:

admin / admin

Datenbank:

Host: redmine-db

User: rmuser

Passwort: rmpass

Volumes:

redmine_data – Dateien

redmine_db_data – MariaDB Daten