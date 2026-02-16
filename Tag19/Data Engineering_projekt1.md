Datenpipeline für Lkw‑Logistik
Data Engineering Zoom Camp | Kohorte 2024 | Capstone‑Projekt

Autor: Koffitse Aboudou

> WICHTIG: Um die Projektübersicht zu überspringen und direkt zum Setup zu gelangen, klicken Sie hier.

<img src="static/assets/trucks.jpeg" alt="Trucks" height="300" width="600">

Inhaltsverzeichnis
 Problemstellung
 Werkzeuge & Technologien
 Architekturdiagramm
 Datenquellen & Schema
 Orchestrierung mit Mage
 Dashboard & Visualisierung
 Weiterführende Ideen & Nächste Schritte
 Danksagung & Credits

> HINWEIS: Um die Projektübersicht zu überspringen und direkt zum Setup zu gelangen, klicken Sie hier.

Problemstellung

Die Notwendigkeit, für ein Lkw‑Logistikunternehmen eine Datenpipeline und ein Dashboard aufzubauen, ergibt sich aus dem Anspruch, Informationen zu Transportvorgängen – insbesondere umsatzrelevante Daten je Kunde – effizient zu erfassen, zu verarbeiten und bereitzustellen. Durch die Implementierung einer durchgängigen Pipeline, die Datenerfassung, ‑aufbereitung, ‑analyse und Visualisierung umfasst, und in Kombination mit einem benutzerfreundlichen Dashboard für das Management erhält das Unternehmen belastbare Einblicke in Umsatzentwicklung, Kostenstrukturen und die operative Performance.

Dieses Projekt implementiert eine vollständige ETL‑Pipeline (Extract, Transform, Load), mit der die Datenverarbeitung eines Lkw‑Logistikunternehmens systematisch automatisiert und verbessert wird. Zur Umsetzung werden mehrere leistungsfähige Technologien und Tools eingesetzt:

• Infrastrukturbereitstellung mit Terraform: Terraform erstellt die erforderliche Cloud‑Infrastruktur auf Google Cloud Storage und BigQuery und sorgt so für eine skalierbare und robuste Umgebung für Verarbeitung und Speicherung der Daten.

• Datenorchestrierung mit Mage: Mage, ein moderner Orchestrator für Datenworkflows, automatisiert den ETL‑Prozess. Er lädt eine CSV‑Datei vom lokalen System, konvertiert sie in ein Parquet‑Format und schreibt die Daten anschließend nach Google Cloud Storage und BigQuery. Der gesamte Ablauf ist containerisiert und läuft in Docker, was Konsistenz und einfache Bereitstellung sicherstellt.

• Analytik mit dbt: Mit dbt (Data Build Tool) werden analytische Transformationen auf den in BigQuery abgelegten Daten ausgeführt. Dadurch entstehen aussagekräftige Datenmodelle und Transformationen, die tiefere Einblicke in die Logistikprozesse ermöglichen.

• Visualisierung mit Looker Studio: Abschließend wird Looker Studio genutzt, um interaktive und intuitiv bedienbare Dashboards zu erstellen. Diese Dashboards stellen zentrale Kennzahlen und Auswertungen bereit, sodass das Management Entscheidungen auf Basis nahezu in Echtzeit verfügbarer Daten treffen kann.

Werkzeuge & Technologien
 Containerisierung: Docker
 Workflow‑Orchestrierung: Mage
 Datentransformationen: DBT DataBuildTools
 Data Lake: Google Cloud Storage
 Data Warehouse: Google BigQuery
 Infrastructure as Code (IaC): Terraform
 Visualisierung: Looker Studio

Architekturdiagramm

<img src="static/assets/dataarchitecture.drawio.svg" alt="Data Architecture" height="300" width="600">

Datenquellen & Schema

Die Projektidee basiert auf einem Lkw‑Flottenunternehmen, dessen Fahrer für unterschiedliche Auftraggeber tätig sind. Um keine vertraulichen Informationen zu verwenden, wurden die Daten synthetisch erzeugt. Die in diesem Projekt verwendeten simulierten Datensätze befinden sich in den Verzeichnissen data und seed. Vergleichbare Daten können mit dem Python‑Skript datagenerator.py generiert werden.

