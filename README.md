# MINI_INTRANET – Docker Deployment

Dieses Projekt stellt ein kleines Intranet bereit, bestehend aus mehreren Services, die über Docker Compose betrieben werden.  
Aktuell enthalten:

- **Portainer** – Web‑UI zur Verwaltung von Docker
- **Redmine** – Projektmanagement & Ticketing
- (Optional vorbereitet: WordPress, MediaWiki)

---

## 📦 Voraussetzungen

- Docker installiert  
- Docker Compose installiert  
- Terminalzugriff  
- Linux, macOS oder Windows mit WSL2

---

# 1) Portainer – Installation & Betrieb

Portainer dient als grafische Oberfläche zur Verwaltung deiner Docker‑Umgebung.

## 🚀 Starten

Im Ordner `Mini_Intranet/portainer/` ausführen:

```bash
docker compose up -d
