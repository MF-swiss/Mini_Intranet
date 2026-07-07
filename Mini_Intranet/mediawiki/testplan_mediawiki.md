# Testplan – MediaWiki Microservice
**Projekt:** Mini-Intranet für Alpine Systems AG  
**Autorin:** Marina Tschirky  
**Rolle:** WP/MW Engineer  
**Datum:** 25. Juni 2026  

---

## 1. Einleitung

Dieser Testplan beschreibt die manuellen Tests für den MediaWiki-Microservice der Alpine Systems AG. Ziel ist es, die wichtigsten Funktionen und die korrekte Konfiguration zu überprüfen.

---

## 2. Testumgebung

| Komponente | Beschreibung |
|---|---|
| Betriebssystem | Windows 11 mit WSL2 (Ubuntu) |
| Containerplattform | Docker Desktop |
| MediaWiki URL | http://localhost:8083 |
| MediaWiki Version | latest |
| Datenbank | MySQL 8.0 (Container: mediawiki-db) |
| Admin-Benutzer | admin / Admin12345! |
| Browser | Microsoft Edge / Google Chrome |

---

## 3. Testfälle

### TC-MW-01 – Erreichbarkeit der MediaWiki-Seite
| Feld | Inhalt |
|---|---|
| **Kategorie** | Verfügbarkeit |
| **Priorität** | Hoch |
| **Vorbedingung** | Docker Container ist gestartet (docker-compose up -d) |
| **Testschritte** | Browser öffnen → URL http://localhost:8083 eingeben → Seite laden |
| **Erwartetes Ergebnis** | Die MediaWiki-Hauptseite wird korrekt angezeigt (HTTP 200) |

---

### TC-MW-02 – Anzeige des Firmenlogos
| Feld | Inhalt |
|---|---|
| **Kategorie** | Design |
| **Priorität** | Mittel |
| **Vorbedingung** | MediaWiki ist erreichbar, Logo wurde konfiguriert |
| **Testschritte** | Browser öffnen → URL http://localhost:8083 eingeben → Logo oben links prüfen |
| **Erwartetes Ergebnis** | Das Alpine Systems AG Logo ist oben links sichtbar und korrekt dargestellt |

---

### TC-MW-03 – Login als Admin
| Feld | Inhalt |
|---|---|
| **Kategorie** | Authentifizierung |
| **Priorität** | Hoch |
| **Vorbedingung** | MediaWiki ist erreichbar, Admin-Benutzer ist angelegt |
| **Testschritte** | Log in klicken → admin / Admin12345! eingeben → Login klicken |
| **Erwartetes Ergebnis** | Erfolgreicher Login, Benutzer "admin" oben rechts sichtbar |

---

### TC-MW-04 – Wiki-Seite erstellen
| Feld | Inhalt |
|---|---|
| **Kategorie** | Funktionalität |
| **Priorität** | Hoch |
| **Vorbedingung** | Admin-Login ist erfolgreich (TC-MW-03) |
| **Testschritte** | URL http://localhost:8083/index.php?title=Onboarding&action=edit öffnen → Inhalt eingeben → Save changes klicken |
| **Erwartetes Ergebnis** | Seite wird gespeichert und der Inhalt wird korrekt angezeigt |

---

### TC-MW-05 – Wiki-Seite bearbeiten
| Feld | Inhalt |
|---|---|
| **Kategorie** | Funktionalität |
| **Priorität** | Mittel |
| **Vorbedingung** | Eine Wiki-Seite ist vorhanden (TC-MW-04) |
| **Testschritte** | Bestehende Seite öffnen → Edit klicken → Text ändern → Save changes klicken |
| **Erwartetes Ergebnis** | Änderungen werden gespeichert und korrekt angezeigt |

---

### TC-MW-06 – Suche nach Wiki-Inhalten
| Feld | Inhalt |
|---|---|
| **Kategorie** | Funktionalität |
| **Priorität** | Mittel |
| **Vorbedingung** | Mindestens eine Wiki-Seite mit Inhalt ist vorhanden |
| **Testschritte** | Suchfeld oben rechts verwenden → Begriff eingeben → Suche starten |
| **Erwartetes Ergebnis** | Suchergebnisse werden angezeigt, die gesuchte Seite erscheint in den Resultaten |

---

### TC-MW-07 – Persistenz nach Container-Neustart
| Feld | Inhalt |
|---|---|
| **Kategorie** | Persistenz |
| **Priorität** | Hoch |
| **Vorbedingung** | Mindestens eine Wiki-Seite ist vorhanden (TC-MW-04) |
| **Testschritte** | docker-compose down ausführen → docker-compose up -d ausführen → http://localhost:8083 öffnen |
| **Erwartetes Ergebnis** | Alle Wiki-Seiten und Inhalte sind nach dem Neustart noch vorhanden |

---

### TC-MW-08 – Datenbankverbindung
| Feld | Inhalt |
|---|---|
| **Kategorie** | Infrastruktur |
| **Priorität** | Hoch |
| **Vorbedingung** | Beide Container (MediaWiki + MySQL) sind gestartet |
| **Testschritte** | docker-compose ps ausführen → Status beider Container prüfen → MediaWiki-Seite laden |
| **Erwartetes Ergebnis** | Beide Container laufen, MediaWiki lädt ohne Datenbankfehler |

---

## 4. Abnahmekriterien

| # | Kriterium | Gewichtung |
|---|---|---|
| 1 | Alle Tests mit Priorität "Hoch" sind bestanden | Pflicht |
| 2 | Mindestens 80% aller Tests sind bestanden | Pflicht |
| 3 | Keine kritischen Fehler bei Datenbankverbindung | Pflicht |
| 4 | Logo ist korrekt konfiguriert und sichtbar | Pflicht |
| 5 | Persistenz nach Container-Neustart ist gewährleistet | Pflicht |

---

## 5. Risiken

| Risiko | Wahrscheinlichkeit | Massnahme |
|---|---|---|
| Container startet nicht | Mittel | Logs prüfen: docker logs mediawiki |
| Datenbankverbindung schlägt fehl | Niedrig | docker-compose down && docker-compose up -d |
| Port 8083 bereits belegt | Niedrig | Port in docker-compose.yml anpassen |
| LocalSettings.php fehlt | Niedrig | Datei aus Repository wiederherstellen |
