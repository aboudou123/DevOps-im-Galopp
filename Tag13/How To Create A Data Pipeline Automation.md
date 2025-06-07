
# How To Create A Data Pipeline Automation

Créer une **automatisation d’un pipeline de données** signifie concevoir un processus qui collecte, transforme et stocke les données sans intervention humaine manuelle. Voici une approche structurée, claire et pratique pour concevoir ce pipeline automatisé. 


Plus d'infos : https://estuary.dev/blog/data-pipeline-automation/

---

## 🧩 Étapes clés pour automatiser un pipeline de données

### 1. **Définir les objectifs et les sources de données**

* Quels types de données traites-tu ? (logs, fichiers CSV, API, base de données, etc.)
* Quelle est la fréquence d'actualisation ? (temps réel, chaque heure, chaque jour)
* Où les données doivent-elles être stockées ? (data warehouse, S3, PostgreSQL…)

### 2. **Extraire les données (ETL : Extract)**

Utilise des connecteurs adaptés :

* API REST : via `requests` (Python)
* Base de données : via `SQLAlchemy`, `psycopg2`, etc.
* Fichiers : via `pandas.read_csv`, `read_excel`, etc.

**Exemple en Python (API REST):**

```python
import requests

response = requests.get("https://api.example.com/data")
data = response.json()
```

---

### 3. **Transformer les données (Transform)**

* Nettoyage : suppression des doublons, gestion des valeurs nulles
* Normalisation : formats de date, unités
* Enrichissement : jointures avec d'autres sources

**Exemple en Python avec Pandas :**

```python
import pandas as pd

df = pd.DataFrame(data)
df.drop_duplicates(inplace=True)
df['date'] = pd.to_datetime(df['date'])
```

---

### 4. **Charger les données (Load)**

* Charger dans une base de données, un data lake ou un fichier cible

**Exemple : écrire vers une base PostgreSQL**

```python
from sqlalchemy import create_engine

engine = create_engine('postgresql://user:password@host:port/dbname')
df.to_sql('table_cible', engine, if_exists='replace', index=False)
```

---

### 5. **Orchestration & automatisation**

Utilise des outils d’orchestration pour planifier et automatiser les tâches :

#### 🔧 Outils courants :

| Outil              | Cas d’usage                          |
| ------------------ | ------------------------------------ |
| **Apache Airflow** | Pipelines complexes avec dépendances |
| **Cron + Scripts** | Petits jobs simples et récurrents    |
| **Prefect**        | Alternatif moderne à Airflow         |
| **Dagster**        | Framework moderne orienté DataOps    |

**Exemple avec Airflow (DAG) :**

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def extract(): ...
def transform(): ...
def load(): ...

with DAG("data_pipeline", start_date=datetime(2024, 1, 1), schedule_interval='@daily') as dag:
    t1 = PythonOperator(task_id='extract', python_callable=extract)
    t2 = PythonOperator(task_id='transform', python_callable=transform)
    t3 = PythonOperator(task_id='load', python_callable=load)

    t1 >> t2 >> t3  # Dépendances
```

---

### 6. **Surveillance et alertes**

* Logs (Airflow, ELK, etc.)
* Alertes : email, Slack, Grafana + Prometheus

---

## ✅ Résumé visuel du pipeline automatisé

```
[SOURCE] --> [EXTRACTION] --> [TRANSFORMATION] --> [CHARGEMENT] --> [STOCKAGE]
                     \       /                \     /              \       /
                 [Code Python]         [Airflow / Cron Job]      [DB / S3 / Data Lake]
