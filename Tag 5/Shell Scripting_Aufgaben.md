Erklärung von **Shell Scripting im Kontext von DevOps** :

---

## 🧠 **Was ist Shell Scripting in eigenen Worten?**

**Shell Scripting** bedeutet, eine Reihe von Befehlen in eine Datei zu schreiben, die dann **automatisch** vom Computer ausgeführt werden können. Man verwendet sie in der sogenannten **Shell** – das ist die Kommandozeile (z. B. Bash unter Linux). Statt jeden Befehl manuell einzugeben, schreibt man alle Befehle in ein Skript.

Ein Shell Script ist also wie ein „Rezept“, das sagt, was der Computer Schritt für Schritt machen soll.

---

## 🚀 **Warum ist Shell Scripting wichtig für DevOps?**

In **DevOps** geht es um **Automatisierung** – also darum, manuelle Aufgaben effizient und zuverlässig durch Skripte zu ersetzen. Shell Scripting hilft dabei, viele **Routinearbeiten** zu automatisieren, zum Beispiel:

- Server einrichten
- Backups erstellen
- Logs analysieren
- Software installieren
- CI/CD-Prozesse (Build, Test, Deploy) anstoßen

---

## 📦 **Beispiel 1: Software automatisch installieren**

Ein DevOps-Engineer möchte sicherstellen, dass auf allen Servern **Docker** installiert ist. Anstatt das manuell auf jedem Server zu machen, schreibt er ein Skript:

```bash
#!/bin/bash

echo "Docker wird installiert..."
sudo apt update
sudo apt install -y docker.io
echo "Docker erfolgreich installiert!"
```

Dieses Skript kann dann auf vielen Servern gleichzeitig ausgeführt werden – **schnell und fehlerfrei**.

---

## 📄 **Beispiel 2: Log-Dateien automatisch analysieren**

Ein einfaches Shell Script, das die Anzahl der Fehler (Error Logs) in einer Datei zählt:

```bash
#!/bin/bash

grep "ERROR" /var/log/app.log | wc -l
```

Das ist nützlich, um zu sehen, ob eine Anwendung plötzlich viele Fehler produziert.

---

## 🔄 **Beispiel 3: Tägliches Backup eines Verzeichnisses**

```bash
#!/bin/bash

tar -czf /backup/app_$(date +%F).tar.gz /home/user/myapp/
echo "Backup abgeschlossen am $(date)"
```

Jeden Tag wird ein neues Backup mit Datum erstellt – automatisch!

---

## 📈 **Vorteile von Shell Scripting in DevOps**

✅ Spart Zeit  
✅ Vermeidet menschliche Fehler  
✅ Macht Prozesse wiederholbar und dokumentiert  
✅ Kann in **CI/CD-Pipelines** (z. B. mit Jenkins, GitLab CI) integriert werden

---



 **Übungsprojekt** 
 
1-Schreiben ein DevOps-Shell-Skript  – zum Beispiel zum **automatischen Setup eines Servers** oder einer kleinen **CI/CD-Pipeline mit Git**.

2-Gib ein Beispiel für eine **Mini-CI/CD-Pipeline mit Git Hooks oder GitLab CI**

(ollständigen Mini-DevOps-Workflow, der sowohl lokale Git Hooks als auch eine GitLab CI/CD-Pipeline kombiniert. Damit kannst du lokal erste Fehler vermeiden (Prevention) und auf dem GitLab-Server den automatisierten Build/Test/Deploy durchführen)

3-Starter-Repository vorbereiten mit allen Dateien (Hooks, GitLab CI, Dockerfile, Tests etc.), oder ich kann dir zeigen, wie du das lokal mit einem GitLab Runner in Docker testest
(Projekt Schritt für Schritt in meiner Umgebung aufbauen)
ErstellT eine kleine Node.js-App mit Git, einem lokalen Git Hook für Tests und einem GitLab-CI/CD-Workflow