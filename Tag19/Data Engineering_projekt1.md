
Ziele der Übersetzung:
- Die **fachliche Bedeutung, Struktur und Argumentationslogik** müssen erhalten bleiben.
- Die **Formatierung** (Markdown-Struktur, Überschriften, Listen, Links, Hervorhebungen, Codeblöcke, Zitate) soll so genau wie möglich beibehalten werden.
- Die Sprache soll **professionell, technisch präzise und natürlich** wirken – wie ein ursprünglich auf Deutsch verfasstes Projektdokument.
- Vermeide wörtliche 1:1-Übersetzungen. Formuliere Sätze **stilistisch eigenständig**, nutze geeignete **Fachterminologie** aus Data Engineering, Cloud, ETL/ELT und Business Intelligence.
- Es dürfen **keine inhaltlichen Änderungen** vorgenommen werden: nichts weglassen, nichts hinzufügen.
- Gib **nur den übersetzten Text** zurück, ohne zusätzliche Erklärungen oder Kommentare.

Konkrete Stilvorgaben:
- Verwende für Überschriften sinnvolle deutsche Bezeichnungen (z. B. „Problemstellung“, „Werkzeuge & Technologien“, „Architekturdiagramm“, „Datenquellen & Schema“, „Orchestrierung mit Mage“, „Dashboard & Visualisierung“, „Weiterführende Ideen & Nächste Schritte“, „Danksagung & Credits“).
- Nutze durchgehend einen **sachlichen, formellen und klaren** Ton, geeignet für technische Dokumentation oder ein Capstone-Projekt.
- Achte darauf, dass Bulletpoints grammatikalisch konsistent formuliert sind (entweder alle als ganze Sätze oder alle als Nominalphrasen).

Hier ist der zu übersetzende englische Originaltext:

