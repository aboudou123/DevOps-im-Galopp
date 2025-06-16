🔧 **Projektübersicht: "Kubernetes Bookstore"**

Ziel: Du deployst eine einfache "Bookstore"-Webanwendung (Frontend + Backend + DB) zuerst auf einem lokalen Kubernetes-Cluster, dann auf einem Cloud-Kubernetes-Cluster.

🚀 **Projektstruktur in zwei Phasen**

🧱 Phase 1: Vanilla Kubernetes lokal mit Ubuntu (Minikube oder Kind)

* Cluster lokal einrichten (Minikube oder Kind)

* Containerisierte Anwendung bauen & deployen

* Netzwerk (Services, Ingress) einrichten

* Persistent Volumes & ConfigMaps einsetzen

* Monitoring mit Prometheus + Grafana (optional)

☁️ Phase 2: **Cloud-Integration (z. B. GKE, EKS oder AKS)
Cloud-Kubernetes-Cluster aufsetzen (z. B. GKE via Google Cloud CLI)**

* CI/CD Deployment vorbereiten (z. B. GitHub Actions + kubectl)

* Secrets & Configs in der Cloud verwalten (z. B. mit KMS oder Vault)

* Logging und Monitoring in der Cloud

* Zugriff absichern (RBAC, Network Policies)

📦 **Technologien:**

* Ubuntu 22.04+

* Kubernetes (Minikube oder Kind lokal, GKE später)

* Docker

* kubectl, helm

* Git

* GitHub Actions (CI/CD)

* YAML (für Kubernetes Manifeste)
(Optional: Prometheus, Grafana, Vault)

📘 **Phase 1 Schritt-für-Schritt – Lokales Kubernetes mit Minikube**
🔹 Schritt 1: Minikube + kubectl installieren
* bash
* Kopieren
* Bearbeiten
* sudo apt update
* sudo apt install -y curl apt-transport-https


<img width="709" alt="kub1" src="https://github.com/user-attachments/assets/1d538de5-91ee-428a-b8dc-6bb2a86911c0" />


# kubectl installieren
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

<img width="742" alt="kub2" src="https://github.com/user-attachments/assets/739eb2c2-3060-4cdb-90bd-082f72cbb0d1" />


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


<img width="719" alt="kub3" src="https://github.com/user-attachments/assets/db1cd885-77d1-45cc-a291-f3ff431587c9" />




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



<img width="719" alt="kub3" src="https://github.com/user-attachments/assets/b310b434-2ddb-4973-9e5b-996afa1c22de" />


<img width="677" alt="kub4" src="https://github.com/user-attachments/assets/6f615a94-fcf2-4ede-9965-97dcba801d06" />



<img width="677" alt="kub5" src="https://github.com/user-attachments/assets/cd0635a9-8b21-4881-afa9-d10d20daea89" />




<img width="641" alt="kub6" src="https://github.com/user-attachments/assets/5818cbaf-c97b-4b42-9aeb-58d711c4d6d3" />




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

<img width="641" alt="kub6" src="https://github.com/user-attachments/assets/29335c1c-f70f-4c61-bbc0-cffd0fa0fc7f" />



<img width="774" alt="kub8" src="https://github.com/user-attachments/assets/01ef553b-af19-4e2c-abb1-86f2e278ffb8" />



<img width="688" alt="kub12" src="https://github.com/user-attachments/assets/e30bf0e4-f141-4ee0-adcd-6278d73e5133" />



<img width="968" alt="kub13" src="https://github.com/user-attachments/assets/d801f019-cd15-4efd-9ce6-42ebc5dd8ac0" />





<img width="930" alt="kub15" src="https://github.com/user-attachments/assets/b0f1b65f-d93b-497a-bdbd-aefd06412232" />




<img width="714" alt="kub18" src="https://github.com/user-attachments/assets/bf33fd60-dbb3-4f75-984f-e5a8a34e909c" />



<img width="667" alt="kub20" src="https://github.com/user-attachments/assets/2bbdcd11-6b1b-4377-940c-c8770a1aea1d" />




## Kommt in 1 Wooche## 

# Oder Helm installieren und Prometheus stack deployen

☁️ Phase 2: Deployment in die Cloud (GKE Beispiel)
Wenn du bereit bist, machen wir weiter mit:

GCP-Konto + Projekt einrichten

gcloud CLI installieren

GKE-Cluster erstellen

Anwendung per kubectl deployen

Optional: CI/CD mit GitHub Actions



„Start Phase 2“ → Wir gehen gleich in die Cloud (z. B. Google GKE, EKS, oder AKS)