Im Wesentlichen kommen zwei CSV‑Dateien zum Einsatz:  
eine im lokalen Ordner data, der wöchentlich mit den Fahrten der vergangenen Woche aktualisiert wird, sowie eine statische Tabelle mit den Kundentarifen für die jeweiligen Fahrtarten.

tripdata:  
   Diese CSV enthält Fahrtdaten für die Lkw‑Logistik und umfasst folgende Spalten:

    date: Datum des Datensatzes  
    driver: Name der Fahrerin bzw. des Fahrers  
    customer: Name des Kunden  
    hours: Anzahl der Stunden für die Fahrt  
    km: Zurückgelegte Strecke in Kilometern  

customerrates:  
   Diese CSV beschreibt unterschiedliche Tarife pro Kunde und enthält folgende Spalten:

    customer: Name des Kunden  
    hourcity: Stundensatz für Fahrten im Stadtgebiet  
    hourregular: Stundensatz für reguläre Fahrten  
    hourhy: Stundensatz für Autobahnfahrten  
    fsccity: Treibstoffzuschlag für Stadtfahrten  
    fscregular: Treibstoffzuschlag für reguläre Fahrten  
    fschy: Treibstoffzuschlag für Autobahnfahrten  
    hymileage: Kilometerpauschale für Autobahnstrecken  

Orchestrierung mit Mage

<img src="static/assets/pipeline.png" alt="Pipeline" height="600" width="300">

Mage arbeitet mit modularen Code‑Blöcken; in dieser Pipeline kommen Python‑, SQL‑ und dbt‑Blöcke in der folgenden Reihenfolge zum Einsatz:

Laden der CSV‑Datei aus dem lokalen Verzeichnis.  
Durchführung der Transformationen und Erzeugen einer Parquet‑Datei.  
Export der Parquet‑Datei nach Google Cloud Storage.  
Anlegen einer External Table in BigQuery auf Basis der Parquet‑Datei im Google‑Cloud‑Storage‑Bucket.  
Installation aller dbt‑Abhängigkeiten mittels dbt deps.  
Einspielen der Datei customerrates als Seed in das dbt‑Projekt.  
Erzeugung sämtlicher dbt‑Modelle:
   - Aufbau von Staging‑Modellen für beide Dateien, inklusive zusätzlicher Spalten wie tripid und triptype für tripdata.  
   - Aufbau eines Core‑Modells durch Join beider Staging‑Modelle und Berechnung der Umsätze gemäß der kundenspezifischen Tariflogik.

Dashboard & Visualisierung

Auf Basis von Google Looker Studio wurde ein Dashboard entwickelt, das Ereignisse in der Lkw‑Logistik visualisiert. Durch die Nutzung des nativen Visualisierungstools direkt aus BigQuery heraus profitiert das Dashboard von hoher Performance und geringer Latenz. Die enge Integration von Looker und BigQuery ermöglicht effiziente Datenabfragen und ‑verarbeitung und führt zu schnelleren Insights sowie einer flüssigen Nutzererfahrung.

Dashboard‑Link: HIER

<img src="static/assets/dashboard.png" alt="Chart1" height="300" width="600">

Weiterführende Ideen & Nächste Schritte
• Einsatz eines größeren Datenvolumens  
• Aufteilung der customer_rates‑Dateien nach Jahr  
• Bei umfangreicheren Datenmengen Einsatz zusätzlicher Tools wie z. B. dlt  
• Nutzung von Partitionierung und Clustering  

Danksagung & Credits

Besonderer Dank gilt DataTalksClub für die Begleitung im Data Engineering Zoom Camp der letzten zehn Wochen. Es war ein Privileg, Teil der Spring‑’24‑Kohorte zu sein – unbedingt vorbeischauen!

> „DataTalks.Club – the place to talk about data! We are a community of people who are passionate about data. Join us to talk about everything related to data, to learn more about applied machine learning with our free courses and materials, to discuss the engineering aspects of data science and analytics, to chat about career options and learn tips and tricks for the job interviews, to discover new things and have fun!
>
> Our weekly events include:
>
> 👨🏼‍💻 Free courses and weekly study groups where you can start practicing within a friendly community of learners
>
> 🔧 Workshops where you can get hands-on tutorials about technical topics
>
> ⚙️ Open-Source Spotlight, where you can discover open-source tools with a short demo video
>
> 🎙 Live Podcasts with practitioners where they share their experience (and the recordings too)
>
> 📺 Webinars with slides, where we discuss technical aspects of data science“

Data Talks Club
