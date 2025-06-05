-

### **Lösung Aufgaben**

1. **Verzeichnisse mit einem Shell-Skript erstellen:**

   * Schreibe ein Bash-Skript mit dem Namen `createDirectories.sh`, das bei Ausführung mit drei Argumenten (Verzeichnisname, Startnummer und Endnummer) eine bestimmte Anzahl von Verzeichnissen mit einem dynamischen Namen erstellt.
   * **Beispiel 1:** Wird das Skript ausgeführt mit `./createDirectories.sh tag 1  90`, so erstellt es 90 Verzeichnisse mit den Namen `tag 1`, `tag 2`, `tag 3` ... `tag 90`.
   

   **Antwort:**

<img width="508" alt="L1" src="https://github.com/user-attachments/assets/733e1665-ab8a-43bd-b78c-258f594803fc" />

<img width="554" alt="L2" src="https://github.com/user-attachments/assets/338b84bf-653a-4c2a-ad2f-88c8725ce86d" />


<img width="425" alt="L3" src="https://github.com/user-attachments/assets/3d25178f-161e-4b8e-9463-4798e909cd2d" />


---

2. **Ein Skript erstellen, um deine gesamte Arbeit zu sichern:**

   * Backups sind ein wichtiger Bestandteil der täglichen Arbeit eines DevOps Engineers.

   **Antwort:**

<img width="589" alt="backup1" src="https://github.com/user-attachments/assets/57baf200-1b9c-42e5-942e-082af1520a39" />


<img width="725" alt="L4" src="https://github.com/user-attachments/assets/3086dc56-21c2-4862-92e7-48d0c79cf876" />

<img width="725" alt="L5" src="https://github.com/user-attachments/assets/1ce9666c-4077-4808-8399-6d3568554998" />



## Ein neues Backup wird erstellt, um die Inkohärenzen des alten zu korrigieren.

Ich bin  im richtigen Verzeichnis und habe die Datei `backup.sh` mit `vim` geöffnet.

Perfekt – du willst also:

1. **Die alte Backup-Datei löschen**
2. **Ein sauberes neues Backup erstellen**

Hier ist genau, wie du das Schritt für Schritt machst:

---

## 🔥 1. Alte Backup-Dateien löschen

Wenn du **alle alten Backup-Dateien** löschen willst (z. B. `backup_day_1_to_90_*.tar.gz`), nutze diesen Befehl:


<img width="808" alt="bc" src="https://github.com/user-attachments/assets/44ebf7ae-1e20-4ed3-b55a-ddf22163883b" />


```bash
rm backup_day_1_to_90_*.tar.gz
```

```bash
rm *.tar.gz
```

💡 **Tipp:**  `ls` vorher prüfen, was gelöscht wird:

```bash
ls *.tar.gz
```

---

## 🧼 2. Neues Backup erstellen

```bash
./backup.sh day 1 90
```

Ergebnis:

```bash
📦 Erstelle Backup-Datei: backup_day_1_to_90_20250605_172312.tar.gz
✅ Backup erfolgreich erstellt: backup_day_1_to_90_20250605_172312.tar.gz
```

---

## ❓ Was tun, wenn du auch die Verzeichnisse neu anlegen willst?

Wenn du **alles von Null starten** willst:

```bash
rm -r day{1..90}        # Alle day-Verzeichnisse löschen
./createDirectories.sh tag 1 90   # Neue Verzeichnisse erstellen
./backup.sh tag 1 90             # Neues Backup erstellen
```

---

Erstelle eine **Variable** `BACKUP_DIR` für den Zielordner
---

## 🧠 Ziel

* Erstelle eine **Variable** `BACKUP_DIR` für den Zielordner
* Erstelle das Backup **in diesem Verzeichnis**

---

## 💾 code für `backup.sh`

