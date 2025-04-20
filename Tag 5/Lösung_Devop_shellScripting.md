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


 **Übungsprojekt** 
 
Schreiben ein DevOps-Shell-Skript  – zum Beispiel zum **automatischen Setup eines Servers** oder einer kleinen **CI/CD-Pipeline mit Git**.




Super Wahl! Hier ist ein einfaches **DevOps-Shell-Skript für das automatische Setup eines Servers**, z. B. für ein neues Ubuntu/Linux-System. Dieses Skript:

- Führt Updates durch  
- Installiert wichtige Pakete (Git, Docker, Node.js)  
- Klont ein Git-Repository  
- Startet eine Beispielanwendung (z. B. Node.js-App mit Docker)

---

### 📦 Beispiel: **Server Setup & Deployment einer Node.js-App**

```bash
#!/bin/bash

# Script Name: server-setup.sh
# Beschreibung: Automatisiert das Setup eines neuen Servers für eine Node.js-App mit Docker
# Autor: Du 😊

echo "🚀 Starte Server Setup..."

# 1. System aktualisieren
echo "🔄 System aktualisieren..."
sudo apt update && sudo apt upgrade -y

# 2. Wichtige Tools installieren
echo "🛠️ Installiere Git, Curl, Docker, Node.js..."
sudo apt install -y git curl docker.io

# 3. Docker starten und aktivieren
sudo systemctl start docker
sudo systemctl enable docker

# 4. Node.js installieren (LTS-Version via nvm)
echo "⬇️ Installiere Node.js..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install --lts

# 5. Repository klonen
echo "📁 Klone das Git-Repository..."
git clone https://github.com/USERNAME/my-nodejs-app.git /opt/my-nodejs-app

# 6. Anwendung starten (Beispiel mit Docker)
echo "🐳 Starte App mit Docker..."
cd /opt/my-nodejs-app
docker build -t my-node-app .
docker run -d -p 3000:3000 --name my-node-app-container my-node-app

echo "✅ Setup abgeschlossen! Die App läuft unter http://<SERVER-IP>:3000"
```

---

### ✅ Voraussetzungen:
- Du ersetzt `https://github.com/USERNAME/my-nodejs-app.git` durch dein eigenes Repo.
- Die App enthält ein `Dockerfile` und läuft auf Port `3000`.

---

### 📌 Wie führst du das Skript aus?

1. Speichere es z. B. als `server-setup.sh`
2. Mache es ausführbar:
   ```bash
   chmod +x server-setup.sh
   ```
3. Führe es aus:
   ```bash
   ./server-setup.sh
   ```

---

 Gib ein Beispiel für eine **Mini-CI/CD-Pipeline mit Git Hooks oder GitLab CI** . 
 
 
 
**zwei einfache Beispiele** für Mini-CI/CD-Pipelines:


1. ✅ Mit **Git Hooks** (lokal oder auf dem Server)  
2. 🚀 Mit **GitLab CI/CD** (automatisch bei jedem Push)

---

## ✅ **1. Beispiel mit Git Hooks (lokal oder auf dem Server)**

**Ziel**: Bei jedem `git push` wird automatisch ein **Test-Skript ausgeführt**, um sicherzustellen, dass der Code funktioniert (z. B. Unit Tests oder Linting).

### 📁 Datei: `.git/hooks/pre-push`

```bash
#!/bin/bash

echo "🔍 Führe Tests vor dem Push aus..."

# Beispiel: npm tests oder ein statisches Analyse-Tool
npm test

# Prüfen, ob Tests erfolgreich waren
if [ $? -ne 0 ]; then
  echo "❌ Tests sind fehlgeschlagen. Push abgebrochen!"
  exit 1
fi

echo "✅ Tests bestanden. Push wird fortgesetzt."
exit 0
```

### 🛠️ Aktivieren:
1. Speichern unter `.git/hooks/pre-push`
2. Datei ausführbar machen:
   ```bash
   chmod +x .git/hooks/pre-push
   ```

Das Skript wird **lokal** jedes Mal vor einem `git push` ausgeführt.

---

## 🚀 **2. Beispiel mit GitLab CI/CD**

**Ziel**: Automatisch bei jedem Push in GitLab:

- App installieren
- Tests ausführen
- Bei Erfolg: Deployment mit Docker starten

### 📄 Datei: `.gitlab-ci.yml`

```yaml
stages:
  - install
  - test
  - deploy

variables:
  DOCKER_HOST: tcp://docker:2375/

before_script:
  - echo "Starte CI/CD-Prozess"

install:
  stage: install
  script:
    - apt-get update -y
    - apt-get install -y nodejs npm
    - npm install

test:
  stage: test
  script:
    - npm test

deploy:
  stage: deploy
  only:
    - main
  script:
    - echo "Starte Deployment"
    - docker build -t my-node-app .
    - docker run -d -p 3000:3000 my-node-app
```

---

### 🔐 Optional: GitLab Runner & SSH-Zugriff einrichten

Für das Deployment brauchst du:

- Einen **GitLab Runner**, der das Projekt ausführt
- Evtl. **SSH-Zugang** zu deinem Server
- **Docker installiert** auf dem Runner/Server

---

### 🧪 Tipp: Mini-Projekt zum Üben

Wenn du willst, können wir zusammen:
- Ein Node.js-Projekt mit Git einrichten
- Einen einfachen GitLab-Runner simulieren (z. B. lokal mit Docker)
- Deine eigene Pipeline live testen

 **GitLab**, **GitHub Actions** oder nur **lokalen Git Hooks** .
 

Jetzt einen vollständigen **Mini-DevOps-Workflow**, der sowohl **lokale Git Hooks** als auch eine **GitLab CI/CD-Pipeline** kombiniert. Damit kannst du lokal erste Fehler vermeiden **(Prevention)** und auf dem GitLab-Server den **automatisierten Build/Test/Deploy** durchführen.

---

## ✅ TEIL 1: **Git Hook – Lokale Tests vor dem Push**

### 📁 Datei: `.git/hooks/pre-push`

```bash
#!/bin/bash

echo "🔍 [Pre-Push] Führe lokale Tests aus..."

# 1. Node.js-Tests ausführen
npm test

# 2. Bei Fehlern abbrechen
if [ $? -ne 0 ]; then
  echo "❌ Tests fehlgeschlagen. Push wird gestoppt."
  exit 1
fi

echo "✅ Tests bestanden. Push läuft weiter..."
exit 0
```

### 🛠️ Aktivieren:
```bash
chmod +x .git/hooks/pre-push
```

🧠 **Vorteil**: Du pusht nur sauberen Code ins Repo.

---

## 🚀 TEIL 2: **GitLab CI/CD – Automatisierung in der Cloud**

### 📄 Datei: `.gitlab-ci.yml`

```yaml
stages:
  - install
  - test
  - deploy

default:
  image: node:18 # Verwende Node.js Docker-Image

install:
  stage: install
  script:
    - echo "📦 Installiere Abhängigkeiten"
    - npm install

test:
  stage: test
  script:
    - echo "🧪 Führe Tests aus"
    - npm test

deploy:
  stage: deploy
  only:
    - main
  script:
    - echo "🚀 Deployment wird vorbereitet"
    - docker build -t my-node-app .
    - docker run -d -p 3000:3000 --name my-node-app my-node-app
```

---

## 🧪 Was du brauchst, um es zu testen:

### 🔧 1. Node.js-Projekt mit Tests
Beispiel-Datei `package.json`:

```json
{
  "name": "my-node-app",
  "scripts": {
    "test": "echo \"Tests erfolgreich!\" && exit 0"
  }
}
```

### 🐳 2. Dockerfile (für das Deployment)

```Dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "index.js"]
```

### 💻 3. GitLab-Projekt mit aktiviertem CI/CD
- Push dein Projekt zu GitLab
- Aktiviere in GitLab das CI/CD-Feature
- Wenn du willst, kannst du mit GitLab einen **Runner einrichten** oder **einen Shared Runner** nutzen

---

## 🎯 Warum beides?

| Git Hooks (lokal)         | GitLab CI/CD (remote)           |
|---------------------------|----------------------------------|
| Verhindert schlechte Pushes | Automatisiert Build & Deployment |
| Schnell & lokal            | Unabhängig & für alle sichtbar  |
| Entwickler-fokussiert      | DevOps/prod-fokussiert          |

---





 Ein **Starter-Repository** vorbereiten mit allen Dateien (Hooks, GitLab CI, Dockerfile, Tests etc.), oder ich kann dir zeigen, wie du das lokal mit einem GitLab Runner in Docker testest.  


Super! Dann lass uns direkt loslegen mit einem **Starter-Projekt**, das du lokal verwenden oder auf GitLab hochladen kannst. Es enthält:

- 📁 Ein einfaches Node.js-Projekt  
- 🧪 Einen Dummy-Test  
- 🐳 Einen Dockerfile  
- 🛠️ Einen Git Hook für lokale Tests  
- 🚀 Eine `.gitlab-ci.yml` für CI/CD

---

## 📦 Projektstruktur

```
my-node-app/
│
├── .git/
│   └── hooks/
│       └── pre-push         # Git Hook für lokale Tests
├── .gitlab-ci.yml           # GitLab CI/CD Pipeline
├── Dockerfile               # Container für Deployment
├── index.js                 # Simple App
├── package.json             # npm-Konfiguration
└── README.md
```

---

## 🧾 Inhalte der Dateien

### `index.js`

```js
const http = require('http');

const server = http.createServer((req, res) => {
  res.end('Hallo aus meiner Node.js-App!');
});

server.listen(3000, () => {
  console.log('🚀 Server läuft auf http://localhost:3000');
});
```

---

### `package.json`

```json
{
  "name": "my-node-app",
  "version": "1.0.0",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"✅ Dummy-Test bestanden!\" && exit 0"
  }
}
```

---

### `Dockerfile`

```Dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]
```

---

### `.git/hooks/pre-push`

