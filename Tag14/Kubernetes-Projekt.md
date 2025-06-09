 **praxisnahes Kubernetes-Projekt**, bei dem du lernst, **eine Container-Plattform lokal mit Vanilla Kubernetes** aufzusetzen und sie anschließend **in eine Cloud-Umgebung zu integrieren** (z. B. GKE – Google Kubernetes Engine). Du arbeitest dabei mit Ubuntu.

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
