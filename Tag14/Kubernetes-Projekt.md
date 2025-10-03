
# Überblick: DevOps-Ingenieur – Lern- und Werkzeugkette

**DevOps** bedeutet nicht nur Tools, sondern eine Kultur und ein Prozess: Entwicklung und Betrieb enger verzahnen, alles automatisieren, Infrastruktur wie Code behandeln, Anwendungen reproduzierbar paketieren, skalierbar betreiben und kontinuierlich überwachen.
Das Ziel: **kontinuierliche, zuverlässige und schnelle Auslieferung von Software**.

---

## Chronologische Lernreihenfolge (präzise Abhängigkeiten)

### 1. **Grundlagen: Betriebssystem, Netzwerk, Skripting**

* **Tools/Skills:** Linux (Shell, Prozesse, Rechte), TCP/IP, DNS, SSH, Bash, Python.
* **Warum zuerst:** Fast alle DevOps-Tools laufen auf Linux. Ohne Verständnis von Prozessen, Logs oder Netzwerken kann man später Fehler nicht analysieren.
* **Abhängigkeit:** Alles baut darauf auf.
* **Ohne dieses Wissen:** Man versteht nicht, warum ein Container oder Pod abstürzt oder warum ein Service nicht erreichbar ist.

---

### 2. **Versionskontrolle: Git**

* **Tools:** Git + Plattformen (GitHub, GitLab, Bitbucket).
* **Warum hier:** Jedes CI/CD-System startet Builds/Deployments von Commits. Branches, Merges und Pull Requests sind das Fundament.
* **Abhängigkeit:** Voraussetzung für CI/CD.
* **Ohne Git:** Keine Automatisierung, keine Rückverfolgbarkeit, keine Teamarbeit.

---

### 3. **CI/CD-Pipelines**

* **Tools:** Jenkins, GitHub Actions, GitLab CI, CircleCI.
* **Warum nach Git:** Pipelines überwachen Repositories und starten automatisch Builds/Tests bei neuen Commits.
* **Abhängigkeit:** Git → CI.
* **Ohne CI/CD:** Alles muss manuell gebaut und deployed werden → Fehleranfällig.

---

### 4. **Containerisierung: Docker / Podman**

* **Tools:** Docker (Dockerfile, CLI), Alternativen: Podman, Buildah.
* **Warum hier:** Anwendungen werden in Images verpackt, die in jeder Umgebung gleich laufen. CI/CD produziert oft Docker-Images.
* **Abhängigkeit:** CI → erzeugt Images → Docker.
* **Ohne Container:** Keine reproduzierbaren Deployments, Kubernetes hätte nichts zu starten.

---

### 5. **Container-Registry**

* **Tools:** Docker Hub, GitHub Container Registry, AWS ECR, Artifactory.
* **Warum nach Docker:** Images müssen gespeichert und verteilt werden.
* **Abhängigkeit:** Docker-Image muss zuerst existieren.
* **Ohne Registry:** Kubernetes oder Deployments können das Image nicht laden.

---

### 6. **Orchestrierung: Kubernetes**

* **Tools:** Kubernetes (k8s), leichtgewichtige Varianten: k3s, Minikube.
* **Warum nach Docker:** Kubernetes startet und verwaltet Container – es braucht fertige Images.
* **Abhängigkeit:** Container-Images + Registry.
* **Ohne Docker-Know-how:** Man versteht nicht, was in einem Pod läuft oder warum er fehlschlägt.

---

### 7. **Infrastructure as Code (Provisionierung + Konfiguration)**

* **Tools:** Terraform (Provisionierung: VMs, Netzwerke, Cluster), Ansible (Konfiguration: Pakete, User, Dienste).
* **Reihenfolge:** Zuerst Terraform → Ressourcen erstellen, dann Ansible → Systeme konfigurieren.
* **Abhängigkeit:** Cluster/VM muss existieren, bevor man sie konfiguriert.
* **Ohne IaC:** Keine reproduzierbaren Infrastrukturen, fehleranfällige manuelle Konfiguration.

