
# Lösung - Tag 7 -Git & GitHub


## **1 – Einführung**

### 🔹 Was ist Git?

Git ist ein verteiltes Versionskontrollsystem. Es hilft dir, den Verlauf von Änderungen an Dateien (meist Code) nachzuvollziehen, verschiedene Versionen zu verwalten und mit Teams effizient zusammenzuarbeiten.

**Wichtigste Vorteile:**
- Änderungen rückgängig machen
- Zusammenarbeit erleichtern
- Branching & Merging (für paralleles Arbeiten)

---

## **2 – Erste Schritte mit Git**

### 🔹 Was ist Git? *(praktisch)*

**Beispiel:** Erstelle ein Projektverzeichnis und initialisiere Git.

```bash
# 1. Neues Projektverzeichnis
mkdir mein-projekt
cd mein-projekt

# 2. Git initialisieren
git init
```

👉 Nun ist das Verzeichnis ein Git-Repository, bereit zur Versionskontrolle.

---

### 🔹 Wie Git funktioniert

Git speichert *Snapshots* deines Projekts, nicht nur Unterschiede. Es arbeitet lokal, das heißt, du brauchst kein Netzwerk, um es zu nutzen.

#### Praktisches Beispiel:

```bash
# 1. Datei erstellen
echo "Hallo Welt" > hallo.txt

# 2. Datei zum Git-Index (Staging Area) hinzufügen
git add hallo.txt

# 3. Commit erstellen (Snapshot speichern)
git commit -m "Füge hallo.txt hinzu"

# 4. Änderung nachverfolgen
git log
```

👉 Du siehst im Log deinen ersten Commit. Git hat den Zustand der Datei gespeichert.

---

### 🔹 Git-Alternativen

| Tool         | Beschreibung |
|--------------|--------------|
| **Mercurial** | Ähnlich wie Git, aber einfacher in der Bedienung. |
| **Subversion (SVN)** | Zentrale Versionskontrolle, nicht verteilt wie Git. |
| **Perforce** | Häufig in der Spieleentwicklung genutzt. |

#### Kurzes Beispiel mit Mercurial (wenn installiert):

```bash
# Mercurial-Projekt initialisieren
hg init mein-hg-projekt
cd mein-hg-projekt
echo "Test" > test.txt
hg add test.txt
hg commit -m "Erste Datei"
```

---

Hier Branching, GitHub und täglicher Workflow:

---

## **3 – Branching, GitHub und täglicher Workflow**

---

### 🔹 Branching (Arbeiten auf separaten Entwicklungszweigen)

**Warum Branching?**  
Man entwickelt neue Features oder Fixes, ohne die Hauptversion (*main branch*) zu stören.

#### Praktisches Beispiel:

```bash
# 1. Auflisten aller Branches
git branch

# 2. Neuen Branch erstellen
git branch feature-login

# 3. In neuen Branch wechseln
git checkout feature-login

# 4. Datei ändern und committen
echo "Login-Funktion" > login.txt
git add login.txt
git commit -m "Füge Login-Funktion hinzu"

# 5. Zurück zu main wechseln
git checkout main

# 6. Branch zusammenführen (Merge)
git merge feature-login
```

👉 Ergebnis: Änderungen aus `feature-login` werden in `main` integriert.

---

### 🔹 GitHub (Online-Git-Hosting und Zusammenarbeit)

**Was ist GitHub?**  
GitHub ist eine Plattform, wo du Git-Repositories online speichern, teilen und verwalten kannst.

#### Praktisches Beispiel:

1. Repository auf GitHub erstellen (Webseite).
2. Lokales Projekt mit GitHub verknüpfen:

```bash
# 1. Neues Remote-Repository zuordnen
git remote add origin https://github.com/DEIN-NUTZERNAME/mein-projekt.git

# 2. Projekt auf GitHub hochladen
git push -u origin main
```

