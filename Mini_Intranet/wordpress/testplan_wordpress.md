# Testplan – WordPress Microservice
**Projekt:** Mini-Intranet für Alpine Systems AG  
**Autorin:** Marina Tschirky  
**Rolle:** WP/MW Engineer  
**Datum:** 25. Juni 2026  

---

## 1. Einleitung

Dieser Testplan beschreibt die manuellen Tests für den WordPress-Microservice der Alpine Systems AG. Ziel ist es, die wichtigsten Funktionen und die korrekte Konfiguration zu überprüfen.

---

## 2. Testumgebung

| Komponente | Beschreibung |
|---|---|
| Betriebssystem | Windows 11 mit WSL2 (Ubuntu) |
| Containerplattform | Docker Desktop |
| WordPress URL | http://localhost:8082 |
| WordPress Version | 7.0 (latest) |
| Datenbank | MySQL 8.0 (Container: wordpress-db) |
| Browser | Microsoft Edge / Google Chrome |
| Admin-Benutzer | admin / Infinit.1234 |

---

## 3. Testfälle

### TC-WP-01 – Erreichbarkeit der WordPress-Seite
| Feld | Inhalt |
|---|---|
| **Kategorie** | Verfügbarkeit |
| **Priorität** | Hoch |
| **Vorbedingung** | Docker Container ist gestartet (docker-compose up -d) |
| **Testschritte** | Browser öffnen → URL http://localhost:8082 eingeben → Seite laden |
| **Erwartetes Ergebnis** | Die WordPress-Startseite wird korrekt angezeigt (HTTP 200) |

---

### TC-WP-02 – Anzeige des Firmenlogos
| Feld | Inhalt |
|---|---|
| **Kategorie** | Design |
| **Priorität** | Mittel |
| **Vorbedingung** | WordPress ist erreichbar, Logo wurde konfiguriert |
| **Testschritte** | Browser öffnen → URL http://localhost:8082 eingeben → Header-Bereich prüfen |
| **Erwartetes Ergebnis** | Das Alpine Systems AG Logo ist im Header sichtbar und korrekt dargestellt |

---

### TC-WP-03 – Anzeige der Tagline
| Feld | Inhalt |
|---|---|
| **Kategorie** | Design |
| **Priorität** | Mittel |
| **Vorbedingung** | WordPress ist erreichbar, Tagline wurde konfiguriert |
| **Testschritte** | Browser öffnen → URL http://localhost:8082 → Footer/Header auf Tagline prüfen |
| **Erwartetes Ergebnis** | Tagline "Wir bringen Ihre Software auf den Gipfel" ist sichtbar |

---

### TC-WP-04 – Login ins WordPress-Backend
| Feld | Inhalt |
|---|---|
| **Kategorie** | Authentifizierung |
| **Priorität** | Hoch |
| **Vorbedingung** | WordPress ist erreichbar, Admin-Benutzer ist angelegt |
| **Testschritte** | URL http://localhost:8082/wp-admin eingeben → Benutzername + Passwort eingeben → Login klicken |
| **Erwartetes Ergebnis** | Erfolgreicher Login, Dashboard wird angezeigt |

---

### TC-WP-05 – Erstellen eines Blogbeitrags
| Feld | Inhalt |
|---|---|
| **Kategorie** | Funktionalität |
| **Priorität** | Hoch |
| **Vorbedingung** | Admin-Login ist erfolgreich (TC-WP-04) |
| **Testschritte** | Dashboard → Posts → Add New → Titel eingeben → Inhalt schreiben → Publish klicken |
| **Erwartetes Ergebnis** | Beitrag wird veröffentlicht und ist auf der Startseite sichtbar |

---

### TC-WP-06 – Persistenz nach Container-Neustart
| Feld | Inhalt |
|---|---|
| **Kategorie** | Persistenz |
| **Priorität** | Hoch |
| **Vorbedingung** | Mindestens ein Blogbeitrag wurde erstellt (TC-WP-05) |
| **Testschritte** | docker-compose down ausführen → docker-compose up -d ausführen → http://localhost:8082 öffnen |
| **Erwartetes Ergebnis** | Alle vorherigen Inhalte und Einstellungen sind noch vorhanden |

---

### TC-WP-07 – Erstellen einer neuen Seite
| Feld | Inhalt |
|---|---|
| **Kategorie** | Funktionalität |
| **Priorität** | Mittel |
| **Vorbedingung** | Admin-Login ist erfolgreich (TC-WP-04) |
| **Testschritte** | Dashboard → Pages → Add New → Titel eingeben → Inhalt schreiben → Publish klicken |
| **Erwartetes Ergebnis** | Seite wird erstellt und ist über die Navigation erreichbar |

---

### TC-WP-08 – Datenbankverbindung
| Feld | Inhalt |
|---|---|
| **Kategorie** | Infrastruktur |
| **Priorität** | Hoch |
| **Vorbedingung** | Beide Container (WordPress + MySQL) sind gestartet |
| **Testschritte** | docker-compose ps ausführen → Status beider Container prüfen → WordPress-Seite laden |
| **Erwartetes Ergebnis** | Beide Container laufen, WordPress-Seite lädt ohne Datenbankfehler |

---

## 4. Abnahmekriterien

| # | Kriterium | Gewichtung |
|---|---|---|
| 1 | Alle Tests mit Priorität "Hoch" sind bestanden | Pflicht |
| 2 | Mindestens 80% aller Tests sind bestanden | Pflicht |
| 3 | Keine kritischen Fehler bei Datenbankverbindung | Pflicht |
| 4 | Logo und Tagline werden korrekt angezeigt | Empfohlen |
| 5 | Persistenz nach Container-Neustart ist gewährleistet | Pflicht |

---

## 5. Risiken

| Risiko | Wahrscheinlichkeit | Massnahme |
|---|---|---|
| Container startet nicht | Mittel | Logs prüfen: docker logs wordpress |
| Datenbankverbindung schlägt fehl | Niedrig | docker-compose down && docker-compose up -d |
| Port 8082 bereits belegt | Niedrig | Port in docker-compose.yml anpassen |
| Datenverlust nach Neustart | Niedrig | Volumes in docker-compose.yml prüfen |
