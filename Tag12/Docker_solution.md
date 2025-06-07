
# Tag 12 Antworten: Docker-Projekt für DevOps-Ingenieure

### Ihr macht das einfach großartig bei **#30DevOps-im-Galopp**. Die heutige Herausforderung ist etwas ganz Besonderes, denn ihr werdet ein DevOps-Projekt mit Docker durchführen. Seid ihr aufgeregt? 😍

# Dockerfile

Docker ist ein Tool, das es einfach macht, Anwendungen in Containern auszuführen. Container sind wie kleine Pakete, die alles enthalten, was eine Anwendung zum Laufen braucht. Um diese Container zu erstellen, verwenden Entwickler etwas, das man ein Dockerfile nennt.

Ein Dockerfile ist wie eine Reihe von Anweisungen zur Erstellung eines Containers. Es sagt Docker, welches Basis-Image verwendet werden soll, welche Befehle auszuführen sind und welche Dateien enthalten sein sollen. Wenn man zum Beispiel einen Container für eine Website erstellen würde, könnte das Dockerfile Docker anweisen, ein offizielles Webserver-Image zu verwenden, die Dateien der Website in den Container zu kopieren und den Webserver zu starten, wenn der Container gestartet wird.


## Aufgaben mit Antworten


**1. Erstellen Sie ein Dockerfile für eine einfache Webanwendung (z. B. eine Node.js oder Python-Anwendung)**
   - **1. Erstellen Sie eine einfache Flask-Anwendung**
      - Erstellen Sie ein neues Verzeichnis für Ihr Projekt und navigieren Sie dorthin:

   
   **Antwort**
   
![image
(https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/1_Create_a_new_directory.png)

      - App.py' und fügen Sie den folgenden Inhalt hinzu:

      
   **Antwort**
   
![image] (https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/2_app_py.png)

       - Eine Datei mit dem Namen `requirements.txt` erstellen und den folgenden Inhalt hinzufügen:

   **Antwort**

![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/3_Create_a_requirements_file.png)

   - **2. Dockerfile erstellen**
      - Erstellen Sie eine Datei namens „Dockerfile“ im selben Verzeichnis und fügen Sie den folgenden Inhalt hinzu:
     **Antwort**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/4_Create_a_Dockerfile.png)


- **2. Dockerfile erstellen**
      - Erstellen Sie eine Datei namens „Dockerfile“ im selben Verzeichnis und fügen Sie den folgenden Inhalt hinzu:

      **Antwort**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/5_build_the_docker_image.png)

    Ausführen des Containers
      - Um den Container zu starten, verwenden Sie den folgenden Befehl:

  **Antwort**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/6_Run_the_Container.png)

**3. Überprüfen Sie, ob die Anwendung wie erwartet funktioniert, indem Sie in einem Webbrowser auf sie zugreifen**
   - Öffnen Sie Ihren Webbrowser und navigieren Sie zu `http://localhost:5000`. Sie sollten die Meldung „Hello, World!“ sehen.

      **Antwort**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/7_Verify_the_Application.png)

**4. Pushen Sie das Abbild in ein öffentliches oder privates Repository (z. B. Docker Hub)**.
   - Um das Image in Docker Hub zu pushen, müssen Sie es mit Ihrem Docker Hub-Benutzernamen und dem Namen des Repositorys markieren und es dann pushen.

   - **2. Push the Image**

      **Antwort**
     
      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/8_Tag_the_Image.png)


      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/9_Push_the_Image.png)


