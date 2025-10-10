


## 🔹 1. **Jenkins Agent**

<img width="666" height="302" alt="agents" src="https://github.com/user-attachments/assets/c81a5b00-980e-435c-8d16-f85dfb691918" />



### ✅ Was ist das?

Ein **Jenkins Agent** (früher „Slave“) ist eine Maschine, auf der Jenkins Jobs ausführt. Jenkins selbst (der „Master“ bzw. „Controller“) verteilt Aufgaben an diese Agenten.

### 🛠️ Wozu?

Damit Jenkins parallele Builds oder spezielle Aufgaben (z. B. nur auf Linux/Windows oder mit bestimmten Tools) auf verschiedenen Maschinen ausführen kann.

### 📦 Beispiel:

Du hast einen Jenkins-Controller und zwei Agenten:

* Agent 1: Für Java-Projekte
* Agent 2: Für Node.js-Projekte

---

## 🔹 2. **Docker Push**

### ✅ Was ist das?

`docker push` ist ein **Befehl**, mit dem du ein lokal gebautes Docker-Image in ein zentrales Repository (z. B. Docker Hub oder GitLab Container Registry) **hochlädst**.

### 🛠️ Wozu?

Damit dein Team oder deine Server das gleiche Docker-Image benutzen können – zum Beispiel für **Deployments** in der Produktion.


## 🔹 3. **Shared Library (Jenkins)**

### ✅ Was ist das?

Eine **Shared Library** ist eine Sammlung von **wiederverwendbarem Jenkins-Groovy-Code** (z. B. Pipelines, Schritte, Variablen), den du in mehreren Projekten gemeinsam nutzen kannst.

### 🛠️ Wozu?

