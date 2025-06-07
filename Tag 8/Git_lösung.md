
Ein Arbeitsverzeichnis erstell

# Lösung - Tag 4 -Aufgaben

Das Konzept der Linux Dateiberechtigung und des Eigentums ist in Linux sehr wichtig. Hier werden wir uns mit Linux-Berechtigungen und -Eigentümerschaft beschäftigen und Aufgaben zu beiden Themen erledigen. Beginnen wir mit den Berechtigungen.

Erstellen Sie eine einfache Datei und führen Sie ls -ltr aus, um die Details der Dateien zu sehen, siehe Hinweise
Jede der drei Berechtigungen ist drei definierten Kategorien von Benutzern zugeordnet. Die Kategorien sind:



## **1 – Einführung**

**Git** ist ein verteiltes Versionskontrollsystem, das von Linus Torvalds (dem Linux-Erfinder) entwickelt wurde. Es hilft Entwicklern, Änderungen am Code zu verfolgen, gemeinsam an Projekten zu arbeiten und jederzeit auf ältere Versionen zurückzugreifen.

**Beispiel:**
Stell dir vor, du arbeitest mit 3 Kollegen an einem Softwareprojekt. Jeder kann an verschiedenen Funktionen arbeiten, Änderungen speichern, vergleichen und bei Bedarf zum vorherigen Stand zurückspringen – ohne dass jemandes Arbeit verloren geht.

---

## **2 – Erste Schritte mit Git**

### **Was ist Git?**

Git ist ein Tool, mit dem man Quellcode-Versionen verwalten kann. Es merkt sich jede Änderung, die du an Dateien machst, und speichert sogenannte *Snapshots* deines Projekts.

**Beispiel:**
Du erstellst ein Python-Projekt mit einer Datei `main.py`. 

Mit Git kannst du jede Änderung (z. B. neue Funktionen oder Fehlerbehebungen) dokumentieren und verwalten:

<img width="612" alt="Desk_1" src="https://github.com/user-attachments/assets/59df3479-cd92-4cc0-9625-be46a630b47a" />

```bash
git init
git add main.py
git commit -m "Initiale Version von main.py"
```

---

### **Wie Git funktioniert**

Git arbeitet lokal – jede Kopie eines Repositories enthält die komplette Historie. Änderungen werden zuerst im **Staging-Bereich** gesammelt und dann mit einem **Commit** gespeichert.

**Beispiel-Ablauf:**

1. Du änderst `main.py`
2. Du speicherst die Änderung:

   ```bash
   git add main.py
   ```
<img width="663" alt="Desk_2" src="https://github.com/user-attachments/assets/66ca1d02-e6f8-4cff-8ba8-eb47cd1af444" />



<img width="763" alt="Creer et effacer-MINGW64__c_Users_patri" src="https://github.com/user-attachments/assets/3975949b-3edc-4b9b-a8c0-d48b86b8db8b" />




<img width="665" alt="Desk_4" src="https://github.com/user-attachments/assets/85ff1ace-8fba-4fca-876c-172e9e299a94" />


3. Du dokumentierst sie:

   ```bash
   git commit -m "Funktion zur Begrüßung hinzugefügt"
   ```
<img width="701" alt="Desk_6" src="https://github.com/user-attachments/assets/4a39379e-dc19-4620-8b3a-7c2176d5d68b" />


---

### **Git-Alternativen**

Es gibt auch andere Versionskontrollsysteme. Hier einige Beispiele:

| Tool          | Beschreibung                                                    |
| ------------- | --------------------------------------------------------------- |
| **SVN**       | Zentrale Versionskontrolle, nicht verteilt                      |
| **Mercurial** | Verteiltes System wie Git, aber einfacher zu bedienen           |
| **Perforce**  | Oft in großen Unternehmen oder bei Spieleentwicklung im Einsatz |

**Beispiel:**
Ein Team entscheidet sich für Mercurial, weil es einfacher ist – jedoch hat Git mehr Community-Support und Integrationen mit GitHub/GitLab.

---

## **3 – Git-Installation**

### **Mac OS-Installation**

**Beispiel:**
Du öffnest das Terminal und gibst ein:

```bash
git --version
```

Wenn Git nicht installiert ist, fragt dein Mac, ob du die **Xcode Command Line Tools** installieren willst. Bestätige dies:

```bash
xcode-select --install
```

---

### **Windows-Installation**

**Beispiel:**

