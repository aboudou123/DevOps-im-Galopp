# Lösung - Tag 

koffi@koffi-VirtualBox:~$ history
    1  cat -n
    2  #!/bin/bash
    3  echo "Docker wird installiert..."
    4  sudo apt update
    5  vim project
    6  cat project
    7  #!/bin/bash
    8  echo "Docker wird installiert..."
    9  sudo apt update
   10  sudo apt install -y docker.io
   11  echo "Docker erfolgreich installiert!"
   12  #!/bin/bash
   13  grep "ERROR" /var/log/app.log | wc -l
   14  tar -czf /backup/app_$(date +%F).tar.gz /home/user/myapp/
   15  echo "Backup abgeschlossen am $(date)"
   16  tar -czf /backup/app_$(date +%F).tar.gz /home/user/myapp/
   17  backup.sh
   18  nano backup.sh
   19  sudo apt update
   20  sudo apt install -y curl apt-transport-https
   21  # kubectl installieren
   22  curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   23  chmod +x kubectl
   24  sudo mv kubectl /usr/local/bin/
   25  # Minikube installieren
   26  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
   27  sudo install minikube-linux-amd64 /usr/local/bin/minikube
   28  minikube start --driver=docker
   29  kubectl get nodes
   30  sudo snap install kubectl --classic
   31  kubectl get nodes
   32  git clone https://github.com/kelseyhightower/kubernetes-the-hard-way
   33  # Oder eine eigene App z. B. mit Flask/Node.js/Postgres
   34  vim deployment.yaml
   35  minikube addons enable ingress
   36  # Ingress-Ressource definieren (z. B. bookstore.local)
   37  kubectl get pods -n ingress-nginx
   38  vim hello-ingress.yaml
   39  kubectl apply -f hello-ingress.yaml
   40  sudo nano /etc/hosts
   41  vim hello-ingress.yaml
   42  kubectl get ingress
   43  http://hello.local
   44  kubectl get service
   45  vim hello-node.yaml
   46  kubectl apply -f hello-node.yaml
   47  vim hello-ingress.yaml
   48  kubectl get pods
   49  kubectl get service
   50  kubectl get ingress
   51  kubectl describe pod hello-node-69847cdb8b-tkwp7
   52  vim hello-node.yaml
   53  kubectl delete pod hello-node-69847cdb8b-tkwp7
   54  kubectl apply -f hello-node.yaml
   55  kubectl get pods -l app=hello-node
   56  kubectl describe pod -l app=hello-node
   57  vim hello-node.yaml
   58  kubectl apply -f hello-node.yaml
   59  kubectl get pods -l app=hello-node
   60  ___
   61  cler
   62  clear
   63  vim hello-node.yaml
   64  kubectl apply -f hello-node.yaml
   65  kubectl get pods -l app=hello-node
   66  vim hello-node.yaml
   67  kubectl apply -f hello-node.yaml
   68  kubectl delete pod -l app=hello-node
   69  kubectl apply -f hello-node.yaml
   70  kubectl get pods -l app=hello-node
   71  vim hello-node.yaml
   72  kubectl apply -f hello-node.yaml
   73  kubectl delete pod -l app=hello-node
   74  vim hello-node.yaml
   75  kubectl apply -f hello-node.yaml
   76  kubectl delete pod -l app=hello-node
   77  kubectl get pods -l app=hello-node
   78  minikube addons enable metrics-server
   79  kubectl get pods -n kube-system | grep metrics-server
   80  kubectl top pod
   81  kubectl top nodes
   82  curl https://sdk.cloud.google.com | bash
   83  exec -l $SHELL
   84  gcloud auth login
   85  gcloud auth login --no-launch-browser
   86  gcloud projects list
   87  gcloud config set project modern-voice-462422-a3
   88  gcloud container clusters create my-cluster --zone us-central1-a --num-nodes=1
   89  m
   90  history