```text
# Truck Logistics Data Pipeline 

## Data Engineering Zoom Camp | 2024 Cohort | Capstone Project 

Author: [*Diego Gutierrez*](https://www.linkedin.com/in/diego-gutierrez-1874b17b/) 

  >**IMPORTANT;** _to skip the project overview & head staight to set up, click [here](setup.md)_

-------

<img src="static/assets/trucks.jpeg" alt="Trucks" height="300" width="600">

-----

## Table of Contents:

* [Problem Statement](#problem-statement)
* [Tools & Technology](#tools--technology)
* [Architecture Diagram](#architecture-diagram)
* [Data Sources & Schema](#data-sources--schema)
* [Mage Orchestration](#mage-orchestration)
* [Dashboard & Visualization](#dashboard--visualization)
* [Further Ideas & Next Steps](#further-ideas--next-steps)
* [Acknowledgements & Credits](#acknowledgements--credits)

    >**NOTE;** _to skip the project overview & head staight to set up, click [here](setup.md)_

------------------------

### Problem statement 

The necessity for developing a pipeline and dashboard for a truck logistics company stems from the imperative to efficiently collect, process, and disseminate critical information regarding transportation activities, especially revenue data from each customer. By establishing a comprehensive pipeline, which encompasses data acquisition, preprocessing, analysis, and visualization stages, alongside a user-friendly dashboard interface tailored for executives and senior management, the company can access accurate insights into revenue generation, cost analysis, and overall operational performance.

This project is a full ETL (Extract, Transform, Load) pipeline designed to streamline and enhance the data processing capabilities of a truck logistics company. The project leverages several powerful technologies and tools to achieve its objectives:

- Infrastructure Provisioning with Terraform: Terraform is used to create the necessary cloud infrastructure on Google Cloud Storage and BigQuery, ensuring a scalable and reliable environment for data processing and storage.

- Data Orchestration with MAGE: MAGE, an advanced data orchestrator, is employed to automate the ETL process. It downloads a CSV file from the local machine, transforms it into a Parquet file, and loads it into Google Cloud Storage and BigQuery. This entire process is containerized and runs inside Docker, providing consistency and ease of deployment.

- Analytics with dbt: dbt (Data Build Tool) is used to perform analytics on the data stored in BigQuery. This enables the creation of meaningful data models and transformations that drive deeper insights into the logistics operations.

- Visualization with Looker Studio: Finally, Looker Studio is used to create interactive and user-friendly dashboards. These dashboards present key metrics and insights, enabling executives and senior management to make informed decisions based on real-time data.

______________________________________________

### Tools & Technology

* Containerisation: [Docker](https://www.docker.com/)
* Workflow Orchestration: [Mage](https://www.mage.ai/)
* Data Transformations: [DBT DataBuildTools](https://www.getdbt.com/)
* Data Lake: [Google Cloud Storage](https://cloud.google.com/storage/?hl=en)
* Data Warehouse: [Google BigQuery](https://cloud.google.com/bigquery?hl=en)
* Infrastructure as Code (IaC): [Terraform](https://www.terraform.io/) 
* Visualisation: [Looker Studio](https://lookerstudio.google.com/)

______________________________________________

### Architecture Diagram

<img src="static/assets/data_architecture.drawio.svg" alt="Data Architecture" height="300" width="600">

------------------------

### Data Sources & Schema

The project was inspired by a truck fleet company that has drivers working for different companies. The data was simulated to avoid using private data. The simulated data used in this project can be found in the 'data' and 'seed' directories. To generate similar data, you can run the Python script [`data_generator.py`](data/data_generator.py).

There are basically 2 CSV files: one located in the local 'data' folder, which is supposedly updated every week with the week's rides, and a fixed table containing customer rates for each type of trip.

1. trip_data: This CSV contains trip data for truck logistics. It includes the following columns:

* date: The date of the record.
* driver: The name of the driver.
* customer: The name of the customer.
* hours: The number of hours for the trip.
* km: The distance traveled in kilometers.

2. customer_rates: This CSV provides information about different rates for customers. It includes the following columns:

* customer: The name of the customer.
* hour_city: The hour rate for city trips.
* hour_regular: The hour rate for regular trips.
* hour_hy: The hour rate for highway trips.
* fsc_city: The fuel surcharge rate for city travel.
* fsc_regular: The fuel surcharge rate for regular travel.
* fsc_hy: The fuel surcharge rate for highway travel.
* hy_mileage: The highway mileage rate.

______________________________________________

### Mage Orchestration

<img src="static/assets/pipeline.png" alt="Pipeline" height="600" width="300">

Mage operates within code blocks, and this pipeline utilizes Python, SQL, and DBT blocks in the following sequence:

1. Load CSV file from local directory.
2. Perform transformations and create a Parquet file.
3. Export the Parquet file to Google Cloud Storage.
4. Create an external table in BigQuery using the Parquet file from the Google Cloud Storage bucket.
5. Install all dbt packages with dbt deps.
6. Seed the customer_rates file into the DBT project.
7. Create all DBT models.
    - Create staging models for both files, with additional columns such as tripid and trip_type for trip_data.
    - Create core model by joining both staging models and calculating revenue according to customer rules.

-----------------------------

### Dashboard & Visualization 

A dashboard has been developed using Google Looker Studio to visualise truck logistics events. Utilising Google's native visualisation tool from within BigQuery, the dashboard benefits from enhanced speed and reduced latency. This synergy between Looker and BigQuery allows for efficient data retrieval and processing, leading to faster insights and smoother user experiences.

Dashboard Link: [HERE](https://lookerstudio.google.com/s/pBt7UHZBg1k)

<img src="static/assets/dashboard.png" alt="Chart1" height="300" width="600">


-----------------------------

### Further Ideas & Next Steps

- Use a larger dataset
- Create customer_rates files separated by year
- With more data it would be possible to use tools such as dlt
- Use partitions and clustering

-----------------------------



`markdown
Anforderungen:

Struktur & Format beibehalten
   - Übernimm die komplette Markdown-Struktur:
     - Überschriften (H1, H2, H3, …)
     - Listen, Zitate, Code-Blöcke
     - Links, Inline-Code, fett/kursiv
   - Dateinamen, URLs, Befehle und Code (Shell, git, etc.) bleiben unverändert.

Inhaltliche Treue
   - Bewahre die fachliche Bedeutung, Reihenfolge und Logik vollständig.
   - Lass keine Inhalte weg und füge keine neuen inhaltlichen Punkte hinzu.