1. Lade den Git-Installer herunter von: [https://git-scm.com](https://git-scm.com)
2. Starte die `.exe`-Datei
3. Wähle in der Installation aus, dass Git Bash installiert wird
4. Nach der Installation öffnest du **Git Bash** und prüfst die Version:

   ```bash
   git --version
   ```

---


Perfekt! Hier ist eine strukturierte und konkrete Erklärung zu deinem Punkt **5 – erstes Git-Repository**, mit praktischen Beispielen, die du direkt in Git Bash ausprobieren kannst:

---

## 🧱 **Was ist ein Git-Repository?**

Ein **Git-Repository** (kurz: *Repo*) ist ein Verzeichnis, das alle Dateien deines Projekts sowie den vollständigen **Verlauf aller Änderungen** enthält.
Es besteht aus zwei Teilen:

<img width="668" alt="Desk_3" src="https://github.com/user-attachments/assets/f52ae4ce-31f1-4494-a5c8-36aef0462abc" />


* dem **Arbeitsverzeichnis** (*Working Directory*)
* und einem versteckten Ordner `.git`, in dem Git alles verwaltet.

---

## 📁 **Arbeitsverzeichnis und `git init`**

Das **Arbeitsverzeichnis** ist der Ort, an dem du deine Projektdateien speicherst (z. B. `.py`, `.html`, `.js`).

### 🛠️ Beispiel: Neues Projektverzeichnis erstellen

```bash
mkdir mein-erstes-projekt
cd mein-erstes-projekt
```
<img width="763" alt="Creer et effacer-MINGW64__c_Users_patri" src="https://github.com/user-attachments/assets/dfa3ef49-c8ea-4e6e-a322-f1ac208769c2" />

---

## 🔄 **Git-Repository initialisieren (`git init`)**

```bash
git init
```

<img width="668" alt="Desk_3" src="https://github.com/user-attachments/assets/993aad82-95c0-4a59-a5af-555d8810fa26" />


🔍 Ergebnis:

* Git erstellt einen versteckten Ordner `.git`
* Das Verzeichnis wird zu einem **lokalen Git-Repository**

Du kannst prüfen:

```bash
ls -a
```

Ausgabe:



<img width="701" alt="Desk_6" src="https://github.com/user-attachments/assets/b834ee96-e60e-4e56-a956-edabbd10e904" />


```
.  ..  .git
```

---

## ⚙️ **Globale vs. lokale Konfiguration**

Git speichert deine Benutzerinformationen, z. B. Name und E-Mail-Adresse, damit jede Änderung einem Autor zugeordnet werden kann.

### 🌍 Globale Konfiguration (gilt für alle Repos):

```bash
git config --global user.name "Max Mustermann"
git config --global user.email "max@example.com"
```

### 📦 Lokale Konfiguration (gilt nur für dieses Repo):

```bash
git config user.name "Projekt Max"
git config user.email "projekt@example.com"
```


<img width="665" alt="Desk_4" src="https://github.com/user-attachments/assets/a6287417-e7e5-411e-9a14-fe42c571b417" />



### 🔍 Aktuelle Konfiguration anzeigen:

```bash
git config --list
```

---

## ✅ Zusammenfassung – erster Ablauf

| Schritt                | Befehl                                | Erklärung                    |
| ---------------------- | ------------------------------------- | ---------------------------- |
| Ordner erstellen       | `mkdir mein-erstes-projekt`           | Projektverzeichnis anlegen   |
| In den Ordner wechseln | `cd mein-erstes-projekt`              | Ins Arbeitsverzeichnis gehen |
| Git initialisieren     | `git init`                            | Repository starten           |
| Benutzer global setzen | `git config --global user.name "..."` | Dein Git-Benutzername        |
| Benutzer lokal setzen  | `git config user.name "..."`          | Gilt nur für aktuelles Repo  |
| Konfiguration anzeigen | `git config --list`                   | Alle aktiven Einstellungen   |

---


### **5 - erstes Git-Repository**

 - Was ist ein Git-Repository

 - Arbeitsverzeichnis und Git Init

 - Arbeitsverzeichnis mit Mkdir erstellen

 - Git-Repository initialisieren (Git Init)

 - Arbeiten mit globaler und lokaler Konfiguration

 - Versteckter .git-Ordner

<img width="701" alt="Desk_6" src="https://github.com/user-attachments/assets/a11273f5-bb68-4136-81d9-3d7c1348d1b3" />

<img width="746" alt="Desk_7" src="https://github.com/user-attachments/assets/d061272d-ef3e-4937-ac5a-e9fed9afaffd" />

### **6 Änderungen nachverfolgen**


1 - Einführung

2 - Aktuellen Status des Repos anzeigen (Git-Status)

3 - Dateien zum Index hinzufügen

4 - Dateien aus dem Staging-Bereich entfernen

5 - Übersicht über Commits

6 - Ihr erster Commit

7 - Mehrere Commits erstellen

8 - Codeänderungen visualisieren (Git Diff)

9 - Commit-Verlauf anzeigen (Git Log)

10 - Inhalt von Commti anzeigen (Git Show)

11 - Head(Kopf)

<img width="720" alt="Desk_8" src="https://github.com/user-attachments/assets/493e9a6a-93d3-4a89-9226-24a90f26d02a" />



<img width="737" alt="Desk-5" src="https://github.com/user-attachments/assets/2159ae69-fed4-4846-91c1-b09ccf432e39" />



### **7 - Entfernte Repositories**

1 - Intro

2 - Verfügbare Cloud-Git-Repositories

3 - Github-Konto erstellen

4 - Github-Dashboard erkunden

5 - Entferntes Git-Repository erstellen

6 - Entferntes Repository einstellen und anzeigen

7 - Lets Try To Push

8 - Ssh-Schlüssel konfigurieren

9 - Push To Remote Repo
