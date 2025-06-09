# Tag 15 Lösung: Log-Analysator und Berichtsgenerator (Log Analyzer and Report Generator)

## Scenario

Du bist Systemadministrator und für die Verwaltung eines Netzwerks von Servern verantwortlich. Täglich wird auf jedem Server eine Protokolldatei generiert, die wichtige Systemereignisse und Fehlermeldungen enthält. Im Rahmen deiner täglichen Aufgaben musst du diese Protokolldateien analysieren, bestimmte Ereignisse identifizieren und einen zusammenfassenden Bericht erstellen.

## Aufgabe
Schreibe ein Bash-Skript, das den Prozess der Analyse von Protokolldateien und der Erstellung eines täglichen Übersichtsberichts automatisiert. Das Skript sollte die folgenden Schritte ausführen:

1. **Eingabe**: Das Skript soll den Pfad zur Protokolldatei als Kommandozeilenargument entgegennehmen.

2. **Fehleranzahl**: Analysiere die Protokolldatei und zähle die Anzahl der Fehlermeldungen. Eine Fehlermeldung kann durch ein bestimmtes Schlüsselwort identifiziert werden (z. B. „ERROR“ oder „Failed“). Gib die Gesamtanzahl der Fehler aus.

3. **Kritische Ereignisse**: Suche nach Zeilen, die das Schlüsselwort „CRITICAL“ enthalten, und gib diese Zeilen zusammen mit der Zeilennummer aus.

4. **Häufigste Fehlermeldungen**: Identifiziere die 5 häufigsten Fehlermeldungen und gib sie zusammen mit ihrer Häufigkeit aus.

5. **Zusammenfassender Bericht**: Erstelle einen zusammenfassenden Bericht in einer separaten Textdatei. Der Bericht soll Folgendes enthalten:

-Datum der Analyse
-Name der Protokolldatei
-Anzahl der verarbeiteten Zeilen
-Gesamtanzahl der Fehler
-Die 5 häufigsten Fehlermeldungen mit Häufigkeit
-Liste der kritischen Ereignisse mit Zeilennummern

6. **Optionale Erweiterung**: Füge eine Funktion hinzu, um die analysierten Protokolldateien nach der Auswertung automatisch zu archivieren oder in ein bestimmtes Verzeichnis zu verschieben.

   <h2>Answer</h2>

   - **First created a folder and then a log file.**

   ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day10/image/task1.png)

   - **Bash Code for Reference.**

   ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day10/image/task2.png)

   - <h2>Output</h2>

   ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day10/image/output.png)

6. **Optional Enhancement:** Add a feature to automatically archive or move processed log files to a designated directory after analysis.

## Tips

-Verwende grep, awk und andere Kommandozeilen-Tools zur Verarbeitung der Protokolldatei.
-Nutze Arrays oder assoziative Arrays, um Fehlermeldungen und deren Anzahl zu erfassen.
-Setze geeignete Fehlerbehandlung ein, um Fälle zu behandeln, in denen die Protokolldatei nicht existiert oder andere Probleme auftreten.

## beispiel_log.log

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
