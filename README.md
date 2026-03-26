# Pharmazon24 – Leistungs-Dashboard

Modernes Leistungs-Tracking-Dashboard für die monatliche Verwaltung von Inhalts- und Medialeistungen mit Passwortschutz, Zusatzleistungen-Management und Sound-Effekten.

## 🚀 Features

### Core Features
- **20 Bilder** – KI-generierte oder designte Visuals
- **10 Infografiken** – Banner, Grafiken, One-Page-Flyer
- **5 Videos** – 3 kurze (1-2 Sequenzen) + 2 längere (3-5 Sequenzen)
- **4 Carousel-Posts** – Je 6 zusammenhängende Slides
- **Monatliche Verwaltung** – Navigation zwischen Monaten
- **Zusätzliche Leistungen Tracking** – Anzeige von Überschreitungen

### Neu in v2.0
- **Dual-View Architektur**
  - 🔓 **View-Mode**: Öffentlich ohne Passwort (nur Lesezugriff)
  - 🔐 **Edit-Mode**: Mit Passwort geschützt (Bearbeitung aktiviert)
- **Passwortschutz**
  - Session-Management mit 24h TTL
  - Logout-Funktion im Header
- **Zusatzleistungen Preiskatalog**
  - 10 zusätzliche Bilder: 450€
  - 5 zusätzliche Infografiken: 350€
  - 2 kurze Videos: 600€
  - 1 längeres Video: 900€
  - 1 Carousel-Post: 200€
- **Sound Effects** 🔊
  - Click-Sound beim Hinzufügen (+)
  - Click-Sound beim Entfernen (−)
- **Keyboard Shortcuts**
  - `Alt+→` – Nächster Monat
  - `Alt+←` – Vorheriger Monat
- **CSV-Export** – Monatliche Daten exportieren

## 📋 Setup

### Option 1: Lokal (Development)
```bash
# Repository klonen
git clone https://github.com/database-niu-era/pharmazon24-dashboard.git
cd pharmazon24-dashboard

# Einfach im Browser öffnen
open index.html

# Oder mit lokalem Server
python -m http.server 8000
# Dann http://localhost:8000 im Browser öffnen
```

### Option 2: GitHub Pages (Production)
Das Repository ist bereits für GitHub Pages konfiguriert!

**Nach dem ersten Push wird das Dashboard automatisch veröffentlicht unter:**
```
https://database-niu-era.github.io/pharmazon24-dashboard
```

**Setup-Schritte:**
1. GitHub → Settings → Pages
2. Source: `main` branch
3. Nach ~60 Sekunden live!

## 🔐 Passwort-Verwaltung

### View-Mode (Öffentlich)
```
URL: https://database-niu-era.github.io/pharmazon24-dashboard/?mode=view
```
- ✅ Alle Daten sichtbar
- ❌ Keine Bearbeitungs-Buttons
- ❌ Keine Zusatzleistungen-Verwaltung

### Edit-Mode (Geschützt)
```
URL: https://database-niu-era.github.io/pharmazon24-dashboard/?mode=edit
```
- Passwort-Dialog wird angezeigt
- **Passwort**: `ILoveYouTheMost.3105`
- Session läuft 24h (dann Auto-Logout)
- Logout-Button im Header

## 💾 Datenspeicherung

Alle Daten werden **lokal im Browser** gespeichert (localStorage):

```javascript
// Struktur:
{
    "pharmazon24_dashboard": {
        "2026-03": { bilder: 15, infografiken: 8, ... },
        "2026-02": { bilder: 20, infografiken: 10, ... }
    },
    "pharmazon24_session_token": {
        "token": "auth_...",
        "timestamp": 1711430400000
    }
}
```

**Automatisches Backup:**
- Daten werden nach jeder Änderung gespeichert
- CSV-Export für externe Backups verfügbar

## 🎵 Sound Effects

Sound-Effekte werden über Web Audio API generiert (keine externen Dateien):

- **Add-Sound**: 800Hz für 150ms (aufsteigend)
- **Remove-Sound**: 400Hz für 120ms (fallend)

Funktioniert in allen modernen Browsern. Bei Fehler: Silent-Mode.

## 📊 CSV-Export

- Button: "Export CSV" im Header
- Dateiname: `Pharmazon24_Leistungen_2026-03.csv`
- Enthält: Alle Kategorien, Werte, Maxima, Prozentsätze

## 🛠 Technologie-Stack

- **Frontend**: Vanilla JavaScript (keine Dependencies!)
- **Styling**: Inline CSS mit CSS-Variablen
- **Datenspeicherung**: Browser localStorage
- **Hosting**: GitHub Pages (kostenlos)
- **Sicherheit**: Client-seitige Session-Management

## 📝 Verwendung

### Leistungen hinzufügen/entfernen (Edit-Mode nur)
1. `?mode=edit` URL öffnen
2. Passwort eingeben
3. Buttons nutzen um Werte zu ändern
4. Sounds spielen automatisch ab
5. Daten werden automatisch gespeichert

### Zusatzleistungen verwenden
1. Dropdown unter "Zusatzleistungen hinzufügen" öffnen
2. Service auswählen
3. Automatisch zur Monatszahl hinzugefügt
4. Im "Zusätzliche Leistungen" Card unter Überschreitungen sichtbar
5. Mit "✕" Button entfernen

### Monatsverwaltung
- Pfeile im Header: Monat navigieren
- Alle Daten werden pro Monat gespeichert
- Verschiedene Monate = verschiedene Daten

## 🔒 Sicherheit

**Was ist geschützt:**
- ✅ Bearbeitungs-Funktionalität (Passwort)
- ✅ Session Management (24h TTL)
- ✅ localStorage Isolation (pro Domain)

**Was nicht geschützt:**
- ⚠️ Passwort ist im Frontend-Code sichtbar (Client-seitig)
- ⚠️ Daten können mit Browser DevTools bearbeitet werden
- ⚠️ Für echte Sicherheit: Backend-API + Server-Auth nötig

## 🚀 Deployment auf GitHub Pages

```bash
# 1. Remote konfigurieren (einmalig)
git remote add origin https://github.com/database-niu-era/pharmazon24-dashboard.git

# 2. Branch umbenennen (falls nötig)
git branch -M main

# 3. Push
git push -u origin main

# 4. GitHub Settings → Pages → Source: main branch

# Nach Änderungen:
git add index.html
git commit -m "Update: Beschreibung der Änderung"
git push origin main
# → Live nach ~60 Sekunden
```

## 📞 Support & Troubleshooting

### Passwort-Dialog erscheint nicht
- URL muss `?mode=edit` enthalten
- Browser-Cache löschen (Ctrl+Shift+Delete)
- Konsole öffnen (F12) und prüfen auf Fehler

### Sounds funktionieren nicht
- Browser-Audio muss aktiviert sein
- Versuch mit anderem Browser
- Silent-Mode wird automatisch aktiviert

### Daten sind weg
- localStorage wurde geleert
- Verschiedener Browser/Gerät als zuvor
- Inkognito-Modus speichert nicht permanent

### GitHub Pages nicht erreichbar
- Settings → Pages prüfen
- Branch muss `main` sein
- Nach ~5 Minuten neu laden

## 📄 Lizenz & Copyright

© 2026 Pharmazon24 GmbH – Leistungs-Dashboard

---

**Aktuelle Version:** 2.0 (März 2026)
**Autor:** Pharmazon24 Development Team
