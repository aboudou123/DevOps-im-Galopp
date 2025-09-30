
# Lösung - Tag -jenkins


## **1 – Kurz-Checks (vorher)**

# Ubuntu-Version (nur zur Orientierung)
lsb_release -a

# Prüfe ob Port 8080 frei ist (Jenkins Standardport)
sudo ss -tulpn | grep :8080 || echo "Port 8080 frei"

Wenn Port 8080 belegt ist, notiere dir den Prozess oder wähle später einen anderen Port (Anleitung weiter unten).



# 1. System aktualisieren
sudo apt update && sudo apt upgrade -y

# 2. Java (21) installieren - Jenkins benötigt mindestens Java 17
sudo apt install -y fontconfig openjdk-21-jre

# Kontrolle:
java -version

# 3. Jenkins-Repository und Key einrichten
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# 4. Jenkins installieren
sudo apt update
sudo apt install -y jenkins

# 5. Jenkins starten & aktivieren
sudo systemctl enable --now jenkins
sudo systemctl status jenkins --no-pager

# 6. Firewall (falls aktiv) öffnen
sudo ufw allow 8080/tcp || true
sudo ufw reload || true

# 7. Initiales Admin-Passwort anzeigen
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
=====
ea0e426577144bf496420c59eba617ba
=====
http://localhost:8080/

---

## **2 – Erste Schritte mit Jenkins**

Sehr gut 👍 – du bist schon fast fertig!
Schauen wir uns an, wo du gerade stehst:

* Deine Firewall ist **nicht aktiv**, deshalb musst du dir um `ufw` keine Sorgen machen → Jenkins ist von außen über Port **8080** erreichbar.
* Du hast `systemctl enable jenkins` ausgeführt. Das bedeutet: Jenkins startet jetzt automatisch beim Booten.

👉 Jetzt fehlen noch zwei Dinge:

---
<img width="782" height="582" alt="j1" src="https://github.com/user-attachments/assets/c178a021-5b34-42cc-b56c-ede2068f2865" />



<img width="580" height="457" alt="j2" src="https://github.com/user-attachments/assets/0de185fd-74e7-4e11-be9e-bb8e4749e8d3" />



### 1. Jenkins-Dienst starten (falls noch nicht gestartet)

Führe aus:

```bash
sudo systemctl start jenkins
```

und dann den Status prüfen:

```bash
sudo systemctl status jenkins --no-pager
```

Du solltest `Active: active (running)` sehen.
Falls nicht, poste mir die Ausgabe, dann schauen wir in die Logs.

---


<img width="580" height="457" alt="j2" src="https://github.com/user-attachments/assets/206514ae-2d1b-4969-96e9-df750746518c" />



### 2. Jenkins im Browser öffnen

Öffne:

* **Auf deiner VM:** `http://localhost:8080`
* **Vom Host-Rechner auf VirtualBox:** `http://IP_der_VM:8080`
  (IP findest du mit `ip a` → meistens unter `enp0s3` oder `eth0`)

---


<img width="571" height="510" alt="j4" src="https://github.com/user-attachments/assets/599ceddc-691e-468e-9e56-7286ab217611" />



<img width="633" height="397" alt="j5" src="https://github.com/user-attachments/assets/ad5b79c6-aa10-44ce-92e5-c74caa85f81a" />



<img width="856" height="567" alt="j5a" src="https://github.com/user-attachments/assets/ec932ce4-0c24-4a43-99b7-77edc0b22b86" />



### 3. Unlock Jenkins

Du hast das initiale Admin-Passwort schon ausgelesen:

```
ea0e426577144bf496420c59eba617ba
```

👉 Das gibst du jetzt im Browser im Feld **“Administrator password”** ein.

---


<img width="849" height="525" alt="j6" src="https://github.com/user-attachments/assets/8659e79c-e928-4a26-a89e-05470670c772" />



<img width="874" height="543" alt="j8" src="https://github.com/user-attachments/assets/e396910d-8f56-40e5-9856-c539fe761f13" />



### 4. Plugins installieren & Benutzer anlegen

* Wähle **Install suggested plugins**
* Danach → **Create First Admin User** (das ist dein erstes Jenkins-Konto, z. B. `koffi / dein Passwort`).

---

<img width="694" height="355" alt="j9" src="https://github.com/user-attachments/assets/31e5ea3c-b68e-43d7-9d85-ee6818b55326" />

---