👉 Danach liegt dein Projekt online auf GitHub! 🚀

---

### 🔹 Täglicher Git-Workflow (empfohlene Routine)

**Typischer Ablauf:**

| Schritt | Befehl | Erklärung |
|:--------|:-------|:----------|
| 1. Änderungen abholen | `git pull` | Hol dir die neuesten Änderungen vom Team. |
| 2. Neuen Branch erstellen | `git checkout -b feature-xyz` | Arbeite isoliert an deiner Aufgabe. |
| 3. Änderungen speichern | `git add .` <br> `git commit -m "Nachricht"` | Zwischenspeichern deiner Arbeit. |
| 4. Pushen | `git push origin feature-xyz` | Lade deinen Branch auf GitHub hoch. |
| 5. Pull Request erstellen | (auf GitHub) | Schlage deine Änderungen dem Team zur Übernahme vor. |
| 6. Mergen und löschen | `git checkout main` <br> `git merge feature-xyz` <br> `git branch -d feature-xyz` | Änderungen übernehmen und alten Branch aufräumen. |

---
Top! Hier ist **Teil 4 – Git-Installation**, schön übersichtlich nach Betriebssystem aufgeteilt mit praktischen Befehlen:

---

## **4 – Git-Installation**

---

### 🔹 **Mac OS**

#### 🔧 Variante 1: Über **Homebrew** (empfohlen)

```bash
# 1. Homebrew installieren (falls nicht vorhanden)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Git installieren
brew install git

# 3. Version prüfen
git --version
```

---

### 🔹 **Windows**

#### 🔧 Variante: Über **Git for Windows GUI**

