##🔧Projektübersicht: "Kubernetes Bookstore ##

Ziel: Du deployst eine einfache "Bookstore"-Webanwendung (Frontend + Backend + DB) zuerst auf einem lokalen Kubernetes-Cluster, dann auf einem Cloud-Kubernetes-Cluster.

🚀 Projektstruktur in zwei Phasen

🧱 Phase 1: Vanilla Kubernetes lokal mit Ubuntu (Minikube oder Kind)
Cluster lokal einrichten (Minikube oder Kind)

Containerisierte Anwendung bauen & deployen

Netzwerk (Services, Ingress) einrichten

Persistent Volumes & ConfigMaps einsetzen

Monitoring mit Prometheus + Grafana (optional)

☁️ Phase 2: Cloud-Integration (z. B. GKE, EKS oder AKS)
Cloud-Kubernetes-Cluster aufsetzen (z. B. GKE via Google Cloud CLI)

CI/CD Deployment vorbereiten (z. B. GitHub Actions + kubectl)

Secrets & Configs in der Cloud verwalten (z. B. mit KMS oder Vault)

Logging und Monitoring in der Cloud

Zugriff absichern (RBAC, Network Policies)

📦 Technologien:
Ubuntu 22.04+

Kubernetes (Minikube oder Kind lokal, GKE später)

Docker

kubectl, helm

Git

GitHub Actions (CI/CD)

YAML (für Kubernetes Manifeste)

(Optional: Prometheus, Grafana, Vault)

📘 Phase 1 Schritt-für-Schritt – Lokales Kubernetes mit Minikube

🔹 Schritt 1: Minikube + kubectl installieren
bash
Kopieren
Bearbeiten
sudo apt update
sudo apt install -y curl apt-transport-https

# kubectl installieren
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Minikube installieren
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

🔹 Schritt 2: Minikube starten
bash
Kopieren
Bearbeiten
minikube start --driver=docker
kubectl get nodes

🔹 Schritt 3: Beispiel-App klonen
bash
Kopieren
Bearbeiten
git clone https://github.com/kelseyhightower/kubernetes-the-hard-way
# Oder eine eigene App z. B. mit Flask/Node.js/Postgres
🔹 Schritt 4: App als Pods + Services deployen
Erstelle deployment.yaml, service.yaml, ingress.yaml z. B. für ein einfaches Flask-Backend:

yaml
Kopieren
Bearbeiten
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
🔹 Schritt 5: Ingress aktivieren & testen
bash
Kopieren
Bearbeiten
minikube addons enable ingress

# Ingress-Ressource definieren (z. B. bookstore.local)
🔹 Schritt 6: App testen
bash
Kopieren
Bearbeiten
minikube service backend --url
🔹 Schritt 7 (optional): Monitoring einrichten
bash
Kopieren
Bearbeiten
minikube addons enable metrics-server
# Oder Helm installieren und Prometheus stack deployen
☁️ Phase 2: Deployment in die Cloud (GKE Beispiel)
Wenn du bereit bist, machen wir weiter mit:

GCP-Konto + Projekt einrichten

gcloud CLI installieren

GKE-Cluster erstellen

Anwendung per kubectl deployen

Optional: CI/CD mit GitHub Actions

✅ Möchtest du jetzt mit Phase 1 starten, und ich leite dich Schritt für Schritt durch (inkl. YAML-Dateien), oder gleich mit der Cloud-Phase?
👉 Sag einfach:

„Start Phase 1“ → Ich führe dich direkt durch Minikube + lokales Deployment

„Start Phase 2“ → Wir gehen gleich in die Cloud (z. B. Google GKE, EKS, oder AKS)