Hier Branching, GitHub und täglicher Workflow:

#### Praktisches Beispiel:

---

### 🔹 GitHub -projekt-II



# Vorbereitungen (kurz)

1. Prüfe, ob dein VM Internetzugang hat (damit Jenkins GitHub erreichen kann):

```bash
curl -I https://github.com
```

2. Prüfe, ob Git installiert (auf der VM, nicht Jenkins-Server intern — Jenkins nutzt das Git-Plugin):

```bash
git --version
```

Wenn nicht: `sudo apt install -y git`.

3. Stelle sicher, dass die Plugins vorhanden sind:
   Jenkins → **Manage Jenkins** → **Manage Plugins** → Tab **Installed** → suche nach **Git plugin** und **Pipeline** (Pipeline: Groovy). Falls fehlen: Tab **Available** → suche → installiere → Jenkins ggf. neu starten.

---

# A — Repo auf GitHub anlegen (falls du noch keins hast)

1. Melde dich bei GitHub an.

2. Rechts oben → **New repository**.

   * Name: `jenkins-demo`
   * Public (einfacher) oder Private (siehe unten für Credentials)
   * **Create repository**.

3. Lokales Projekt anlegen und Jenkinsfile hinzufügen (Beispiel; passe `yourusername` an):

```bash
mkdir jenkins-demo
cd jenkins-demo

# Beispiel Jenkinsfile
cat > Jenkinsfile <<'EOF'
pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        // Falls Jenkinsfile im Repo ist, reicht dieses Checkout; ansonsten Jenkins erledigt das automatisch
        git url: 'https://github.com/yourusername/jenkins-demo.git', branch: 'main'
      }
    }
    stage('Build') {
      steps {
        echo "Building..."
        sh 'echo Hello from Jenkins; uname -a; pwd; ls -la'
      }
    }
    stage('Test') {
      steps {
        echo "No tests configured yet"
      }
    }
  }
}
EOF

git init
git add Jenkinsfile
git commit -m "Add Jenkinsfile for demo"
# setze remote-URL, Beispiel:
git remote add origin https://github.com/yourusername/jenkins-demo.git
git branch -M main
git push -u origin main
```

Wenn du beim Push nach Credentials gefragt wirst, melde dich mit deinen GitHub-Daten oder einem PAT (siehe unten).

---

# B — Pipeline-Job in Jenkins erstellen (empfohlen)

1. Jenkins Dashboard → **New Item**.
2. Name: `jenkins-demo-pipeline` → wähle **Pipeline** → **OK**.
3. Im Konfigurationsformular:

   * **Description**: optional.
   * **Discard old builds** etc. nach Wunsch.
   * **Source Code Management**: *ignorieren* hier — wir konfigurieren Pipeline aus SCM weiter unten.
   * Run/Build Triggers: (optional) z.B. `Poll SCM` (z. B. `H/5 * * * *`) oder Webhook (siehe unten).
   * **Pipeline**-Abschnitt:

     * **Definition**: wähle **Pipeline script from SCM**
     * **SCM**: **Git**
     * **Repository URL**: `https://github.com/yourusername/jenkins-demo.git`
     * **Credentials**: *leer* (wenn Repository public).

       * Wenn privat: siehe Abschnitt *Private Repo* weiter unten.
     * **Branches to build**: `*/main` (oder `*/master` falls du master nutzt)
     * **Script Path**: `Jenkinsfile` (Standard)
   * **Save**.
4. Klicke auf **Build Now** (links).
5. Klicke auf die laufende Build-Nummer → **Console Output**, dort siehst du die Schritte (Checkout → Build → …).

---

# C — Freestyle-Job (wenn du lieber GUI / einfache Shell)

1. **New Item** → Name: `jenkins-demo-job` → **Freestyle project** → **OK**.
2. **Source Code Management** → **Git** → Repository URL: `https://github.com/yourusername/jenkins-demo.git` → Branch Specifier: `*/main`

   * **Credentials**: leer (public) oder wähle das vorher angelegte Credential.
3. **Build Triggers** → optional Poll SCM oder GitHub Webhook trigger.
4. **Build** → **Add build step** → **Execute shell** → z. B.:

```sh
echo "Hello from a Freestyle job"
ls -la
```

5. **Save** → **Build Now** → Console Output ansehen.

---

# D — Private Repository: GitHub-Credentials in Jenkins anlegen

Wenn dein Repo privat ist, lege ein Credential an:

1. GitHub: Erzeuge einen **Personal Access Token (PAT)**:

   * GitHub → rechts oben → Settings → Developer settings → Personal access tokens → **Tokens (classic)** → **Generate new token** (oder fein-granularen Token).
   * Scopes: `repo` (für private repo Zugriff) + ggf. `admin:repo_hook` wenn du Hooks durch Jenkins verwalten willst. Kopiere den Token (einmalig sichtbar).

2. In Jenkins: **Manage Jenkins** → **Manage Credentials** → Domain `(global)` → **Add Credentials**:

   * **Kind**: *Username with password*

     * Username: dein GitHub-Benutzername
     * Password: der PAT (als „Password“)
     * ID/Description: z. B. `github-pat-yourname`
   * **Save**.

3. Verwende dieses Credential in deinem Job (unter SCM → Credentials).

**Alternative SSH:** Erzeuge SSH-Key auf Jenkins-Server oder auf deinem Rechner und füge öffentlichen Schlüssel zu GitHub (Settings → SSH and GPG keys). In Jenkins dann als **SSH Username with private key** anlegen. (SSH kann einfacher sein, wenn du SSH bereits verwendest.)

---

# E — Auto-Trigger: GitHub Webhook vs Polling

* **Polling** (funktioniert lokal): Job → Configure → Build Triggers → **Poll SCM** → z. B. `H/5 * * * *` (alle 5 Minuten). Einfach und funktioniert auch wenn Jenkins nicht von Internet erreichbar ist.
* **Webhook (Push-events)**: GitHub → Repository → Settings → Webhooks → **Add webhook**:

  * Payload URL: `http://<DEINE_JENKINS_IP>:8080/github-webhook/`
    (z. B. `http://192.168.56.101:8080/github-webhook/`)
  * Content type: `application/json`
  * Events: **Just the push event**
  * **Add webhook**
    → In Jenkins Job: Configure → Build Triggers → **GitHub hook trigger for GITScm polling** aktivieren.
    Hinweis: Für Webhooks muss GitHub Jenkins erreichen (Jenkins muss öffentlich erreichbar sein oder per Port-Forwarding / ngrok).

---

# F — Praktische Beispiele & Copy/Paste-Snippets

**Minimaler Jenkinsfile (Deklarative Pipeline)** — kopiere in dein Repo:

```groovy
pipeline {
  agent any
  stages {
    stage('Checkout & Build') {
      steps {
        git url: 'https://github.com/yourusername/jenkins-demo.git', branch: 'main'
        sh 'echo Hello from Jenkins; ls -la'
      }
    }
  }
}
```

**Jenkins Console Output anzeigen**:
Jenkins → Job → Build # → **Console Output**.

---

# G — Troubleshooting (häufige Probleme)

* **Fehler beim Checkout** → Credentials falsch: neu anlegen (Manage Credentials).
* **Network/Timeout** → VM hat kein Internetzugang; prüfe `curl https://github.com`.
* **Jenkinsfile-Syntaxfehler** → Console Output zeigt Fehlermeldungen; prüfe Groovy-Syntax.
* **Webhook nicht auslösbar** → GitHub kann deine VM nicht erreichen (lokale VM ohne forwarding) → verwende Poll SCM oder richte Portforward/Ngrok ein.
* Logs: `sudo journalctl -u jenkins -n 200 --no-pager`
* Plugin-Problem: Manage Plugins → installiere fehlende Plugins (Git, GitHub, Pipeline).

# Jenkins service Status / Logs

sudo systemctl status jenkins

sudo journalctl -u jenkins -n 200 --no-pager

# Prüfe Datei mit initial password

sudo ls -l /var/lib/jenkins/secrets/initialAdminPassword

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Port prüfen

sudo ss -tulpn | grep :8080

# Paketversion anzeigen

apt policy jenkins


---

Wenn du willst, mache ich jetzt direkt eins von beiden (einfach copy-paste, ohne Rückfragen):

1. Erstelle Schritt-für-Schritt die Dateien & `git`-Befehle für ein neues Repo (ich liefere die genauen Befehle mit `yourusername` ersetzt), **oder**
2. Ich schreibe dir die exakten Klick-/Feldwerte für deinen Jenkins-Job (Pipeline from SCM) zum copy-paste in die WebUI.

Sag kurz welche Variante (1 oder 2) du willst — oder ich liefere beides sofort.
