
# Tag 15 Aufgabe: Log-Analysator und Berichtsgenerator

## Herausforderungs-Titel: Log-Analysator und Berichtsgenerator

## Szenario

Du bist Systemadministrator und für die Verwaltung eines Netzwerks von Servern verantwortlich. Täglich wird auf jedem Server eine Protokolldatei generiert, die wichtige Systemereignisse und Fehlermeldungen enthält. Im Rahmen deiner täglichen Aufgaben musst du diese Protokolldateien analysieren, bestimmte Ereignisse identifizieren und einen zusammenfassenden Bericht erstellen.

## Aufgabe

Schreibe ein Bash-Skript, das den Prozess der Analyse von Protokolldateien und der Erstellung eines täglichen Übersichtsberichts automatisiert. Das Skript sollte die folgenden Schritte ausführen:

1. **Eingabe:** Das Skript soll den Pfad zur Protokolldatei als Kommandozeilenargument entgegennehmen.

2. **Fehleranzahl:** Analysiere die Protokolldatei und zähle die Anzahl der Fehlermeldungen. Eine Fehlermeldung kann durch ein bestimmtes Schlüsselwort identifiziert werden (z. B. „ERROR“ oder „Failed“). Gib die Gesamtanzahl der Fehler aus.

3. **Kritische Ereignisse:** Suche nach Zeilen, die das Schlüsselwort „CRITICAL“ enthalten, und gib diese Zeilen zusammen mit der Zeilennummer aus.

4. **Häufigste Fehlermeldungen:** Identifiziere die 5 häufigsten Fehlermeldungen und gib sie zusammen mit ihrer Häufigkeit aus.

5. **Zusammenfassender Bericht:** Erstelle einen zusammenfassenden Bericht in einer separaten Textdatei. 
Der Bericht soll Folgendes enthalten:

   * Datum der Analyse
   * Name der Protokolldatei
   * Anzahl der verarbeiteten Zeilen
   * Gesamtanzahl der Fehler
   * Die 5 häufigsten Fehlermeldungen mit Häufigkeit
   * Liste der kritischen Ereignisse mit Zeilennummern:

6. **Optionale Erweiterung:** Füge eine Funktion hinzu, um die analysierten Protokolldateien nach der Auswertung automatisch zu archivieren oder in ein bestimmtes Verzeichnis zu verschieben.

## Tipps

* Verwende `grep`, `awk` und andere Kommandozeilen-Tools zur Verarbeitung der Protokolldatei.
* Nutze Arrays oder assoziative Arrays, um Fehlermeldungen und deren Anzahl zu erfassen.
* Setze geeignete Fehlerbehandlung ein, um Fälle zu behandeln, in denen die Protokolldatei nicht existiert oder andere Probleme auftreten.



Beispielskript.


**Bash-Skript**:

```bash
#!/bin/bash

# === Konfiguration ===
ARCHIV_DIR="./archiv" # Zielverzeichnis für archivierte Logdateien
REPORT_FILE="log_bericht_$(date +%Y-%m-%d).txt"

# === Überprüfung der Eingabe ===
if [ $# -ne 1 ]; then
    echo "Benutzung: $0 /pfad/zur/logdatei.log"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Fehler: Datei '$LOGFILE' existiert nicht."
    exit 1
fi

# === Analyse ===
echo "Analysiere Datei: $LOGFILE"
TOTAL_LINES=$(wc -l < "$LOGFILE")
ERROR_COUNT=$(grep -Ei "error|failed" "$LOGFILE" | wc -l)
CRITICAL_EVENTS=$(grep -ni "CRITICAL" "$LOGFILE")

# === Top 5 Fehlermeldungen ===
TOP_ERRORS=$(grep -Ei "error|failed" "$LOGFILE" | \
             sed -E 's/.*(ERROR|Failed)[:]?[ ]?//' | \
             sort | uniq -c | sort -nr | head -n 5)

# === Bericht schreiben ===
{
    echo "==== Zusammenfassender Log-Bericht ===="
    echo "Datum der Analyse: $(date)"
    echo "Logdatei: $LOGFILE"
    echo "Anzahl verarbeiteter Zeilen: $TOTAL_LINES"
    echo "Anzahl Fehler (ERROR/Failed): $ERROR_COUNT"
    echo ""
    echo "---- Top 5 Fehlermeldungen ----"
    echo "$TOP_ERRORS"
    echo ""
    echo "---- Kritische Ereignisse (CRITICAL) ----"
    if [ -z "$CRITICAL_EVENTS" ]; then
        echo "Keine kritischen Ereignisse gefunden."
    else
        echo "$CRITICAL_EVENTS"
    fi
    echo "========================================"
} > "$REPORT_FILE"

echo "Bericht wurde erstellt: $REPORT_FILE"

# === Optional: Archivieren ===
mkdir -p "$ARCHIV_DIR"
mv "$LOGFILE" "$ARCHIV_DIR/" && echo "Logdatei wurde nach '$ARCHIV_DIR' verschoben."

exit 0
```

