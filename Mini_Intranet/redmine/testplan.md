# 🧪 Testplan – Redmine

Dieser Testplan beschreibt die manuellen Tests zur Überprüfung der Funktionalität von **Redmine** innerhalb des Mini‑Intranet‑Projekts.

---

## 1. Testumgebung

| Komponente   | Version / Info              |
|--------------|-----------------------------|
| System       | Linux / macOS / WSL2        |
| Browser      | Chrome / Firefox            |
| Redmine URL  | http://localhost:8080       |
| Docker       | Docker Engine + Compose     |

---

## 2. Testziele

- Sicherstellen, dass Redmine korrekt startet  
- Überprüfung der Kernfunktionen: Login, Projekte, Tickets  
- Dokumentation der Testergebnisse  

---

## 3. Testfälle

### **TC‑RM‑01 – Redmine Startseite erreichbar**

| Kriterium              | Beschreibung                                 |
|------------------------|----------------------------------------------|
| **Ziel**               | Prüfen, ob Redmine erreichbar ist            |
| **Schritte**           | 1. Browser öffnen<br>2. URL: http://localhost:8080 |
| **Erwartetes Ergebnis**| Login‑Seite erscheint                        |
| **Resultat**           | ☐ Bestanden ☐ Fehlgeschlagen                |

---

### **TC‑RM‑02 – Login durchführen**

| Kriterium              | Beschreibung                                 |
|------------------------|----------------------------------------------|
| **Ziel**               | Testen des Logins                            |
| **Schritte**           | 1. Login‑Maske öffnen<br>2. Benutzername & Passwort eingeben |
| **Erwartetes Ergebnis**| Dashboard erscheint                          |
| **Resultat**           | ☐ Bestanden ☐ Fehlgeschlagen                |

---

### **TC‑RM‑03 – Projekt erstellen**

| Kriterium              | Beschreibung                                 |
|------------------------|----------------------------------------------|
| **Ziel**               | Sicherstellen, dass Projekte erstellt werden können |
| **Schritte**           | 1. „Projects“ öffnen<br>2. „New Project“ klicken<br>3. Name eingeben<br>4. Speichern |
| **Erwartetes Ergebnis**| Projekt erscheint in der Liste               |
| **Resultat**           | ☐ Bestanden ☐ Fehlgeschlagen                |

---

### **TC‑RM‑04 – Ticket erstellen**

| Kriterium              | Beschreibung                                 |
|------------------------|----------------------------------------------|
| **Ziel**               | Testen der Ticketfunktion                    |
| **Schritte**           | 1. Projekt öffnen<br>2. „New Issue“ klicken<br>3. Felder ausfüllen<br>4. Speichern |
| **Erwartetes Ergebnis**| Ticket wird angezeigt                        |
| **Resultat**           | ☐ Bestanden ☐ Fehlgeschlagen                |

---

### **TC‑RM‑05 – Ticket bearbeiten**

| Kriterium              | Beschreibung                                 |
|------------------------|----------------------------------------------|
| **Ziel**               | Prüfen, ob Tickets bearbeitet werden können  |
| **Schritte**           | 1. Ticket öffnen<br>2. „Edit“ klicken<br>3. Änderungen speichern |
| **Erwartetes Ergebnis**| Änderungen werden übernommen                 |
| **Resultat**           | ☐ Bestanden ☐ Fehlgeschlagen                |

---

## 4. Abschlussbewertung

| Bereich  | Status                       |
|----------|------------------------------|
| Redmine  | ☐ Erfolgreich ☐ Fehler      |

---

## 5. Screenshots

Bitte folgende Screenshots einfügen:

- Login‑Seite  
- Projektübersicht  
- Ticketübersicht  
- Ticketbearbeitung  

---

## 6. Fazit

Die grundlegenden Funktionen von Redmine wurden getestet und dokumentiert.
