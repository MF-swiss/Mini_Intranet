# Marco – Jira & Portainer Anleitung
Mini_Intranet – AlpineSystems AG  
Rolle: Jira & Portainer Engineer

Diese Anleitung beschreibt, wie ich meine beiden Microservices (Jira & Portainer) im Projekt starte, einrichte und teste.

---

## 📁 Ordnerstruktur (mein Bereich)

```
Mini_Intranet/
├── jira/
│   └── docker-compose.yml
├── portainer/
│   └── docker-compose.yml
├── deploy.sh
└── README.md
```

Ich arbeite nur in:
- `jira/docker-compose.yml`
- `portainer/docker-compose.yml`
- `deploy.sh` (2 Zeilen)
- README‑Abschnitte für Jira & Portainer

---

# 1. Jira starten

## 1.1 In den Jira‑Ordner wechseln
```bash
cd Mini_Intranet/jira
```

## 1.2 Jira Container starten
```bash
docker compose up -d
```

## 1.3 Jira im Browser öffnen
```
http://localhost:8080
```

## 1.4 Jira einrichten
- Admin‑Benutzer erstellen  
- Sprache & Einstellungen bestätigen  

## 1.5 Beispielprojekt erstellen
- „Create Project"
- Template: **Kanban**
- Name: **AlpineCore**
- Key: **AC**

## 1.6 Beispiel‑Tickets anlegen
- „WordPress Logo einfügen"
- „MediaWiki Kategorien erstellen"
- „Portainer Monitoring testen"

Screenshots für Testprotokoll machen.

---

# 2. Portainer starten

## 2.1 In den Portainer‑Ordner wechseln
```bash
cd ../portainer
```

## 2.2 Portainer Container starten
```bash
docker compose up -d
```

## 2.3 Portainer im Browser öffnen
```
https://localhost:9443
```

## 2.4 Portainer einrichten
- Admin‑Benutzer erstellen  
- „Local Environment" auswählen  

## 2.5 Monitoring öffnen
- Menü → Containers  
- Container auswählen (z. B. `jira`)  
- Tabs: **Stats**, **Logs**

Screenshots für Testprotokoll machen.

---

# 3. Services stoppen
(Jeweils im richtigen Ordner)

```bash
docker compose down
```

---

# 4. Automatischer Start (deploy.sh)

Im Hauptordner:

```bash
cd ..
./deploy.sh
```

Startet:
- WordPress  
- MediaWiki  
- Jira  
- Portainer  

automatisch.

---

# 5. Fertig

Damit habe ich:
- Jira vollständig eingerichtet  
- Portainer vollständig eingerichtet  
- Beispielprojekt + Tickets erstellt  
- Monitoring aktiviert  
- Screenshots für Testprotokolle erstellt  

Ich kann meinen Teil autonom starten, testen und dokumentieren.