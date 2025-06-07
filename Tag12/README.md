

## 🚀 Tag 17 – Docker-Projekt für angehende DevOps Engineers

Willkommen zum **Tag 17** der **#30DaysOfDevOps**-Challenge!
Heute wird es besonders praxisnah – wir erstellen unser erstes eigenes Docker-Projekt! 🐳


## 🧱 Was ist ein Dockerfile?

**Docker** ist eine Plattform, mit der sich Anwendungen in sogenannten *Containern* ausführen lassen.
Container enthalten alles, was eine Anwendung benötigt – also Code, Laufzeitumgebung, Abhängigkeiten und Konfiguration – und machen sie damit portabel und leichtgewichtig.

Ein **Dockerfile** ist eine einfache Textdatei, die Docker Schritt für Schritt erklärt, wie ein Container-Image aufgebaut werden soll.
Typische Angaben sind z. B.:

* Welches **Basis-Image** verwendet wird (z. B. `python:3.12` oder `node:20`)
* Welche **Pakete oder Abhängigkeiten** installiert werden sollen
* Welche **Dateien** in den Container kopiert werden
* Welcher **Startbefehl** beim Ausführen des Containers ausgeführt werden soll

---

## 🎯 Ziel der Aufgabe

Erstelle ein funktionsfähiges Docker-Projekt für eine einfache Webanwendung und teile es mit der Welt!

### ✅ Aufgabenübersicht:

1. **Erstelle ein Dockerfile** für eine einfache Webanwendung
   – z. B. mit Node.js, Python (Flask/FastAPI) oder einer statischen HTML-Seite

2. **Baue dein Docker-Image** mit dem erstellten Dockerfile

   ```bash
   docker build -t meine-webapp .
   ```

3. **Starte einen Container** aus dem Image

   ```bash
   docker run -d -p 8080:80 meine-webapp
   ```

4. **Teste die Anwendung im Browser**
   Rufe `http://localhost:8080` auf und überprüfe, ob die Anwendung läuft.

5. **(Optional) Veröffentliche dein Image** auf einem Container-Registry
   z. B. Docker Hub oder GitHub Container Registry:

   ```bash
   docker tag meine-webapp deinname/meine-webapp
   docker push deinname/meine-webapp
   ```

---

## 🧑‍💻 Beispielideen für Webanwendungen:

* Ein einfacher "Hello World"-Webserver mit **Python Flask**
* Eine ToDo-API mit **FastAPI**
* Eine statische HTML-Seite mit **nginx**

---

## 📚 Lerneffekt

Mit dieser Übung lernst du:

* den Aufbau und Zweck eines Dockerfiles
* wie man Container-Images baut, startet und testet
* wie man ein Docker-Projekt öffentlich teilt – wie es DevOps Engineers in der Praxis täglich tun

---
