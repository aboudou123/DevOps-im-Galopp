
## 🚀 Tag 17 – Docker-Projekt für angehende DevOps Engineers

Willkommen zum **Tag 17** der **#30DaysOfDevOps**-Challenge!

---

## 🔹 Grundidee von Docker – einfach erklärt

Stell dir vor, eine Firma hat mehrere Teams:

* Team A entwickelt eine App in **Python 3.11**
* Team B nutzt **Java 17**
* Team C arbeitet mit einer **alten Datenbank-Version**

Ohne Docker gibt es oft Probleme:

* Ein Entwickler installiert Python 3.11, ein anderer nur 3.8 → die App läuft nicht gleich.
* Unterschiedliche Betriebssysteme (Windows, Linux, Mac) → wieder Probleme.
* Wenn die App auf den Server kommt, fehlen Bibliotheken → Deployment-Fehler.

👉 **Mit Docker** packt jedes Team seine Anwendung mit allem, was sie braucht (Laufzeit, Bibliotheken, Konfigurationen), in einen **Container**.
Dieser Container läuft **überall gleich** – auf dem Laptop, im Testsystem, in der Cloud.

---

## 🔹 Praxisbeispiel in einer Firma

Nehmen wir eine **E-Commerce-Firma** (z. B. einen Online-Shop).

* **Ohne Docker**

  * Entwickler programmieren auf unterschiedlichen Laptops.
  * Beim Test auf dem Server treten Fehler auf („fehlende Abhängigkeit“, „falsche Version“).
  * Der Betrieb verbringt viel Zeit mit „Fehler-Suche und Reparieren“.

* **Mit Docker**

  1. Das Entwicklerteam erstellt ein **Docker-Image** für den Online-Shop (z. B. `shop:1.0`).
     → Enthält: Code + Node.js-Laufzeit + Bibliotheken + Konfiguration.
  2. Dieses Image wird in einem **Container gestartet** → läuft identisch bei jedem Entwickler und auf jedem Server.
  3. Für die Datenbank (z. B. MySQL) gibt es einen eigenen Container.
  4. Beide Container werden kombiniert (Shop + Datenbank).

  Ergebnis:

  * Entwickler arbeiten ohne Versionskonflikte.
  * Der Betrieb kann den Shop mit **einem einzigen Befehl** starten oder updaten.
  * Skalierung: Bei vielen Kundenanfragen startet das Unternehmen einfach mehrere Shop-Container.

---

## 🔹 Metapher zum leichteren Verständnis

Ein **Container** ist wie ein **Schiffscontainer**:

* Du packst deine Ware (App + Abhängigkeiten) hinein.
* Egal ob das Schiff, der Zug oder der LKW – der Container passt überall.
* Inhalt bleibt **gleich und sicher verpackt**.

Genauso sorgt Docker dafür, dass deine App immer gleich läuft – egal wo.

---

👉 Kurz gesagt:

* **Für Entwickler**: weniger Stress, mehr Geschwindigkeit.
* **Für Firmen**: weniger Kosten, mehr Stabilität, einfaches Skalieren.

---
---

## 🔹 1. Was ist Docker?

Docker ist eine **Container-Plattform**, mit der Anwendungen zusammen mit ihren Abhängigkeiten (z. B. Bibliotheken, Laufzeitumgebungen, Konfigurationen) in sogenannten **Containern** verpackt und ausgeführt werden.

👉 Ein **Container** ist eine Art leichtgewichtige „Box“, die die Anwendung isoliert, sodass sie überall gleich läuft – egal ob auf einem Entwickler-Laptop, einem Server im Rechenzentrum oder in der Cloud.

---

## 🔹 2. Nutzen von Docker für die Entwicklung einer Anwendung

* **Gleiche Umgebung für alle Entwickler** → kein *„läuft bei mir, aber nicht bei dir“*.
* **Schneller Start**: Container starten in Sekunden, was Tests und Deployment beschleunigt.
* **Portabilität**: Ein Docker-Image kann überall laufen (lokal, Cloud, CI/CD).
* **Einfache Integration in CI/CD-Pipelines** (z. B. mit Jenkins, GitLab CI).
* **Isolierung**: Entwickler können mehrere Versionen derselben Software testen, ohne Konflikte.

---

## 🔹 3. Nutzen von Docker für ein Unternehmen

* **Kosteneffizienz**: Mehrere Container teilen sich denselben Host, bessere Ressourcenauslastung als bei virtuellen Maschinen.
* **Schnellere Bereitstellung neuer Funktionen**: Agileres Arbeiten, kürzere Release-Zyklen.
* **Skalierbarkeit**: In Kombination mit Kubernetes lassen sich Anwendungen leicht hoch- und runterskalieren.
* **Flexibilität**: Anwendungen können einfach zwischen Cloud-Anbietern oder eigenen Servern verschoben werden.
* **Wettbewerbsvorteil**: Unternehmen können schneller auf Marktänderungen reagieren.

---

## 🔹 4. Beitrag von Docker zur Sicherheit

* **Isolierung**: Jede Anwendung läuft in ihrem eigenen Container → Angriffe oder Fehler bleiben begrenzt.
* **Reduzierte Angriffsfläche**: Container enthalten nur, was wirklich gebraucht wird (im Gegensatz zu einer ganzen VM).
* **Unveränderbare Images (Immutable Infrastructure)**: Ein Container-Image ist fix definiert → keine unkontrollierten Änderungen im Betriebssystem.
* **Schnelles Patchen**: Sicherheitsupdates können durch einfaches Rebuild & Redeploy des Containers verteilt werden.
* **Security-Scanning**: Mit Tools wie *Trivy* oder *Clair* können Container-Images automatisch auf Schwachstellen überprüft werden.

---

👉 Zusammengefasst:

* **Docker ist eine Container-Technologie.**
* **Für Entwickler:** schnellere, konsistente, portable Entwicklung.
* **Für Unternehmen:** Agilität, Kostenersparnis, Skalierbarkeit.
* **Für Sicherheit:** Isolierung, kleinere Angriffsfläche, schnelles Patchen.



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