1. Webseite aufrufen:  
   👉 [https://git-scm.com](https://git-scm.com)

2. Installer herunterladen:  
   → `Git for Windows`

3. Setup ausführen, alles Standard lassen (inkl. Git Bash und Git GUI).

4. Nach der Installation:  
   **Git Bash öffnen** und prüfen:

```bash
git --version
```

✅ Jetzt kannst du Git auf Windows nutzen – auch per Terminal!

---

### 🔹 **Linux (Debian/Ubuntu-basierend)**

#### 🔧 Über Paketmanager:

```bash
# 1. Paketliste aktualisieren
sudo apt update

# 2. Git installieren
sudo apt install git -y

# 3. Installation prüfen
git --version
```

#### 🔧 Für Red Hat / Fedora / CentOS:

```bash
sudo dnf install git
```

---

Nach der Installation: **Git global konfigurieren** (gilt für alle Systeme):

```bash
# Deinen Namen festlegen
git config --global user.name "Dein Name"

# Deine E-Mail-Adresse festlegen (wichtig für GitHub)
git config --global user.email "dein@email.de"
```

---

 **5 – Konfiguration & nützliche Befehle** 
 
 
 Perfekt! Hier geht's weiter mit:

---

## **5 – Git-Konfiguration & nützliche Befehle**

---

### 🔹 Git-Grundkonfiguration

Diese Einstellungen brauchst du, damit deine Commits richtig zugeordnet werden.

#### Praktisches Beispiel:

```bash
# 1. Nutzername setzen
git config --global user.name "Max Mustermann"

# 2. E-Mail setzen
git config --global user.email "max@beispiel.de"

# 3. Standard-Editor festlegen (optional, z.B. Visual Studio Code)
git config --global core.editor "code --wait"

# 4. Config anzeigen
git config --list

---

```
koffi@koffi-VirtualBox:~$ git config --global user.name "DePatrick"
koffi@koffi-VirtualBox:~$ git config --global user.email "depatrick22@yahoo.com"


koffi@koffi-VirtualBox:~$ git config --list // Pour voir le resultat de ce qui est fait

![image](https://github.com/user-attachments/assets/9a8e82e9-782c-485b-8bfb-a759cf92eceb)








### 🔹 Nützliche Git-Befehle für den Alltag

| Zweck | Befehl | Erklärung |
|:-----|:-------|:----------|
| Status der Dateien prüfen | `git status` | Zeigt, was verändert oder vorbereitet ist. |
| Änderungen vergleichen | `git diff` | Zeigt Unterschiede zwischen Arbeitsverzeichnis und letzter Version. |
| Datei dem Commit hinzufügen | `git add DATEINAME` | Stellt Datei für den nächsten Commit bereit. |
| Alle Dateien hinzufügen | `git add .` | Fügt alle geänderten Dateien hinzu. |
| Commit erstellen | `git commit -m "Kurze Nachricht"` | Speichert Änderungen lokal mit Kommentar. |
| Letzte Commits anzeigen | `git log` | Zeigt die Commit-Historie. |
| Branches anzeigen | `git branch` | Listet alle Branches auf. |
| In anderen Branch wechseln | `git checkout BRANCHNAME` | Wechselt zu einem anderen Branch. |
| Änderungen zum Server senden | `git push` | Sendet deine Commits zu GitHub o.Ä. |
| Änderungen vom Server holen | `git pull` | Holt Updates vom Server und integriert sie. |
| Repository klonen | `git clone URL` | Erstellt eine lokale Kopie eines Online-Repos. |

---

### 🔹 Bonus: Typischer Alias für schnellere Arbeit

Du kannst häufig genutzte Befehle abkürzen:

```bash
# Beispiel: 'git co' statt 'git checkout'
git config --global alias.co checkout

# Beispiel: 'git cm' statt 'git commit -m'
git config --global alias.cm 'commit -m'
```

Dann kannst du z.B. einfach tippen:

```bash
git co main
git cm "Update README"
```

---

✅ **Zusammenfassung:**  
Jetzt hast du Git installiert, konfiguriert und kennst die wichtigsten Tagesbefehle!

---

 **praktische Mini-Projektübung**  🚀  
(z.B. ein kleines Git-Projekt in 10 Minuten aufbauen?)


Super, dann machen wir jetzt eine **praktische Mini-Projektübung**! 🚀  
(Alles Schritt für Schritt – du kannst direkt mitmachen.)

---

## 🎯 **Mini-Projekt: Dein erstes vollständiges Git-Projekt**

---

### **Ziel:**  
Erstelle ein Projekt → arbeite mit Branches → speichere und lade es auf GitHub hoch.

---

### 🔹 1. Neues Projektverzeichnis erstellen

```bash
mkdir mini-git-projekt
cd mini-git-projekt
```

---

### 🔹 2. Git initialisieren

```bash
git init
```

---

### 🔹 3. Erste Datei erstellen

```bash
echo "# Mein erstes Git-Projekt" > README.md
```

---

### 🔹 4. Änderungen verfolgen und committen

```bash
git add README.md
git commit -m "Erster Commit: README hinzugefügt"
```

---

### 🔹 5. Einen neuen Branch erstellen und wechseln

```bash
git checkout -b feature-text
```

---

### 🔹 6. Neue Datei im neuen Branch erstellen

```bash
echo "Dies ist ein Testtext." > text.txt
git add text.txt
git commit -m "Füge text.txt hinzu"
```

---

### 🔹 7. Zurück zu main wechseln und zusammenführen

```bash
git checkout main
git merge feature-text
```

---

### 🔹 8. Projekt auf GitHub hochladen

**(Auf GitHub zuerst ein leeres Repository erstellen.)**

Dann im Terminal:

```bash
git remote add origin https://github.com/DEIN-NUTZERNAME/mini-git-projekt.git
git branch -M main
git push -u origin main
```

---

✅ **Jetzt liegt dein Projekt auf GitHub!**

---

### 🛠 Was hast du geübt?

- Repository erstellen
- Branch erstellen & wechseln
- Dateien tracken, committen, mergen
- Projekt auf GitHub hochladen

---

**"Was tun, wenn etwas schiefläuft?" (Rollback, Reset, Revert)**? 🚑  

Perfekt, dann machen wir weiter mit:

---

## 🛠 **Git-Fehler retten: Rollback, Reset, Revert**

Manchmal geht etwas schief – mit Git kannst du fast immer alles retten!  
Hier die wichtigsten Techniken:

---

### 🔹 1. Änderungen an Dateien rückgängig machen (vor dem Commit)

**Situation:**  
Du hast eine Datei geändert, willst die Änderung aber verwerfen.

```bash
# Änderung an einer Datei zurücksetzen
git checkout -- DATEINAME
```

**Beispiel:**

```bash
git checkout -- text.txt
```

👉 Die Datei ist wieder im letzten gespeicherten Zustand.

---

### 🔹 2. Letzten Commit rückgängig machen (aber Dateien behalten)

**Situation:**  
Commit war falsch, aber die Dateien sollen bleiben.

```bash
git reset --soft HEAD~1
```

**Erklärung:**  
- `--soft`: Commit wird rückgängig gemacht, Änderungen bleiben zum erneuten Commit bereit.

---

### 🔹 3. Letzten Commit **komplett** rückgängig machen (Dateien verwerfen)

**Achtung: Dateien gehen verloren!**

```bash
git reset --hard HEAD~1
```

---

### 🔹 4. Commit "offiziell" rückgängig machen (ohne Geschichte zu zerstören)

**Situation:**  
Du willst auf GitHub bleiben, aber einen Fehler rückgängig machen.

```bash
git revert COMMIT_ID
```

**Beispiel:**

```bash
git log   # Commit-ID anschauen
git revert a1b2c3d4
```

👉 Git erstellt automatisch einen neuen Commit, der den alten rückgängig macht.

---

### 🔹 5. Datei aus der Staging-Area entfernen

**Situation:**  
Du hast eine Datei mit `git add` hinzugefügt, willst sie aber nicht committen.

```bash
git reset HEAD DATEINAME
```

**Beispiel:**

```bash
git reset HEAD text.txt
```

---

## ⚡ Zusammenfassung

| Situation | Befehl | Wirkung |
|:----------|:-------|:--------|
| Dateiänderung rückgängig machen | `git checkout -- DATEINAME` | Bringt Datei auf alten Stand |
| Commit rückgängig (Dateien bleiben) | `git reset --soft HEAD~1` | Commit löschen, Änderungen behalten |
| Commit + Dateien löschen | `git reset --hard HEAD~1` | Alles auf alten Stand setzen |
| Commit "umkehren" (sauber) | `git revert COMMIT_ID` | Neuer Commit, der Fehler rückgängig macht |
| Datei aus Staging entfernen | `git reset HEAD DATEINAME` | Datei wird nicht mehr für Commit vorgemerkt |

---

✅ Jetzt mit alle disese Wissen kannst du **nicht nur entwickeln, sondern auch Fehler professionell beheben**!


Alles klar! Hier ist der nächste strukturierte Block:

---

## **6 – Git-Befehle, Hilfe und Konfiguration**

---

### 🔹 Git-Befehle (wichtigste Grundbefehle)

Hier die tägliche Toolbox:

| Befehl | Funktion |
|:-------|:---------|
| `git init` | Neues Git-Repository erstellen |
| `git clone URL` | Projekt von Server (GitHub, GitLab) klonen |
| `git add DATEINAME` | Datei für Commit vorbereiten |
| `git add .` | Alle Änderungen hinzufügen |
| `git commit -m "Nachricht"` | Snapshot der Änderungen erstellen |
| `git status` | Zeigt den aktuellen Stand des Repos |
| `git diff` | Zeigt die Unterschiede vor Commit |
| `git log` | Zeigt die Commit-Historie |
| `git branch` | Listet alle Branches |
| `git checkout BRANCHNAME` | Wechselt in einen anderen Branch |
| `git merge BRANCHNAME` | Merge Branch in aktuellen Branch |
| `git pull` | Holt Änderungen vom Remote-Repository |
| `git push` | Schickt eigene Commits ins Remote-Repository |

---

### 🔹 Git-Hilfe nutzen (wenn du mal nicht weiterkommst)

Git hat ein eingebautes Hilfesystem:

```bash
# Hilfe zu einem Befehl anzeigen
git help BEFEHL
```

**Beispiel:**

```bash
git help commit
```
oder kürzer:

```bash
git commit --help
```

👉 Zeigt Beispiele, Optionen und Erklärungen.

---

### 🔹 Hinzufügen von Konfigurationen (Git Config)

**Konfigurationen** passen Git an deinen Stil und dein Projekt an.

**Globale Konfiguration:** Gilt für alle Repositories auf deinem Computer.

```bash
git config --global user.name "Max Mustermann"
git config --global user.email "max@example.com"
```

**Projekt-spezifische Konfiguration:** Gilt nur im aktuellen Repository.

```bash
git config user.name "Projektname"
git config user.email "projekt@example.com"
```

**Weitere praktische Git-Konfigurationen:**

```bash
# Standard-Editor auf VS Code setzen
git config --global core.editor "code --wait"

# Git-Ausgabe farbig machen
git config --global color.ui auto

# Hauptbranch standardmäßig "main" nennen
git config --global init.defaultBranch main

# Alias erstellen (z.B. kürzeres Kommando)
git config --global alias.st status
git config --global alias.cm "commit -m"
```

👉 Danach kannst du z. B. `git st` statt `git status` schreiben!

---

### 🔹 Git-Konfiguration anzeigen oder prüfen

```bash
# Alle Konfigurationen auflisten
git config --list
```

---

Sehr gut, jetzt machen wir **Änderungen nachverfolgen** – alles praktisch und knackig:

---

## **7 – Änderungen nachverfolgen**

---

### 🔹 1 – Einführung

**Was passiert?**  
Git beobachtet Änderungen in deinem Projekt.  
Du musst Git aber sagen, **was** du speichern willst (= "stagen") und **wann** du einen Punkt speichern willst (= "committen").

---

### 🔹 2 – Aktuellen Status des Repos anzeigen (`git status`)

```bash
git status
```

✅ Zeigt:
- Unverfolgte Dateien
- Geänderte Dateien
- Dateien, die zum Commit bereit sind

---

### 🔹 3 – Dateien zum Index hinzufügen (`git add`)

**Eine Datei hinzufügen:**

```bash
git add DATEINAME
```

**Alle Änderungen hinzufügen:**

```bash
git add .
```

---

### 🔹 4 – Dateien aus dem Staging-Bereich entfernen

**Eine Datei wieder rausnehmen (vor dem Commit):**

```bash
git reset HEAD DATEINAME
```

---

### 🔹 5 – Übersicht über Commits (`git log`)

```bash
git log
```

✅ Zeigt:
- Wer was wann committed hat
- Commit-IDs (Hashes)

**Kurzversion:**

```bash
git log --oneline
```

---

### 🔹 6 – Ihr erster Commit

Nach dem `git add`:

```bash
git commit -m "Mein erster Commit"
```

✅ Jetzt ist deine Änderung **fest gespeichert** im Git-Verlauf!

---

### 🔹 7 – Mehrere Commits erstellen

**Typischer Workflow:**

```bash
# Datei ändern
echo "Neue Zeile" >> datei.txt

# Änderungen zum Staging hinzufügen
git add datei.txt

# Neuen Commit erstellen
git commit -m "Füge neue Zeile zu datei.txt hinzu"
```

👉 Für jede sinnvolle Änderung am besten einen eigenen Commit!

---

### 🔹 8 – Codeänderungen visualisieren (`git diff`)

**Unterschiede vor dem Commit anzeigen:**

```bash
git diff
```

**Unterschiede im Staging-Bereich:**

```bash
git diff --staged
```

---

### 🔹 9 – Commit-Verlauf anzeigen (`git log`)

**Vollständiger Verlauf:**

```bash
git log
```

**Kompakt:**

```bash
git log --oneline
```

**Mit Grafik (Branches sichtbar):**

```bash
git log --oneline --graph --all
```

---

### 🔹 10 – Inhalt von Commit anzeigen (`git show`)

**Details eines bestimmten Commits anzeigen:**

```bash
git show COMMIT-ID
```

**Beispiel:**

```bash
git show a1b2c3d4
```

---

### 🔹 11 – Head (Kopf)

**HEAD** zeigt auf den aktuell aktiven Commit.

- Standardmäßig zeigt `HEAD` auf den letzten Commit im aktuellen Branch.
- Wenn du arbeitest, bewegst du `HEAD` immer auf den neuesten Commit.

**Aktuellen HEAD anzeigen:**

```bash
git show HEAD
```

---

✅ **Zusammenfassung:**  

Jetzt kannst du Änderungen erkennen, steuern, speichern und sogar den ganzen Verlauf anschauen!

---
Sehr gut! Hier geht’s direkt praktisch weiter mit:

---

## **8 – Entfernte Repositories**

---

### 🔹 1 – Intro

**Was ist ein entferntes Repository?**  
Ein Git-Repository auf einem Server (z.B. GitHub) – damit du Projekte teilen oder sichern kannst.

---

### 🔹 2 – Verfügbare Cloud-Git-Repositories

Bekannte Anbieter:
- **GitHub** → Am bekanntesten
- **GitLab** → Viel für private Projekte
- **Bitbucket** → Gut für kleine Teams
- **Azure Repos** → Für Microsoft-Umgebungen

---

### 🔹 3 – GitHub-Konto erstellen

Gehe auf [github.com](https://github.com/)  
👉 Klicke auf **Sign Up**  
👉 Benutzername, E-Mail, Passwort eingeben und bestätigen.

---

### 🔹 4 – GitHub-Dashboard erkunden

Im Dashboard kannst du:
- Neue Repositories anlegen
- Projekte suchen
- Einstellungen anpassen
- PRs und Issues verwalten

---

### 🔹 5 – Entferntes Git-Repository erstellen

Auf GitHub:
1. Klick auf **New Repository**.
2. Repository-Name eingeben (z.B. `erstes-projekt`).
3. **README optional** aktivieren.
4. Repository erstellen.

---

### 🔹 6 – Entferntes Repository einstellen und anzeigen

In deinem lokalen Projekt:

```bash
git remote add origin https://github.com/DEIN-NUTZERNAME/erstes-projekt.git
```

**Remote anzeigen:**

```bash
git remote -v
```

✅ Zeigt dein verbundenes Repository an.

---

### 🔹 7 – Let's Try To Push

**Wenn dein Projekt noch keine Commits hat:**

```bash
git branch -M main
git push -u origin main
```

**Später dann einfach:**

```bash
git push
```

---

### 🔹 8 – SSH-Schlüssel konfigurieren (optional aber empfohlen)

**SSH statt HTTPS verwenden** = sicherer und keine Passworteingabe.

**Schlüssel erstellen:**

```bash
ssh-keygen -t ed25519 -C "dein.email@example.com"
```

- Enter drücken (Standardpfad nehmen)
- Passphrase setzen (optional)

**Öffentlichen Schlüssel kopieren:**

```bash
cat ~/.ssh/id_ed25519.pub
```

Dann auf GitHub:
- Settings → SSH and GPG Keys → New SSH Key → Key einfügen

---

### 🔹 9 – Push to Remote Repo (mit SSH)

Wenn SSH eingerichtet ist:

```bash
git remote set-url origin git@github.com:DEIN-NUTZERNAME/erstes-projekt.git
git push
```

✅ GitHub wird dich nicht mehr nach Username/Passwort fragen!

---

✅ **Ergebnis:**  
Jetzt kannst du dein Projekt auf GitHub hochladen, sichern und teilen!

---



## **9 – Branches, Merges und Konflikte**

---

### 🔹 1 – Was sind Branches?

**Branch = Zweig:**  
Ein Branch ist ein paralleler Entwicklungszweig. So kannst du unabhängig vom Hauptprojekt (meist `main` oder `master`) arbeiten.

**Warum Branches?**  
- Arbeiten an neuen Features ohne den Hauptzweig zu stören.
- Verschiedene Versionen und Ideen ausprobieren.

---

### 🔹 2 – Einen neuen Branch erstellen

```bash
git branch feature-xyz
```

**Branch wechseln:**

```bash
git checkout feature-xyz
```

**Oder kombinieren:**

```bash
git checkout -b feature-xyz
```

---

### 🔹 3 – Branches anzeigen

```bash
git branch
```

Zeigt alle lokalen Branches an.

**Alle Branches (auch remote) anzeigen:**

```bash
git branch -a
```

---

### 🔹 4 – Änderungen im Branch committen

Arbeiten im Branch:

1. Änderungen vornehmen
2. Dateien stagen:

   ```bash
   git add .
   ```

3. Commit erstellen:

   ```bash
   git commit -m "Feature xyz fertiggestellt"
   ```

---

### 🔹 5 – Branch mit `main` (oder anderem Branch) zusammenführen (Merge)

Jetzt willst du deine Arbeit in den Hauptzweig einfließen lassen:

1. Zurück zu `main` wechseln:

   ```bash
   git checkout main
   ```

2. Branch zusammenführen:

   ```bash
   git merge feature-xyz
   ```

---

### 🔹 6 – Konflikte beim Merge

**Was sind Konflikte?**  
Wenn zwei Branches dieselbe Datei verändert haben, kann Git nicht entscheiden, welche Version die richtige ist.

**Beispiel:**
- Du hast `datei.txt` verändert.
- Dein Kollege hat ebenfalls `datei.txt` verändert, aber etwas anderes.
- Git kann diese Unterschiede nicht automatisch zusammenführen → **Konflikt**.

**Konflikte beheben:**

1. Git zeigt dir die Konflikte in der Datei.
2. Du wirst Markierungen sehen, die dir helfen, die Unterschiede zu erkennen:

   ```bash
   <<<<<<< HEAD
   (deine Änderungen)
   =======
   (Änderungen von anderem Branch)
   >>>>>>> feature-xyz
   ```

3. Du musst entscheiden, welche Änderungen du übernehmen möchtest oder beides kombinieren.

4. Nach der Konfliktlösung:

   ```bash
   git add datei.txt
   git commit -m "Merge Konflikte behoben"
   ```

---

### 🔹 7 – Einen Remote-Branch mergen

Falls du von GitHub oder einem anderen Remote-Repository pullst:

1. Änderungen vom Remote-Repo holen:

   ```bash
   git pull origin main
   ```

2. Merge der Änderungen im lokalen Branch.

---

### 🔹 8 – Branch löschen

Wenn du den Branch nach dem Merge nicht mehr brauchst:

```bash
git branch -d feature-xyz
```

**Wichtig:**  
Falls der Branch noch nicht gemergt wurde, kannst du `-D` statt `-d` verwenden, um ihn zwangsweise zu löschen.

---

### 🔹 9 – Best Practices bei Branches und Merges

- Erstelle für jede größere Funktionalität oder Bugfix einen eigenen Branch.
- Mache häufige kleine Commits, anstatt große Änderungen auf einmal.
- Mergen nur, wenn der Feature-Branch fertig ist.
- Teste immer vor dem Merge, um sicherzustellen, dass alles funktioniert.

---


---

** wie man Git richtig im Team nutzt (z. B. mit Pull Requests und Git-Flow)?**  