```bash
#!/bin/bash

# Überprüfen, ob genau drei Argumente übergeben wurden
if [ "$#" -ne 3 ]; then
    echo "Benutzung: $0 <Verzeichnisname> <Startnummer> <Endnummer>"
    exit 1
fi

# Argumente
prefix=$1
start=$2
end=$3

# 🔧 Zielverzeichnis für Backup festlegen
BACKUP_DIR="/home/koffi/backup"  # → oder einfach: BACKUP_DIR="$(pwd)" für aktuelles Verzeichnis

# Backup-Dateiname mit Zeitstempel
timestamp=$(date +%Y%m%d_%H%M%S)
backup_name="backup_${prefix}_${start}_to_${end}_${timestamp}.tar.gz"
backup_path="${BACKUP_DIR}/${backup_name}"

# Gültige Verzeichnisse sammeln
dirs=()
for (( i=start; i<=end; i++ )); do
    dir="${prefix}${i}"
    if [ -d "$HOME/$dir" ]; then
        dirs+=("$HOME/$dir")
    else
        echo "⚠️  Hinweis: Verzeichnis '$HOME/$dir' existiert nicht und wird übersprungen."
    fi
done

# Prüfen, ob Verzeichnisse vorhanden sind
if [ ${#dirs[@]} -eq 0 ]; then
    echo "❌ Keine gültigen Verzeichnisse gefunden. Backup wird abgebrochen."
    exit 1
fi

# Backup erstellen
echo "📦 Erstelle Backup-Datei: $backup_path"
tar -czf "$backup_path" "${dirs[@]}"

# Erfolgsmeldung
if [ $? -eq 0 ]; then
    echo "✅ Backup erfolgreich erstellt: $backup_path"
else
    echo "❌ Fehler beim Erstellen des Backups"
fi
```

---

## ✅ Ausführen

Speichere die Datei in `vim`:

* `ESC`, dann `:wq` und Enter

Dann mach sie ausführbar (falls nicht bereits geschehen):

```bash
chmod +x backup.sh
```

Jetzt kannst du das Backup starten, z. B.:

```bash
./backup.sh tag 1 90
```

Wenn du alles richtig gemacht hast, wird das Backup z. B. in `/home/koffi/backup/backup_tag_1_to_90_20250605_174500.tar.gz` gespeichert.

---

<img width="495" alt="d2" src="https://github.com/user-attachments/assets/89735d57-3c57-4cf4-9122-35733d387677" />

<img width="525" alt="d3_2" src="https://github.com/user-attachments/assets/03193740-7ec0-48fa-9a60-76856c85f90c" />


<img width="668" alt="back8" src="https://github.com/user-attachments/assets/1a273b51-b398-44e5-8d50-af0e17fbf336" />


<img width="577" alt="back9" src="https://github.com/user-attachments/assets/102b79c8-f7ff-47ef-8d15-b1afcc11a470" />
<img width="730" alt="bak5" src="https://github.com/user-attachments/assets/2d1c1327-4cf7-4e26-86b1-8c5c84856166" />

<img width="733" alt="bak6" src="https://github.com/user-attachments/assets/72d74961-66c1-47e9-bf17-8cfed5ce8546" />

<img width="909" alt="back7" src="https://github.com/user-attachments/assets/0ecc621d-d6ce-4b18-9877-fc4bb654efb8" />


---

---

## 📝 **1. `buckup.sh` – Nur für das Erstellen von Verzeichnissen**

```bash
#!/bin/bash

# Überprüfen, ob genau drei Argumente übergeben wurden
if [ "$#" -ne 3 ]; then
    echo "Benutzung: $0 <Verzeichnisname> <Startnummer> <Endnummer>"
    exit 1
fi

# Argumente in Variablen speichern
prefix=$1
start=$2
end=$3

# Überprüfen, ob Start- und Endnummer gültige Zahlen sind
if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ && "$start" -le "$end" ]]; then
    echo "Fehler: Start- und Endnummer müssen gültige ganze Zahlen sein (Start <= Ende)."
    exit 1
fi

# Verzeichnisse erstellen
for (( i=start; i<=end; i++ ))
do
    dirname="${prefix}${i}"
    mkdir -p "$dirname"
    echo "Erstellt: $dirname"
done
```

---

## 💾 **2. `backupDirectories.sh` – Backup erstellen**

