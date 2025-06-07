
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



3. Du dokumentierst sie:

   ```bash
   git commit -m "Funktion zur Begrüßung hinzugefügt"
   ```
<img width="701" alt="Desk_6" src="https://github.com/user-attachments/assets/4a39379e-dc19-4620-8b3a-7c2176d5d68b" />



<img width="763" alt="Creer et effacer-MINGW64__c_Users_patri" src="https://github.com/user-attachments/assets/3975949b-3edc-4b9b-a8c0-d48b86b8db8b" />

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

### **Linux-Installation**

**Beispiel für Ubuntu/Debian:**

```bash
sudo apt update
sudo apt install git
git --version
```

**Beispiel für Fedora:**

```bash
sudo dnf install git
```

---

Wenn du möchtest, erkläre ich dir als Nächstes:

* wie du dein erstes Repository erstellst
* wie Branches funktionieren
* oder wie man mit GitHub arbeitet.

Möchtest du das?



<img width="665" alt="Desk_4" src="https://github.com/user-attachments/assets/85ff1ace-8fba-4fca-876c-172e9e299a94" />















1 - Einführung



2 - Erste Schritte mit Git

- Was ist Git
- Wie Git funktioniert
- Git-Alternativen

3 - Git-Installation


- Mac OS-Installation
- Windows-Installation
- Linux-Installation

4 - Git-Befehle

 - Git-Befehle
 - Git-Hilfe
 - Hinzufügen von Konfigurationen (Git Config)


5 - erstes Git-Repository

 - Was ist ein Git-Repository

 - Arbeitsverzeichnis und Git Init

 - Arbeitsverzeichnis mit Mkdir erstellen

 - Git-Repository initialisieren (Git Init)

 - Arbeiten mit globaler und lokaler Konfiguration

 - Versteckter .git-Ordner

<img width="701" alt="Desk_6" src="https://github.com/user-attachments/assets/a11273f5-bb68-4136-81d9-3d7c1348d1b3" />

<img width="746" alt="Desk_7" src="https://github.com/user-attachments/assets/d061272d-ef3e-4937-ac5a-e9fed9afaffd" />

7 )Änderungen nachverfolgen


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










7 - Entfernte Repositories

1 - Intro

2 - Verfügbare Cloud-Git-Repositories

3 - Github-Konto erstellen

4 - Github-Dashboard erkunden

5 - Entferntes Git-Repository erstellen

6 - Entferntes Repository einstellen und anzeigen

7 - Lets Try To Push

8 - Ssh-Schlüssel konfigurieren

9 - Push To Remote Repo








Le cours sur le thème DevOps s'adresse principalement à :

Développeurs : qui veulent apprendre à déployer, tester, et automatiser leurs applications.

Administrateurs systèmes (SysAdmins) : qui veulent automatiser l'infrastructure et gérer des environnements cloud.

Ingénieurs Cloud / Infrastructure : pour mieux intégrer développement et exploitation (AWS, Azure, etc.).

Testeurs / QA Engineers : pour automatiser les tests et les déploiements continus.

Chefs de projet IT / Product Owners : pour comprendre les pratiques agiles, CI/CD, et les outils DevOps.

Étudiants en informatique : qui souhaitent élargir leurs compétences pratiques en ingénierie moderne.

Personnes en reconversion professionnelle : voulant passer vers un métier plus technique et recherché.

En résumé :
👉 Toute personne qui veut combiner développement, opérations et automatisation dans des projets logiciels.

Veux-tu aussi que je te donne les compétences de base qu'il faut pour bien démarrer en DevOps ? 🚀
(Ça pourrait t'aider à voir si tu es prêt ou ce qu’il faudrait apprendre avant !)



1.
🚀 Plongez dans l’univers du DevOps et découvrez comment automatiser, déployer et sécuriser vos projets IT avec les outils et méthodes des leaders du secteur.

2.
⚙️ Vous voulez maîtriser l’intégration continue, le déploiement rapide et la collaboration entre développeurs et opérations ? Ce cours DevOps est fait pour vous !

3.
🌟 Apprenez à transformer vos compétences techniques et à construire des infrastructures modernes, résilientes et évolutives grâce aux pratiques DevOps.

4.
📈 Optimisez vos projets grâce à une approche DevOps : automatisation, cloud, CI/CD... Un cours pratique et accessible, pour tous ceux qui veulent évoluer dans l’IT d’aujourd’hui.

5.
💡 Du développement à la production : devenez acteur de la révolution DevOps et propulsez vos projets avec des workflows agiles et performants.



















Aufgabe 1: Anzeigen des Inhalts einer Datei und Angabe der Zeilennummern.



Aufgabe 2: Ändern Sie die Zugriffsrechte von Dateien, so dass sie nur vom Eigentümer gelesen, geschrieben und ausgeführt werden können.



Aufgabe 3: Prüfen Sie die zuletzt von Ihnen ausgeführten 10 Befehle.



Augabe 4: Entfernen eines Verzeichnisses und seines gesamten Inhalts.



Augabe 5: Erstellen Sie eine Datei `koffit.txt`, fügen Sie den Inhalt hinzu (eine Frucht pro Zeile), und zeigen Sie den Inhalt an.




Augabe 6: Fügen Sie den Inhalt der Datei `Galopp.txt` hinzu (eine in jeder Zeile) - Apfel, Mango, Banane, Kirsche, Kiwi, Orange, Guave. Fügen Sie dann „Ananas“ an das Ende der Datei an..



Augabe 7: Zeigen Sie die ersten drei Früchte aus der Datei in umgekehrter Reihenfolge.




Augabe 8: Zeigen Sie die untersten drei Früchte aus der Datei und sortieren Sie sie dann alphabetisch.




Augabe 9: Erstellen Sie eine weitere Datei `flagge.txt`, fügen Sie den Inhalt hinzu (eine Farbe pro Zeile), und zeigen Sie den Inhalt an..




Augabe 10: Fügen Sie den Inhalt der Datei `flagge.txt` hinzu (eine in jeder Zeile) - Rot, Rosa, Weiß, Schwarz, Blau, Orange, Lila, Grau. Dann fügen Sie „Gelb“ am Anfang der Datei ein..




Augabe 11: Finde die Zeilen, die `fruits.txt` und `Colors.txt` gemeinsam haben, und zeige sie an.




Augabe 12: Zählen Sie die Anzahl der Zeilen, Wörter und Zeichen in `fruits.txt` und `flagge.txt`..




