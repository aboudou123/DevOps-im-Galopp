
# **Tag 9 Aufgabe: Wiederholung Aufgaben- Linux Shell Scripting für DevOps Engineers mit Benutzerverwaltung**


Wenn dir aufgefallen ist, dass es im Verzeichnis „2023“ dieses Repositories insgesamt 90 Unterverzeichnisse gibt – was hast du gedacht? Wie habe ich 90 Verzeichnisse erstellt? Manuell, eines nach dem anderen? Mit einem Skript oder einem Befehl?

Alle 90 Verzeichnisse wurden innerhalb weniger Sekunden mit einem einfachen Befehl erstellt:

```bash
mkdir day{1..90}
```

---

### **Aufgaben**

1. **Verzeichnisse mit einem Shell-Skript erstellen:**

   * Schreibe ein Bash-Skript `createDirectories.sh`, das bei Ausführung mit drei Argumenten (Verzeichnisname, Startnummer, Endnummer) eine bestimmte Anzahl von Verzeichnissen mit dynamischem Namen erstellt.
   * Beispiel 1: Wird das Skript wie folgt ausgeführt: `./createDirectories.sh day 1 90`, so erstellt es 90 Verzeichnisse mit den Namen `day1`, `day2`, `day3` ... `day90`.
   * Beispiel 2: Wird das Skript wie folgt ausgeführt: `./createDirectories.sh Movie 20 50`, so erstellt es 31 Verzeichnisse mit den Namen `Movie20`, `Movie21`, `Movie22` ... `Movie50`.

   Hinweis: Du kannst nach Belieben Schleifen oder Befehle (oder beides) verwenden. [Siehe diese Referenz: Bash Scripting For Loop](https://www.geeksforgeeks.org/bash-scripting-for-loop/)

2. **Erstelle ein Skript zur Sicherung deiner Arbeit:**

   * Backups sind ein wichtiger Bestandteil der täglichen Arbeit eines DevOps Engineers. Das Video in den Referenzen wird dir helfen zu verstehen, wie ein DevOps Engineer Backups durchführt (es kann anfangs schwierig wirken, aber gib nicht auf – nichts ist unmöglich).
   * Schau dir [dieses Video](https://youtu.be/aolKiws4Joc) als Anleitung an.

   Bei Fragen kannst du sie im [Discord-Kanal für #90DaysOfDevOps](https://discord.gg/hs3Pmc5F) stellen.

3. **Informiere dich über Cron und Crontab zur Automatisierung des Backup-Skripts:**

   * Cron ist der Hauptplaner des Systems für unbeaufsichtigte Aufgaben. Der Befehl `crontab` erlaubt es dem Benutzer, Aufgaben zu erstellen, zu bearbeiten oder zu löschen. Eine Crontab-Datei enthält die Zeitpläne für die auszuführenden Befehle.
   * Schau dir dazu dieses Video an: [Cron und Crontab](https://youtu.be/aolKiws4Joc)

4. **Lies über Benutzerverwaltung:**

   * Ein Benutzer ist eine Entität in einem Linux-Betriebssystem, die Dateien bearbeiten und verschiedene andere Aktionen durchführen kann. Jeder Benutzer erhält eine eindeutige ID. Die IDs von 0 bis 999 sind für Systembenutzer reserviert, lokale Benutzer beginnen bei ID 1000.
   * Erstelle 2 Benutzer und gib ihre Benutzernamen aus.
   * [Siehe diese Referenz: Benutzerverwaltung in Linux](https://www.geeksforgeeks.org/user-management-in-linux/)

5. **Teile deinen Fortschritt:**

   * Teile deine tägliche Arbeit auf LinkedIn und berichte, wie es gelaufen ist! Es wird sehr empfohlen, einen Artikel über deine Erfahrung zu schreiben.


[← Previous Day](../day04/README.md) | [Next Day →](../day06/README.md)