Um **DRY (Don't Repeat Yourself)** zu sein – du musst Pipeline-Code nicht in jedem Jenkinsfile neu schreiben, sondern importierst ihn.

### 📦 Beispiel:

```groovy
@Library('meine-shared-library') _

pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          buildJavaProject()  // kommt aus der Shared Library
        }
      }
    }
  }
}
```

---

---

##  Zusammenfassung

| Begriff            | Zweck                                        | Beispiel / Anwendung            |
| ------------------ | -------------------------------------------- | ------------------------------- |
| **Agent**          | Führt Jobs auf entfernten Rechnern aus       | Jenkins Agent auf Docker-VM     |
| **Docker Push**    | Läd dein Image ins Registry hoch             | `docker push myapp:latest`      |
| **Shared Library** | Gemeinsamer, wiederverwendbarer Jenkins-Code | `@Library('my-shared-library')` |

---

## Jenkins Credentials Binding 🔐 Was ist das?

**Credentials Binding** bedeutet:

> Man speichert geheime Daten **verschlüsselt in Jenkins**, und kannst sie in deiner Pipeline **temporär als Umgebungsvariablen** verwenden – sicher und automatisiert.

**Jenkins Credentials Binding** ist ein **Plugin** in Jenkins, das es dir erlaubt, **sicher mit sensiblen Daten** (wie Passwörtern, API-Tokens, SSH-Schlüsseln usw.) in deiner **Pipeline** zu arbeiten – **ohne** sie im Klartext im Code zu speichern.

---

## ✅ Typische Beispiele

* **Docker Login** (Username/Token)
* **GitHub Token**
* **AWS Secrets**
* **SSH-Schlüssel**
* **Datenbank-Passwörter**

---

## 🔧 Wie funktioniert’s?

### 1. **Credential in Jenkins speichern**

1. Jenkins → **Manage Jenkins** → **Credentials**
2. Wähle einen Store (z. B. "Global") → **Add Credentials**
3. Wähle Typ:

   * `Username with password`
   * `Secret text` (z. B. API Token)
   * `SSH Username with private key`
   * `Secret file`

Gib dem Credential einen **ID-Namen**, z. B. `docker-hub-token`

---
<img width="721" height="543" alt="d1" src="https://github.com/user-attachments/assets/c7d2a584-119e-4b1c-bbd1-829681260401" />




<img width="741" height="548" alt="d2" src="https://github.com/user-attachments/assets/4092e929-443d-46cc-9bf3-0b3716582471" />


### 2. **Im `Jenkinsfile` verwenden**

#### 🔹 Beispiel 1: **Secret Text** (z. B. Docker Token)

```groovy
pipeline {
  agent any
  stages {
    stage('Docker Push') {
      steps {
        withCredentials([string(credentialsId: 'docker-hub-token', variable: 'DOCKER_TOKEN')]) {
          sh '''
            echo $DOCKER_TOKEN | docker login -u myuser --password-stdin
            docker build -t myapp .
            docker push myuser/myapp
          '''
        }
      }
    }
  }
}
```



<img width="842" height="607" alt="d3" src="https://github.com/user-attachments/assets/20528a89-e5e6-4747-b93d-2ea3e67202e9" />


<img width="636" height="427" alt="j3" src="https://github.com/user-attachments/assets/07e110e7-cced-4b41-9c6f-c070b891c346" />

#### 🔹 Beispiel 2: **Username + Passwort**

```groovy
withCredentials([usernamePassword(credentialsId: 'my-cred-id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
  sh 'curl -u $USERNAME:$PASSWORD https://example.com'
}
```

#### 🔹 Beispiel 3: **SSH Key**

```groovy
withCredentials([sshUserPrivateKey(credentialsId: 'my-ssh-key', keyFileVariable: 'SSH_KEY')]) {
  sh 'ssh -i $SSH_KEY user@host'
}
```


<img width="715" height="438" alt="d19" src="https://github.com/user-attachments/assets/e183e5b6-8dd6-4a2a-839b-293ebcd3630a" />



---

## 🛡️ Sicherheit

* Die Variablen sind **nur zur Laufzeit** verfügbar.
* Sie werden **nicht im Jenkins-Log angezeigt**.
* Du kannst sie **nicht versehentlich im Klartext ausgeben**, außer du machst z. B. `echo $DOCKER_TOKEN` – was vermieden werden sollte.

---

## 🧠 Zusammenfassung

| Begriff                | Bedeutung                                        |
| ---------------------- | ------------------------------------------------ |
| **Credential Binding** | Sicheres Einfügen von Secrets in Pipelines       |
| **credentialsId**      | Der eindeutige Name deines gespeicherten Secrets |
| **Verwendung**         | `withCredentials { ... }`                        |

---

Nun starte ich  **React + Django App**  als **Docker-Container** . Ziel ist diese App mit **Jenkins** automatisieren!

---

## 📸 Clone Shandaar APP

✅ Ich habe erste :

*  ein Docker-Image namens `react_django_app:latest`
*  es als Container im Hintergrund (`-d`) gestartet
* Port 8000 auf dem Host wird mit Port 8001 im Container verbunden

---

## 🔄 Was passiert technisch?

mein Docker-Container:

* ich starte  **Django im Backend**
* Dient **React im Frontend**
* Beides ist in einem Image kombiniert

---

<img width="686" height="559" alt="d4" src="https://github.com/user-attachments/assets/db138ea7-70b8-4947-bf3b-efbb05376001" />


<img width="721" height="543" alt="d5" src="https://github.com/user-attachments/assets/91cfca20-0d80-4e19-b6a0-da60525f69b9" />


<img width="814" height="520" alt="d6" src="https://github.com/user-attachments/assets/7342acd7-fe8e-484a-87d7-d6310329e49b" />



## ✅ Was habe ich  als Nächstes gemacht ?

### 🔁 1. **Container regelmäßig neu bauen und deployen**

Hier nutze ich  **Jenkins**, um:

* Code aus GitHub zu klonen
* Docker-Image zu bauen
* Container automatisch neu zu starten


<img width="676" height="594" alt="10" src="https://github.com/user-attachments/assets/4ee06d7b-92ad-46e6-b8d6-6967593b809c" />


<img width="713" height="488" alt="11" src="https://github.com/user-attachments/assets/5312af37-b5c8-41d9-8523-0a41e3065a8a" />

<img width="593" height="540" alt="12" src="https://github.com/user-attachments/assets/e9738e1a-d4da-4107-88ce-9462357e0907" />



<img width="555" height="623" alt="13" src="https://github.com/user-attachments/assets/73dee4f0-b7c9-4b6a-837c-30c2140e73e7" />



<img width="618" height="614" alt="14" src="https://github.com/user-attachments/assets/913beae8-a528-4131-ac06-00c45323f7ac" />


<img width="499" height="438" alt="14a" src="https://github.com/user-attachments/assets/8d7fe5b8-5325-4671-b544-5b259e9734e0" />



<img width="573" height="304" alt="14aa" src="https://github.com/user-attachments/assets/b8a53d7e-8d55-4635-9dfc-56625d31e245" />


<img width="772" height="596" alt="14b" src="https://github.com/user-attachments/assets/6ccac500-c4f9-4a92-ab70-0730744374a7" />



### Jenkinsfile für meine App:

```groovy
pipeline {
  agent any
  environment {
    IMAGE_NAME = 'react_django_app'
    IMAGE_TAG = 'latest'
    PORT = '8001'
  }

  stages {
    stage('Clone Repository') {
      steps {
        git 'https://github.com/dein-user/react_django_demo_app.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
      }
    }

    stage('Run Container') {
      steps {
        sh '''
          docker stop $IMAGE_NAME || true
          docker rm $IMAGE_NAME || true
          docker run -d --name $IMAGE_NAME -p ${PORT}:${PORT} $IMAGE_NAME:$IMAGE_TAG
        '''
      }
    }
  }
}
```
---

<img width="712" height="371" alt="16" src="https://github.com/user-attachments/assets/c0781c24-2ca3-43cb-a27b-dea692a51879" />



<img width="761" height="609" alt="16a" src="https://github.com/user-attachments/assets/0dfa15e9-6cae-4183-a1d8-bd00a975c8a6" />



<img width="696" height="414" alt="15" src="https://github.com/user-attachments/assets/43f5f446-3165-4046-aaf8-8849934e3d77" />



## 🧪 Testen

```
http://localhost:8080/

```
<img width="764" height="614" alt="d7" src="https://github.com/user-attachments/assets/dbfd7a27-d497-4107-a910-f19710053c5d" />

---