```bash
#!/bin/bash
echo "🧪 Lokale Tests werden vor dem Push ausgeführt..."
npm test

if [ $? -ne 0 ]; then
  echo "❌ Fehler: Tests sind fehlgeschlagen. Push wird abgebrochen."
  exit 1
fi

echo "✅ Tests erfolgreich. Push wird fortgesetzt."
exit 0
```

➡️ Mach den Hook ausführbar:
```bash
chmod +x .git/hooks/pre-push
```

---

### `.gitlab-ci.yml`

```yaml
stages:
  - install
  - test
  - deploy

default:
  image: node:18

install:
  stage: install
  script:
    - npm install

test:
  stage: test
  script:
    - npm test

deploy:
  stage: deploy
  only:
    - main
  script:
    - echo "🚀 Deployment wird simuliert..."
    - docker build -t my-node-app .
    - docker run -d -p 3000:3000 my-node-app
```

---

## 🚀 Nächste Schritte

1. 👉 **Lokal testen** mit `npm test` und dem Git Hook  
2. 📤 Push das Projekt zu [GitLab.com](https://gitlab.com/)  
3. ➕ Aktiviere CI/CD und beobachte den Pipeline-Prozess  
4. Optional: **GitLab Runner** einrichten oder lokalen Runner starten

---

📁 **ZIP-Datei mit allen Dateien sende** 

 
 
 
 Perfekt! Lass uns gemeinsam das Projekt Schritt für Schritt in deiner Umgebung aufbauen. 🎯  
Wir erstellen eine kleine Node.js-App mit Git, einem lokalen Git Hook für Tests und einem GitLab-CI/CD-Workflow.

---

## 🛠️ **SCHRITT 1: Neues Projekt anlegen**

Öffne dein Terminal oder deinen Code-Editor und gib ein:

```bash
mkdir my-node-app && cd my-node-app
npm init -y
```

---

## 🧾 **SCHRITT 2: Projektdateien erstellen**

### ➕ `index.js`

```bash
touch index.js
```

Dann schreibe Folgendes hinein:

```js
const http = require('http');

const server = http.createServer((req, res) => {
  res.end('Hallo aus meiner Node.js-App!');
});

server.listen(3000, () => {
  console.log('🚀 Server läuft auf http://localhost:3000');
});
```

---

### 📦 `package.json` (automatisch erstellt, aber wir fügen ein Test-Skript hinzu)

Bearbeite deine `package.json` → `"scripts"` Abschnitt:

```json
"scripts": {
  "start": "node index.js",
  "test": "echo \"✅ Dummy-Test bestanden!\" && exit 0"
}
```

---

## 🧪 **SCHRITT 3: Git initialisieren & Hook einrichten**

### Git initialisieren:

```bash
git init
```

### Pre-Push-Hook anlegen:

```bash
mkdir -p .git/hooks
touch .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

Füge folgendes in die Datei `.git/hooks/pre-push` ein:

```bash
#!/bin/bash
echo "🧪 Lokale Tests werden vor dem Push ausgeführt..."
npm test

if [ $? -ne 0 ]; then
  echo "❌ Fehler: Tests sind fehlgeschlagen. Push wird abgebrochen."
  exit 1
fi

echo "✅ Tests erfolgreich. Push wird fortgesetzt."
exit 0
```

---

## 🐳 **SCHRITT 4: Dockerfile hinzufügen**

```bash
touch Dockerfile
```

Inhalt:

```Dockerfile
FROM node:18
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]
```

---

## 📄 **SCHRITT 5: GitLab-CI einrichten**

```bash
touch .gitlab-ci.yml
```

Inhalt:

```yaml
stages:
  - install
  - test
  - deploy

default:
  image: node:18

install:
  stage: install
  script:
    - npm install

test:
  stage: test
  script:
    - npm test

deploy:
  stage: deploy
  only:
    - main
  script:
    - echo "🚀 Deployment wird simuliert..."
    - docker build -t my-node-app .
    - docker run -d -p 3000:3000 my-node-app
```

---

## 🔃 **SCHRITT 6: Erste Git-Commits**

```bash
git add .
git commit -m "Initial commit"
```

---

## ☁️ **SCHRITT 7: Auf GitLab hochladen**

1. Erstelle ein neues Projekt auf [gitlab.com](https://gitlab.com/)
2. Füge dein GitLab-Repo als Remote hinzu:

```bash
git remote add origin https://gitlab.com/dein-nutzername/my-node-app.git
```

3. Push dein Projekt:

```bash
git push -u origin main
```

🚨 Falls `main` nicht existiert:

```bash
git branch -M main
git push -u origin main
```

---

## 🎉 Fertig!

Nun hast du:
- Lokale Tests beim Push  
- Eine laufende CI/CD-Pipeline in GitLab  
- Eine deploybare Node.js-App mit Docker  

---

💬 Willst du als Nächstes:

- Die App auf einen echten Server deployen?  
- Echte Tests (z. B. mit `jest`) hinzufügen?  
- Einen GitLab-Runner lokal einrichten?


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 