Professioneller, technischer Stil
   - Verwende eine präzise, fachlich saubere und formelle deutsche Sprache, geeignet für eine Data-Engineering-Projektdokumentation.
   - Nutze gängige Fachterminologie (z. B. „Dienstkonto“, „Rolle“, „Umgebungsvariable“, „Recheninstanz“, „Infrastruktur bereitstellen“, „Speicher-Bucket“, „Dataset“).
   - Vermeide wörtliche 1:1-Übersetzungen; formuliere Sätze idiomatisch und natürlich auf Deutsch, so dass der Text wirkt, als wäre er ursprünglich auf Deutsch verfasst worden.

Kein Plagiat auf Satzebene
   - Aussage gleich lassen, aber Satzbau und Wortwahl variieren.
   - Nutze typische Formulierungen aus der deutschen Cloud‑/DevOps‑/Data‑Engineering‑Dokumentation (z. B. „richten Sie … ein“, „stellen Sie sicher, dass …“, „führen Sie folgenden Befehl aus“).

Ausgabe
   - Gib nur den übersetzten Text zurück, im selben Markdown-Layout.
   - Keine zusätzlichen Kommentare, Erklärungen oder Metatexte.

Zu übersetzender Text:

`markdown
REQUIREMENTS

To reproduce this project you will need:

 Google Cloud account
 Docker with docker-compose
 Git account

> [!NOTE]  
>You can use either your local machine or a virtual machine on Google Cloud. The decision to opt for a local machine was made to reduce the costs associated with cloud usage. However, if you prefer to run it on a virtual machine, please refer to the video below:

:moviecamera: GCP Cloud VM 
Setting up the environment on cloud VM
![](https://youtu.be/ae-CV2KfoN0&list=PL3MmuxUbchJed7dXYoJw8DoCuVHhGEQb&index=14)

SETUP GOOGLE CLOUD ACCOUNT
Initial Setup
Create an account with your Google email ID 
Setup your first project if you haven't already
     eg. "truck-logistics", and note down the "Project ID" (we'll use this later when deploying infra with TF)
Create a service account
     Add a service account name and click create and continue.
     Grant Viewer role to begin with.
Create a service account key
     Under 'Actions' click on the 3 dots and 'Manage Keys'
     Click 'Add key' and 'Create new key', choose 'JSON' key type. It will download it to your local machine, move it to a safe directory.

Setup for Access
 
IAM Roles for Service account:
    Go to the IAM section of IAM & Admin https://console.cloud.google.com/iam-admin/iam
    Click the Edit principal icon for your service account.
    Add these roles in addition to Viewer : Storage Admin + Storage Object Admin + BigQuery Admin
   
Enable these APIs for your project:
    https://console.cloud.google.com/apis/library/iam.googleapis.com
   * https://console.cloud.google.com/apis/library/iamcredentials.googleapis.com
   
Please ensure GOOGLEAPPLICATIONCREDENTIALS env-var is set.
   `shell
   export GOOGLEAPPLICATIONCREDENTIALS="<path/to/your/service-account-authkeys>.json"

   # Refresh token/session, and verify authentication
   gcloud auth application-default login
   `

REPRODUCING THE PROJECT
CLONE THE REPO

`bash
git clone https://github.com/dieegogutierrez/Data-Engineering-Capstone-Project.git
`

UPDATE WITH YOUR INFORMATION

`bash
cd mage-zoomcamp
`
Rename file dev.env to simply .env.
Update the variables with your information, specially 'LOCALPATHSERVICEACCOUNT' with the path to your local service account file and 'TFVAR' with your cloud project information.

RUN THE SCRIPT

`bash
./start.sh
`
The script will run Terraform in Docker and create the infrastructure in Google Cloud, specifically, a storage bucket and a BigQuery dataset.
Then, it will run the orchestrator MAGE, which will load local data, transform it, and export it to Google Cloud. Afterward, DBT will create models that will build a final table to be used on a dashboard.
Access the orchestrator at http://localhost:6789/ and run the pipeline by yourself.
After completion, it will create a table named 'tripsgrossrevenue' in BigQuery, which can be used in Looker Studio to build a dashboard.
`
``