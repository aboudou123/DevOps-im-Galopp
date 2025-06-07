
# Tag 12 Antworten: Docker-Projekt für DevOps-Ingenieure

### Ihr macht das einfach großartig bei **#30DevOps-im-Galopp**. Die heutige Herausforderung ist etwas ganz Besonderes, denn ihr werdet ein DevOps-Projekt mit Docker durchführen. Seid ihr aufgeregt? 😍

# Dockerfile

Docker ist ein Tool, das es einfach macht, Anwendungen in Containern auszuführen. Container sind wie kleine Pakete, die alles enthalten, was eine Anwendung zum Laufen braucht. Um diese Container zu erstellen, verwenden Entwickler etwas, das man ein Dockerfile nennt.

Ein Dockerfile ist wie eine Reihe von Anweisungen zur Erstellung eines Containers. Es sagt Docker, welches Basis-Image verwendet werden soll, welche Befehle auszuführen sind und welche Dateien enthalten sein sollen. Wenn man zum Beispiel einen Container für eine Website erstellen würde, könnte das Dockerfile Docker anweisen, ein offizielles Webserver-Image zu verwenden, die Dateien der Website in den Container zu kopieren und den Webserver zu starten, wenn der Container gestartet wird.


For more about Dockerfile, visit [here](https://rushikesh-mashidkar.hashnode.dev/dockerfile-docker-compose-swarm-and-volumes).

## Tasks with Answers

**1. Create a Dockerfile for a simple web application (e.g. a Node.js or Python app)**
   - **1. Create a Simple Flask Application**
      - Create a new directory for your project and navigate into it:

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/1_Create_a_new_directory.png)

      - Create a new file named `app.py` and add the following content:

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/2_app_py.png)

      - Create a requirements file named `requirements.txt` and add the following content:

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/3_Create_a_requirements_file.png)

   - **2. Create a Dockerfile**
      - Create a file named `Dockerfile` in the same directory and add the following content:

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/4_Create_a_Dockerfile.png)

**2. Build the image using the Dockerfile and run the container**
   - To build the Docker image, run the following command in the directory containing the Dockerfile:

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/5_build_the_docker_image.png)

   - Run the Container
      - To run the container, use the following command:

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/6_Run_the_Container.png)

**3. Verify that the application is working as expected by accessing it in a web browser**
   - Open your web browser and navigate to `http://localhost:5000`. You should see the message "Hello, World!".

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/7_Verify_the_Application.png)

**4. Push the image to a public or private repository (e.g. Docker Hub)**
   - To push the image to Docker Hub, you need to tag it with your Docker Hub username and repository name, then push it.
   - **1. Tag the Image**

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/8_Tag_the_Image.png)

   - **2. Push the Image**

      **Answer**

      ![image](https://github.com/Bhavin213/90DaysOfDevOps/blob/master/2024/day17/image/9_Push_the_Image.png)

For a reference project, visit [here](https://youtu.be/Tevxhn6Odc8).

If you want to dive further, watch this [bootcamp](https://youtube.com/playlist?list=PLlfy9GnSVerRqYJgVYO0UiExj5byjrW8u).

You can share your learning with everyone over LinkedIn and tag us along. 😃

Happy Learning :)

[Code for Reference](https://raw.githubusercontent.com/Bhavin213/90DaysOfDevOps/master/2024/day17/code.txt)

[LinkedIn](https://www.linkedin.com/in/bhavin-savaliya/)
