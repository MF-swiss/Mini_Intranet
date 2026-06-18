# 347-08A – SideQuest Aufgabe

## 01 Einführung

### HANOK und Lernziele
HANOKs: 1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 3.2, 4.1, 4.2, 4.3, 5.1, 5.2, 5.3

- Kennt die wichtigsten Grundlagen, Eigenschaften und Methoden von Container-Technologien.
- Kennt die Anforderungen des Betriebes auf Bandbreite, Hardware, Instanzen und Skalierbarkeit.
- Kennt Architekturformen und deren Einsatz für Containerlösungen.
- Kennt Chancen und Risiken der Containerisierung.
- Kennt Anforderungen an Netzwerk und Security.
- Kennt Anwendungsmöglichkeiten von Containern und Services.
- Kennt Orchestration Frameworks wie Docker und Kubernetes.
- Kennt globale Anbieter von Container-Repositories und Plattformen.
- Kennt Vorteile containerbasierter Architekturen.
- Kennt Konfigurations- und Sicherheitskonzepte.
- Kennt Entwicklungsschritte zur Virtualisierung mit Containern.
- Kennt Methoden zur Qualitätssicherung und Qualitätskontrolle.

### Einführung LP
Durchgehen des Projektauftrages mit den Lernenden.

---   

## 02 Aufgabe / Quest

### Ausgangslage
Ihr habt im Laufe des Moduls gelernt, wie man Applikationen in der Cloud betreiben und verwalten kann. Dieses Wissen soll in einem umfassenden Projekt angewendet werden.

### Ziel
Am Ende des Projektes sollen folgende Produkte vorliegen:

- Konfigurationsfiles für:
  - Wordpress
  - MediaWiki
  - Jira
- Applikationen mit Persistenz in einer Cloud-Umgebung
- Umfassende Projektdokumentation
- Präsentation der Ergebnisse

### Rahmenbedingungen
- Umsetzung mit Docker und/oder Kubernetes
- Drittsoftware nur nach Genehmigung der Lehrperson

### Zeit
- 8 × 45 Minuten Unterrichtszeit
- Projekt in Zweiergruppen
- Internetquellen und Hilfestellungen dokumentieren

### Abgabeform

```text
LB-Projekt-M347_Nachname1-Nachname2.zip
│
├── Projektdokumentation.pdf
├── Präsentation.pdf
└── Projekt/
    └── alle Sourcen & Config-Files
```

Der Inhalt des Ordners Projekt soll ohne Anpassungen deploybar sein.

### Empfohlene Technologien
- Docker
- Kubernetes
- Git

---

## Projektdokumentation

### Infrastruktur
Visuelle Dokumentation der Infrastruktur (z.B. draw.io).

### Konfiguration
Dokumentation aller Konfigurationen.

### Testplan
Beschreibung der manuellen Tests sowie Dokumentation der Resultate.

### Installationsanleitung
Kurze Anleitung für die Lehrperson inklusive Benutzer, Passwörter und notwendiger Skripte.

### Hilfestellungen
Dokumentation aller verwendeten Quellen und Unterstützungen.

---

## Systemanforderungen

| Anforderung | Beschreibung |
|------------|-------------|
| Installation Hands-off | Automatisierte Installation |
| Komponenten | Wordpress, MediaWiki und Jira lauffähig |

---

## Präsentation

| Anforderung | Beschreibung |
|------------|-------------|
| Dauer | 10 Minuten |
| Infrastruktur | Schematische Darstellung |
| Softwarekomponenten | Kurze Vorstellung |
| Deployment | Darstellung des Ablaufs |

---

## Bewertungskriterien

### A: Allgemein (6 Punkte)

- Arbeiten vollständig nach Vorgaben
- Vollständige Abgabe
- Positiver Gesamteindruck

### B: Projektdokumentation (22 Punkte)

- PDF-Dokumentation vorhanden
- Testkonzept und Testprotokoll für:
  - Wordpress
  - Jira
  - MediaWiki
  - Portainer Monitoring
- Persönliches Arbeitsjournal je Gruppenmitglied
- Persönliches Fazit je Gruppenmitglied

### C: System (16 Punkte)

- Docker-Compose vollständig und fehlerfrei für:
  - Wordpress
  - Jira
  - MediaWiki
  - Portainer

### D: Präsentation (6 Punkte)

- PDF-Präsentation vorhanden
- Dauer 10 Minuten
- Infrastruktur übersichtlich dargestellt

### Notenberechnung

```text
(Erreichte Punkte * 5 / Maximalpunkte) + 1
```