---

### 8. **Deployment-Tools für Kubernetes**

* **Tools:** Helm (Charts), Kustomize, GitOps-Tools (ArgoCD, Flux).
* **Warum hier:** Kubernetes-Deployments werden komplex – Helm oder GitOps macht sie wiederholbar und versionskontrolliert.
* **Abhängigkeit:** Kubernetes muss laufen, Images müssen verfügbar sein.
* **Ohne Helm/GitOps:** Schwerfällige und manuelle Deployments.

---

### 9. **Netzwerk & Sicherheit**

* **Tools:** CNI-Plugins (Calico, Flannel), Ingress Controller (NGINX, Traefik), RBAC, Network Policies.
* **Warum hier:** Ohne Netzwerkeinstellungen funktioniert Kubernetes nicht zuverlässig.
* **Abhängigkeit:** Kubernetes muss laufen.
* **Ohne Security & Netzwerk:** Unsichere Cluster, Kommunikationsprobleme, unkontrollierter Zugriff.

---

### 10. **Observability (Monitoring, Logging, Tracing)**

* **Tools:** Prometheus (Metriken), Grafana (Dashboards), ELK / Loki (Logs), Jaeger (Traces).
* **Warum hier:** Erst wenn Anwendungen laufen, macht Überwachung Sinn.
* **Abhängigkeit:** Deployments existieren → erst dann Metriken sammeln.
* **Ohne Monitoring:** Keine Transparenz, schweres Debugging im Fehlerfall.

---

### 11. **Secret Management**

* **Tools:** Kubernetes Secrets, Sealed Secrets, HashiCorp Vault.
* **Warum hier:** Credentials und API-Keys sicher verwalten.
* **Abhängigkeit:** CI/CD + Deployments, die Secrets benötigen.
* **Ohne Secrets-Management:** Sicherheitsrisiko, Passwörter im Klartext im Repo.

---

### 12. **Fortgeschrittenes: Service Mesh, Autoscaling, Chaos Engineering**

* **Tools:** Istio/Linkerd (Service Mesh), HPA/VPA (Autoscaling), Chaos Monkey.
* **Warum zuletzt:** Nur sinnvoll, wenn Basis-Setup stabil ist.
* **Abhängigkeit:** Funktionierendes Kubernetes + Monitoring.
* **Ohne Basis:** Komplexität ohne Nutzen.

---

## Klare Abhängigkeitskette (vereinfacht)

1. **Linux/Netzwerk →**
2. **Git →**
3. **CI/CD →**
4. **Docker (Container) →**
5. **Registry →**
6. **Kubernetes →**
7. **Terraform (Infra) + Ansible (Konfig) →**
8. **Helm / GitOps →**
9. **Monitoring (Prometheus/Grafana) →**
10. **Security / Secrets →**
11. **Service Mesh / Scaling / Chaos**

---

## Mini-Beispiel (praktischer Ablauf)

1. Git-Commit → löst Pipeline (GitHub Actions) aus.
2. CI/CD → baut Docker-Image und pusht es in Registry.
3. Terraform → erstellt Kubernetes-Cluster (z.B. EKS).
4. Helm → deployt die App mit Image aus Registry.
5. Prometheus + Grafana → überwachen CPU, RAM, Errors.
6. Vault → verwaltet Datenbank-Passwort.

→ Jede Stufe liefert das Input für die nächste. Ohne eine Stufe **bricht die Kette**.

---

 **praxisnahes Kubernetes-Projekt**,  
 du lernst **eine Container-Plattform lokal mit Vanilla Kubernetes** und anschließend wie man es **in eine Cloud-Umgebung  integriert** (z. B. GKE – Google Kubernetes Engine). Du arbeitest dabei mit Ubuntu.

---

## 🔧 **Projektübersicht: "Kubernetes Bookstore"**