```bash
#!/bin/bash

# Überprüfen, ob genau drei Argumente übergeben wurden
if [ "$#" -ne 3 ]; then
    echo "Benutzung: $0 <Verzeichnisname> <Startnummer> <Endnummer>"
    exit 1
fi

# Argumente in Variablen speichern
prefix=$1
start=$2
end=$3

# Backup-Dateiname
timestamp=$(date +%Y%m%d_%H%M%S)
backup_name="backup_${prefix}_${start}_to_${end}_${timestamp}.tar.gz"

# Backup erstellen
echo "Backup wird erstellt: $backup_name"
tar -czf "$backup_name" ${prefix}{${start}..${end}}

# Erfolgsmeldung
if [ $? -eq 0 ]; then
    echo "Backup erfolgreich erstellt: $backup_name"
else
    echo "Fehler beim Erstellen des Backups"
fi
```

---


<img width="733" alt="bak6" src="https://github.com/user-attachments/assets/412a8c01-6233-4389-997d-bdf11e272a47" />



## ▶️ So verwendest du die beiden Skripte:

1. Erstelle die Verzeichnisse:

```bash
./createDirectories.sh day 1 10
```

2. Danach Backup erstellen:

```bash
./backupDirectories.sh day 1 10
```

---

💡 Du kannst beide Skripte ausführbar machen:

```bash
chmod +x createDirectories.sh backupDirectories.sh
```


3. **Informiere dich über Cron und Crontab, um das Backup-Skript zu automatisieren:**

   * Cron ist der Haupt-Zeitplaner des Systems für unbeaufsichtigte Aufgaben. Mit dem Befehl `crontab` kann der Benutzer Einträge zum Zeitplan hinzufügen, bearbeiten oder löschen. Eine Crontab-Datei enthält Informationen darüber, wann welche Aufgaben ausgeführt werden sollen.

   **Antwort:**



   
<img width="577" alt="back9" src="https://github.com/user-attachments/assets/d7024c3e-78cb-42b9-bccd-d2bb5969c9d4" />


---

Gute Frage! `crontab -e` ist ein sehr wichtiger Befehl in Ubuntu (und allen Linux-Systemen), vor allem für DevOps-Engineers.

---

## 🕒 Was ist `crontab`?

**`cron`** ist ein Dienst in Linux, der automatisch **wiederkehrende Aufgaben (sog. "Cronjobs")** zu bestimmten Zeiten ausführt.

**`crontab`** (cron table) ist die Datei, in der du diese Aufgaben (Jobs) einträgst.

---

## 🛠️ Was macht `crontab -e`?

Der Befehl:

```bash
crontab -e
```

bedeutet:

> „Bearbeite die Crontab-Datei für **meinen Benutzer**.“

Damit öffnest du die persönliche Cron-Tabelle deines Benutzers in einem Texteditor (z. B. `nano` oder `vim`), um geplante Aufgaben einzutragen.

---

## 📋 Beispiel: Täglich ein Backup um 22:00 Uhr ausführen

Wenn du z. B. möchtest, dass dein Skript `backup.sh` jeden Abend um 22:00 Uhr ausgeführt wird:

1. Tippe im Terminal:

   ```bash
   crontab -e
   ```

2. Füge am Ende diese Zeile ein:

   ```bash
   0 22 * * * /home/koffi/backup/backup.sh tag 1 90
   ```

   🟢 Erklärung:

   * `0 22` → Stunde 22:00 Uhr
   * `* * *` → jeden Tag, jeden Monat, jeden Wochentag
   * Pfad zum Skript + Argumente

---

## 🔍 Andere nützliche Befehle

* `crontab -l` → Zeigt deine aktuelle Crontab an
* `crontab -r` → **Löscht** deine Crontab (Achtung!)


## ⚠️ Wichtiger Hinweis

* Stelle sicher, dass dein Skript **ausführbar** ist:

  ```bash
  chmod +x /home/koffi/backup/backup.sh
  ```
* Verwende in der Crontab immer **absolute Pfade**.

---