```

---

## Tu veux aller plus loin ?

Je peux t'aider à :

* Créer un projet Airflow étape par étape
* Mettre en place un pipeline CI/CD pour tes scripts ETL
* Conteneuriser le pipeline avec Docker

Souhaites-tu un exemple complet prêt à l’emploi ?



Parfait ! Voici un **guide pas à pas** pour créer et automatiser un **pipeline de données simple** sur **Ubuntu**, adapté aux débutants.

Nous allons utiliser :

* **Python** pour écrire les étapes du pipeline (extraction, transformation, chargement)
* **Airflow** pour l'automatisation (orchestration)
* **PostgreSQL** comme base de données de destination
* **Ubuntu** comme environnement de travail

---

## 🔧 Étape 1 – Préparer l’environnement (Ubuntu)

### 1.1. Mettre à jour Ubuntu

```bash
sudo apt update && sudo apt upgrade -y
```

### 1.2. Installer Python, pip et venv

```bash
sudo apt install python3 python3-pip python3-venv -y
```

---

## 📁 Étape 2 – Créer un projet local Python

### 2.1. Créer un dossier de projet

```bash
mkdir ~/projet_pipeline
cd ~/projet_pipeline
python3 -m venv venv
source venv/bin/activate
```

### 2.2. Installer les bibliothèques nécessaires

```bash
pip install pandas requests sqlalchemy psycopg2-binary apache-airflow
```

---

## 📦 Étape 3 – Écrire le pipeline (ETL)

Crée un fichier `pipeline.py` :

```bash
touch pipeline.py
```

Et ajoute ce code :

```python
import requests
import pandas as pd
from sqlalchemy import create_engine

def extract():
    url = "https://jsonplaceholder.typicode.com/users"
    response = requests.get(url)
    data = response.json()
    return pd.DataFrame(data)

def transform(df):
    df = df[['id', 'name', 'email']]
    df.rename(columns={"id": "user_id"}, inplace=True)
    return df

def load(df):
    engine = create_engine("postgresql://postgres:password@localhost:5432/ma_base")
    df.to_sql("utilisateurs", engine, if_exists="replace", index=False)

def pipeline():
    df = extract()
    df = transform(df)
    load(df)

if __name__ == "__main__":
    pipeline()
```

**⚠️** Remplace `password` et `ma_base` par tes vrais identifiants PostgreSQL.

---

## 🗃️ Étape 4 – Installer PostgreSQL localement

```bash
sudo apt install postgresql postgresql-contrib -y
sudo -u postgres psql
```

Dans le terminal PostgreSQL :

```sql
CREATE DATABASE ma_base;
CREATE USER mon_user WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE ma_base TO mon_user;
\q
```

Ensuite, mets à jour l’URL de connexion dans `pipeline.py` :

```python
create_engine("postgresql://mon_user:password@localhost:5432/ma_base")
```

---

## 🕐 Étape 5 – Automatiser avec Airflow

### 5.1. Initialiser Airflow

```bash
export AIRFLOW_HOME=~/airflow
pip install apache-airflow
airflow db init
```

### 5.2. Créer un utilisateur Airflow

```bash
airflow users create \
  --username admin \
  --firstname Prenom \
  --lastname Nom \
  --role Admin \
  --email email@example.com \
  --password admin
```

### 5.3. Démarrer Airflow

```bash
airflow webserver --port 8080
```

(Ouvre [http://localhost:8080](http://localhost:8080) dans ton navigateur)

Dans un nouveau terminal :

```bash
airflow scheduler
```

---

## 🧩 Étape 6 – Créer un DAG Airflow

Crée le dossier :

```bash
mkdir -p ~/airflow/dags
```

Crée un fichier : `~/airflow/dags/etl_dag.py`

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
from pipeline import extract, transform, load

def run_etl():
    df = extract()
    df = transform(df)
    load(df)

with DAG(
    dag_id="mon_etl_dag",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@daily",
    catchup=False
) as dag:
    etl_task = PythonOperator(
        task_id="run_etl",
        python_callable=run_etl
    )
```

Assure-toi que le fichier `pipeline.py` se trouve bien dans le même dossier que ton DAG ou qu’il est dans le `PYTHONPATH`.

---

## ✅ Résultat

Une fois le **scheduler** et le **webserver** lancés :

* Connecte-toi à [http://localhost:8080](http://localhost:8080)
* Active le DAG `mon_etl_dag`
* Il exécutera chaque jour automatiquement ton pipeline.

---

## 📌 À suivre (si tu veux aller plus loin)

* Ajout d’alertes email si une tâche échoue
* Monitoring avec Grafana
* Dockeriser le pipeline
* Déployer sur un serveur distant

Souhaites-tu que je t’aide à créer une version Docker ou à ajouter une API ou interface ?