Ziel: Du deployst eine einfache "Bookstore"-Webanwendung (Frontend + Backend + DB) zuerst auf einem **lokalen Kubernetes-Cluster**, dann auf einem **Cloud-Kubernetes-Cluster**.

---

## 🚀 **Projektstruktur in zwei Phasen**

### 🧱 **Phase 1: Vanilla Kubernetes lokal mit Ubuntu (Minikube oder Kind)**

1. **Cluster lokal einrichten (Minikube oder Kind)**
2. **Containerisierte Anwendung bauen & deployen**
3. **Netzwerk (Services, Ingress) einrichten**
4. **Persistent Volumes & ConfigMaps einsetzen**
5. **Monitoring mit Prometheus + Grafana (optional)**

---

### ☁️ **Phase 2: Cloud-Integration (z. B. GKE, EKS oder AKS)**

6. **Cloud-Kubernetes-Cluster aufsetzen (z. B. GKE via Google Cloud CLI)**
7. **CI/CD Deployment vorbereiten (z. B. GitHub Actions + kubectl)**
8. **Secrets & Configs in der Cloud verwalten (z. B. mit KMS oder Vault)**
9. **Logging und Monitoring in der Cloud**
10. **Zugriff absichern (RBAC, Network Policies)**

---

## 📦 Technologien:

* Ubuntu 22.04+
* Kubernetes (Minikube oder Kind lokal, GKE später)
* Docker
* kubectl, helm
* Git
* GitHub Actions (CI/CD)
* YAML (für Kubernetes Manifeste)
* (Optional: Prometheus, Grafana, Vault)

---

## 📘 Phase 1 Schritt-für-Schritt – Lokales Kubernetes mit Minikube

### 🔹 **Schritt 1: Minikube + kubectl installieren**

```bash
sudo apt update
sudo apt install -y curl apt-transport-https

# kubectl installieren
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Minikube installieren
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

---

### 🔹 **Schritt 2: Minikube starten**

```bash
minikube start --driver=docker
kubectl get nodes
```

---

### 🔹 **Schritt 3: Beispiel-App klonen**

```bash
git clone https://github.com/kelseyhightower/kubernetes-the-hard-way
# Oder eine eigene App z. B. mit Flask/Node.js/Postgres
```

---

### 🔹 **Schritt 4: App als Pods + Services deployen**

Erstelle `deployment.yaml`, `service.yaml`, `ingress.yaml` z. B. für ein einfaches Flask-Backend:

```yaml
# backend-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: backend
  template:
    metadata:
      labels:
        app: backend
    spec:
      containers:
      - name: backend
        image: myregistry/bookstore-backend:latest
        ports:
        - containerPort: 5000
```

---

### 🔹 **Schritt 5: Ingress aktivieren & testen**

```bash
minikube addons enable ingress

# Ingress-Ressource definieren (z. B. bookstore.local)
```

---

### 🔹 **Schritt 6: App testen**

```bash
minikube service backend --url
```

---

### 🔹 **Schritt 7 (optional): Monitoring einrichten**

```bash
minikube addons enable metrics-server
# Oder Helm installieren und Prometheus stack deployen
```

---

## ☁️ **Phase 2: Deployment in die Cloud (GKE Beispiel)**

Wenn du bereit bist, machen wir weiter mit:

1. GCP-Konto + Projekt einrichten
2. `gcloud` CLI installieren
3. GKE-Cluster erstellen
4. Anwendung per `kubectl` deployen
5. Optional: CI/CD mit GitHub Actions

---

### ✅ Möchtest du jetzt mit **Phase 1 starten**, und ich leite dich Schritt für Schritt durch (inkl. YAML-Dateien), oder gleich mit der Cloud-Phase?

👉 Sag einfach:

* „Start Phase 1“ → Ich führe dich direkt durch Minikube + lokales Deployment
* „Start Phase 2“ → Wir gehen gleich in die Cloud (z. B. Google GKE, EKS, oder AKS)

Oder wenn du eigene Vorstellungen für die App hast (z. B. andere Services oder Sprache), passe ich alles individuell für dich an.
