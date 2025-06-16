
---

# **Mehrschichtige Anwendung mit CI/CD-Pipeline**

Dieses Projekt demonstriert eine **mehrschichtige Anwendung**, die auf AWS mit **Terraform** für die Infrastrukturbereitstellung und **Jenkins** für CI/CD-Automatisierung bereitgestellt wird. Die Anwendung wird in einem **Amazon EKS-Cluster** bereitgestellt, und die Pipeline umfasst Schritte zum Bauen, Testen, Sicherheits-Scannen und Deployen.

---

## **Inhaltsverzeichnis**

1. [Projektübersicht](#projektübersicht)
2. [Infrastrukturaufbau](#infrastrukturaufbau)
3. [CI/CD-Pipeline](#cicd-pipeline)
4. [Voraussetzungen](#voraussetzungen)
5. [Anleitung zur Nutzung](#anleitung-zur-nutzung)
6. [Ausgaben](#ausgaben)
7. [Beitragen](#beitragen)
8. [Lizenz](#lizenz)

---

## **Projektübersicht**

Dieses Projekt beinhaltet:

* **Terraform-Code** zur Bereitstellung der AWS-Infrastruktur:

  * VPC, Subnetze, Internet-Gateway, Routing-Tabellen und Sicherheitsgruppen.
  * Amazon EKS-Cluster mit einer verwalteten Node-Gruppe.
* **Jenkins-Pipeline** für CI/CD:

  * Code-Checkout, Kompilierung, Tests und Sicherheitsüberprüfung.
  * Docker-Image bauen und in Docker Hub hochladen.
  * Bereitstellung im EKS-Cluster.

---

## **Infrastrukturaufbau**

Die Infrastruktur wird mit Terraform bereitgestellt. Folgende Ressourcen werden erstellt:

* **VPC**: `10.0.0.0/16` mit 2 öffentlichen Subnetzen.
* **EKS-Cluster**: Kubernetes-Cluster mit verwalteter Node-Gruppe.
* **Sicherheitsgruppen**: Für den EKS-Cluster und die Worker-Nodes.
* **IAM-Rollen**: Für die Berechtigungen des EKS-Clusters und der Node-Gruppe.

### **Terraform-Dateien**

* `main.tf`: Definiert die AWS-Ressourcen.
* `variables.tf`: Enthält Eingabevariablen (z. B. SSH-Schlüsselname).
* `outputs.tf`: Gibt die IDs der erstellten Ressourcen aus.

---

## **CI/CD-Pipeline**

Die Jenkins-Pipeline automatisiert folgende Schritte:

1. **Git Checkout**: Klont das Repository.
2. **Kompilierung**: Kompiliert das Maven-Projekt.
3. **Tests**: Führt Unit-Tests durch.
4. **Trivy FS Scan**: Durchsucht das Dateisystem nach Schwachstellen.
5. **SonarQube-Analyse**: Führt statische Code-Analyse durch.
6. **Build**: Packt die Anwendung in eine JAR-/WAR-Datei.
7. **Veröffentlichung in Nexus**: Legt das Artefakt im Nexus-Repository ab.
8. **Docker Build**: Baut ein Docker-Image der Anwendung.
9. **Trivy Image Scan**: Überprüft das Docker-Image auf Sicherheitslücken.
10. **Docker Push**: Überträgt das Docker-Image zu Docker Hub.
11. **Deployment in K8s**: Stellt die Anwendung im EKS-Cluster bereit.
12. **Bereitstellung prüfen**: Überprüft den Status von Pods und Services.

---


<img width="477" alt="jenky" src="https://github.com/user-attachments/assets/4abb1fd8-310c-497f-be6d-4ea0e83b18fc" />






## **Voraussetzungen**

Bevor du dieses Projekt verwendest, stelle sicher, dass du Folgendes hast:

1. **AWS-Konto**: Mit ausreichenden Berechtigungen für VPC, EKS und IAM.
2. **Terraform**: Lokal installiert.
3. **Jenkins**: Installiert und mit den benötigten Plugins (Docker, Kubernetes, Maven) konfiguriert.
4. **Docker-Hub-Konto**: Zum Hochladen von Docker-Images.
5. **Nexus-Repository**: Zum Speichern von Maven-Artefakten.
6. **SonarQube-Server**: Für statische Codeanalyse.
7. **SSH-Schlüsselpaar**: Für den Zugriff auf EKS-Worker-Nodes.

---

## **Anleitung zur Nutzung**

### **1. Infrastruktur mit Terraform bereitstellen**

1. Klone das Repository:

   ```bash
   git clone https://github.com/MosubAhmed/Multi-Tier-With-Database.git
   ```
2. Terraform initialisieren:

   ```bash
   terraform init
   ```
3. Terraform-Konfiguration anwenden:

   ```bash
   terraform apply
   ```

   Gib die erforderlichen Variablen an (z. B. ssh\_key\_name).

Nach der Bereitstellung gibt Terraform folgende Ausgaben aus:

* EKS-Cluster-ID
* Node-Group-ID
* VPC-ID
* Subnet-IDs

---

### **2. Jenkins konfigurieren**

1. Richte folgende Zugangsdaten in Jenkins ein:

   * **Docker Hub**: Zum Hochladen von Docker-Images.
   * **Kubernetes-Token**: Für die Bereitstellung im EKS-Cluster.
   * **Nexus-Zugangsdaten**: Zum Veröffentlichen von Maven-Artefakten.

2. Konfiguriere die Jenkins-Pipeline mit den richtigen Tools (z. B. Maven, Docker, SonarQube Scanner).

3. Pipeline ausführen:

   * Manuell starten oder über einen Git-WebHook triggern.
   * Die Pipeline-Schritte im Jenkins-Dashboard überwachen.

---

## **Ausgaben**

Nach dem Ausführen von `terraform apply` werden folgende Ausgaben angezeigt:

* **Cluster-ID**: Die ID des EKS-Clusters.
* **Node-Group-ID**: Die ID der Node-Gruppe.
* **VPC-ID**: Die ID des Virtual Private Cloud Netzwerks.
* **Subnet-IDs**: Die IDs der Subnetze.

---

## **Beitragen**

Beiträge sind willkommen! Bitte folge diesen Schritten:

1. Forke das Repository.
2. Erstelle einen neuen Branch für dein Feature oder deinen Bugfix.
3. Reiche einen Pull-Request mit einer detaillierten Beschreibung deiner Änderungen ein.

---

## **Lizenz**

Dieses Projekt ist unter der MIT-Lizenz lizenziert. Siehe die Datei `LICENSE` für weitere Details.

---

## **Danksagung**

* **Terraform** – Für Infrastructure as Code.
* **Jenkins** – Für CI/CD-Automatisierung.
* **Amazon EKS** – Für verwaltetes Kubernetes.

---
