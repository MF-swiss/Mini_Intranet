# 🧪 Testplan – Portainer

Dieser Testplan beschreibt die manuellen Tests zur Überprüfung der Funktionalität von **Portainer** innerhalb des Mini‑Intranet‑Projekts.

---

## 1. Testumgebung

| Komponente       | Version / Info                |
|------------------|-------------------------------|
| System           | Linux / macOS / WSL2          |
| Browser          | Chrome / Firefox              |
| Portainer URL    | http://localhost:9000         |
| Docker           | Docker Engine + Compose       |

---

## 2. Testziele

- Sicherstellen, dass Portainer korrekt startet  
- Überprüfung der Kernfunktionen: Login, Container‑Übersicht, Logs, Stats  
- Dokumentation der Testergebnisse  

---

## 3. Testfälle

### **TC‑PT‑01 – Portainer Startseite erreichbar**

| Kriterium          | Beschreibung                                       |
|--------------------|----------------------------------------------------|
| **Ziel**           | Prüfen, ob Portainer erreichbar ist                |
| **Schritte**       | 1. Browser öffnen<br>2. URL: http://localhost:9000 |
| **Erwartetes Ergebnis** | Login‑Seite erscheint                        |
| **Resultat**       | ☐ Bestanden ☐ Fehlgeschlagen                      |

---

### **TC‑PT‑02 – Admin‑Login**

| Kriterium          | Beschreibung                                       |
|--------------------|----------------------------------------------------|
| **Ziel**           | Testen des Logins                                  |
| **Schritte**       | 1. Login‑Maske öffnen<br>2. Admin‑Benutzer eingeben |
| **Erwartetes Ergebnis** | Dashboard erscheint                           |
| **Resultat**       | ☐ Bestanden ☐ Fehlgeschlagen                      |

---

### **TC‑PT‑03 – Container‑Übersicht anzeigen**

| Kriterium          | Beschreibung                                       |
|--------------------|----------------------------------------------------|
| **Ziel**           | Prüfen, ob Container sichtbar sind                 |
| **Schritte**       | 1. Menü → Containers<br>2. Liste prüfen            |
| **Erwartetes Ergebnis** | Alle Mini‑Intranet‑Container werden angezeigt |
| **Resultat**       | ☐ Bestanden ☐ Fehlgeschlagen                      |

---

### **TC‑PT‑04 – Container Logs anzeigen**

| Kriterium          | Beschreibung                                       |
|--------------------|----------------------------------------------------|
| **Ziel**           | Sicherstellen, dass Logs abrufbar sind             |
| **Schritte**       | 1. Container auswählen<br>2. Tab „Logs“ öffnen     |
| **Erwartetes Ergebnis** | Logs werden angezeigt                         |
| **Resultat**       | ☐ Bestanden ☐ Fehlgeschlagen                      |

---

### **TC‑PT‑05 – Container Stats prüfen**

| Kriterium          | Beschreibung                                       |
|--------------------|----------------------------------------------------|
| **Ziel**           | Testen der Monitoring‑Funktion                     |
| **Schritte**       | 1. Container öffnen<br>2. Tab „Stats“ öffnen       |
| **Erwartetes Ergebnis** | CPU/RAM/Netzwerk‑Statistiken werden angezeigt |
| **Resultat**       | ☐ Bestanden ☐ Fehlgeschlagen                      |

---

## 4. Abschlussbewertung

| Bereich    | Status                       |
|------------|------------------------------|
| Portainer  | ☐ Erfolgreich ☐ Fehler      |

---

## 5. Screenshots

Bitte folgende Screenshots einfügen:

- Login‑Seite  
- Dashboard  
- Container‑Liste  
- Logs‑Ansicht  
- Stats‑Ansicht  

---

## 6. Fazit

Die grundlegenden Funktionen von Portainer wurden getestet und dokumentiert.