---

### 🔧 Voraussetzungen

* Speichere dieses Skript z. B. als `log_analysator.sh`.
* Mach es ausführbar:

  ```bash
  chmod +x log_analysator.sh
  ```
* Führe es aus:

  ```bash
  ./log_analysator.sh /pfad/zur/deiner/logdatei.log
  ```

---

Wenn du ein Beispiel für eine Logdatei zum Testen brauchst, kann ich dir auch eine erzeugen. Sag einfach Bescheid!


Natürlich! Hier ist ein Beispielinhalt für eine **Test-Logdatei**, mit verschiedenen Arten von Nachrichten (INFO, ERROR, CRITICAL, usw.), die du zum Testen deines Skripts verwenden kannst.

---

### 📄 Beispielinhalt für `beispiel_log.log`

```log
2025-06-09 08:12:01 INFO Starting system check...
2025-06-09 08:12:03 ERROR Failed to start network service
2025-06-09 08:12:04 WARNING Disk space low on /dev/sda1
2025-06-09 08:12:05 INFO Checking configuration files
2025-06-09 08:12:06 CRITICAL System temperature too high
2025-06-09 08:12:07 ERROR Failed to read configuration file
2025-06-09 08:12:09 INFO Configuration valid
2025-06-09 08:12:10 ERROR Connection timeout while accessing database
2025-06-09 08:12:11 INFO Restarting services
2025-06-09 08:12:12 CRITICAL Kernel panic - not syncing
2025-06-09 08:12:13 INFO System reboot scheduled
2025-06-09 08:12:14 ERROR Failed to initialize hardware monitor
2025-06-09 08:12:15 ERROR Failed to start network service
2025-06-09 08:12:16 CRITICAL RAID array degraded
2025-06-09 08:12:17 INFO System shutdown complete
```

---

### 💾 So speicherst du die Datei

Du kannst sie mit einem einfachen Befehl auf der Kommandozeile erstellen:

```bash
cat > beispiel_log.log << 'EOF'
2025-06-09 08:12:01 INFO Starting system check...
2025-06-09 08:12:03 ERROR Failed to start network service
2025-06-09 08:12:04 WARNING Disk space low on /dev/sda1
2025-06-09 08:12:05 INFO Checking configuration files
2025-06-09 08:12:06 CRITICAL System temperature too high
2025-06-09 08:12:07 ERROR Failed to read configuration file
2025-06-09 08:12:09 INFO Configuration valid
2025-06-09 08:12:10 ERROR Connection timeout while accessing database
2025-06-09 08:12:11 INFO Restarting services
2025-06-09 08:12:12 CRITICAL Kernel panic - not syncing
2025-06-09 08:12:13 INFO System reboot scheduled
2025-06-09 08:12:14 ERROR Failed to initialize hardware monitor
2025-06-09 08:12:15 ERROR Failed to start network service
2025-06-09 08:12:16 CRITICAL RAID array degraded
2025-06-09 08:12:17 INFO System shutdown complete
EOF
```

### Beispiel-Protokolldatei

Eine Beispiel-Protokolldatei mit dem Namen beispiel_log.log befindet sich im selben Verzeichnis wie diese Challenge-Datei. Du kannst diese Datei verwenden, um dein Skript zu testen – oder diese Datei nutzen.

### So nimmst du teil

Klone dieses Repository oder lade die Challenge-Datei über den bereitgestellten Link herunter.

Schreibe dein Bash-Skript, um die Aufgabe „Log-Analysator und Berichtsgenerator“ zu erfüllen.

Verwende die bereitgestellte beispiel_log.log oder erstelle eigene Logdateien zum Testen.

Teste dein Skript mit verschiedenen Logdateien und Szenarien, um die Genauigkeit sicherzustellen.




