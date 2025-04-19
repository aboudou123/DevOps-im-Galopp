### 1. **Verzeichnis- und Dateiliste**

- `ls`  
  Listet Dateien und Verzeichnisse im aktuellen Verzeichnis auf.  
  Beispiele:
  - `ls` – Zeigt alle Dateien im aktuellen Verzeichnis an.
  - `ls -l` – Zeigt detaillierte Dateiinformationen (Größe, Berechtigungen, Erstellungsdatum, etc.).
  - `ls -a` – Zeigt auch versteckte Dateien (die mit einem Punkt beginnen) an.
  - `ls -lh` – Zeigt detaillierte Dateiinformationen in menschenlesbarem Format an (z. B. Dateigröße in KB/MB).
  - `ls -R` – Listet Dateien rekursiv in Unterverzeichnissen auf.

- `dir`  
  Eine alternative Methode zum Auflisten von Verzeichnissen und Dateien (manchmal auf alten Systemen verfügbar).

- `tree`  
  Listet Verzeichnisse und Dateien in einer baumartigen Struktur auf (muss manchmal installiert werden).  
  Beispiel:  
  - `tree` – Zeigt die Verzeichnisstruktur und Dateien an.

### 2. **Dateiinformationen**

- `stat [Dateiname]`  
  Zeigt detaillierte Informationen über eine Datei, z. B. Last Access, Last Modification, Dateigröße und mehr.

- `file [Dateiname]`  
  Bestimmt den Dateityp einer Datei, z. B. ob es sich um ein Textdokument, ein Skript, eine Bilddatei etc. handelt.

- `du`  
  Schätzt die Dateigröße eines Verzeichnisses und seiner Unterverzeichnisse.  
  Beispiel:  
  - `du -sh` – Gibt die Größe des aktuellen Verzeichnisses in einer menschenlesbaren Form (z. B. 1K, 234M, 2G) aus.
  
- `df`  
  Zeigt die Festplattenbelegung an.  
  Beispiel:  
  - `df -h` – Zeigt die Festplattenbelegung in einem menschenlesbaren Format an (z. B. GB).

### 3. **Prozess- und Systemlisten**

- `ps`  
  Zeigt die aktuellen Prozesse an.  
  Beispiele:
  - `ps` – Zeigt die Prozesse im aktuellen Terminal an.
  - `ps aux` – Zeigt alle Prozesse des Systems an.
  - `ps -ef` – Eine weitere Variante, die alle Prozesse in einem standardisierten Format zeigt.

- `top`  
  Zeigt die laufenden Prozesse in Echtzeit an und gibt eine Übersicht über Systemressourcen wie CPU, RAM und Auslastung.

- `htop`  
  Eine erweiterte, farbige Version von `top`, die eine interaktive Benutzeroberfläche bietet (muss auf manchen Systemen installiert werden).

- `pstree`  
  Zeigt Prozesse in einer baumartigen Struktur, die die Hierarchie der Prozesse zeigt.

- `lsof`  
  Listet alle geöffneten Dateien und die Prozesse auf, die sie verwenden. Sehr hilfreich, um herauszufinden, welche Prozesse auf eine Datei zugreifen.

### 4. **Benutzer- und Gruppeninformationen**

- `who`  
  Zeigt an, wer im Moment angemeldet ist.

- `w`  
  Zeigt an, wer aktuell angemeldet ist und welche Aktivitäten sie ausführen.

- `id`  
  Zeigt die Benutzer-ID und Gruppen-ID des aktuellen Benutzers an.

- `groups`  
  Listet die Gruppen auf, zu denen der Benutzer gehört.

### 5. **Paketlisten (bei Paketmanagern)**

- `dpkg -l` (Debian/Ubuntu)  
  Listet alle installierten Pakete auf.

- `rpm -qa` (RedHat/CentOS)  
  Listet alle installierten Pakete auf.

- `yum list installed` (RedHat/CentOS)  
  Listet alle installierten Pakete auf.

- `apt list --installed` (Debian/Ubuntu)  
  Listet alle installierten Pakete auf.

### 6. **Weitere nützliche Listenbefehle**

- `lsblk`  
  Listet alle Blockgeräte auf (Festplatten, Partitionen, etc.).

- `mount`  
  Zeigt alle aktuell gemounteten Dateisysteme an.

- `ip a` oder `ifconfig`  
  Zeigt Netzwerkinterfaces und IP-Adressen an.

[Tag 3](https://github.com/aboudou123/DevOps-im-Galopp/tree/main/Tag%203)
