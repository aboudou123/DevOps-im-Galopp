
---

## 🔹 Vue d’ensemble (en bref)


# Vue d’ensemble (en bref)

**DevOps** = culture + pratiques + outils pour rapprocher développement et exploitation : automatiser la livraison (CI/CD), provisionner l’infrastructure comme du code, packager les applis (containers), orchestrer l’exécution, surveiller et boucler sur les incidents.
L’idée clé : *automatiser et versionner tout* (code, infra, configs, pipelines, observabilité).

---

# Feuille de route chronologique (ce qu’il faut connaître **avant** l’autre), avec pourquoi / dépendances / ce qui casse si ça manque

Je donne l’ordre **pratique** d’apprentissage (du plus préalable au plus avancé), les outils représentatifs, pourquoi ils viennent avant, et ce qui ne marchera pas sans eux.

## 1) Fondamentaux système / réseau / scripting

**Apprendre d’abord :** Linux (shell, permissions, processus), notions réseau (TCP/IP, DNS), SSH, scripting (bash + un langage : Python).
**Pourquoi avant tout :** la plupart des serveurs, containers et outils tournent sur Linux ; comprendre les logs, permissions, process et réseau est indispensable pour débugger. ([CompTIA][1])
**Ce qui casse sans :** vous ne saurez pas diagnostiquer un pod CrashLoopBackOff, résoudre un problème de permission de volume, ni automatiser de tests.

---

## 2) Contrôle de version (Git + workflow Git)

**Outils :** Git + plateformes (GitHub / GitLab / Bitbucket).
**Pourquoi maintenant :** tous les pipelines CI/CD se déclenchent depuis des commits/branches ; la collaboration et la traçabilité passent par Git. Apprenez commits, branches, merges, tags, pull requests. ([git-scm.com][2])
**Ce qui casse sans :** pas de source fiable pour déclencher builds/tests, pas de rollbacks faciles, pas d’intégration continue.

---

## 3) CI / CD (Intégration continue & Delivery)

**Outils :** Jenkins, GitHub Actions, GitLab CI, CircleCI.
**Dépendance :** Git (les jobs s’attachent aux commits).
**Pourquoi :** construit, teste et produit des artefacts (binaires, images) automatiquement.
**Ce qui casse sans :** déploiements manuels, erreurs humaines répétées, pas d’automatisation des tests.

---

## 4) Conteneurs et images (packaging) — *Docker / Podman / Buildah*

**Outils :** Docker (CLI & Dockerfile), alternatives : Podman / Buildah.
**Pourquoi à ce stade :** CI produit souvent des images conteneurisées ; comprendre comment créer une image, la tester localement et la pousser dans un registre est fondamental. Une *image* est le paquet standard contenant tout ce qu’il faut pour exécuter l’appli. ([Docker Documentation][3])
**Ce qui casse sans :** impossible d’exécuter la même app partout (dev/stage/prod) de façon prévisible ; Kubernetes n’a rien à lancer si vous ne savez pas produire des images.

---

## 5) Registre d’images & artefacts

**Outils :** Docker Hub, GitHub Container Registry, AWS ECR, Nexus, Artifactory.
**Dépendance :** images (Docker) créées par CI.
**Pourquoi :** Kubernetes et vos runners CI vont *pull* les images depuis un registre ; il faut gérer versions/authentification.
**Ce qui casse sans :** Kubernetes ne pourra pas récupérer l’image (imagePullBackOff), pipeline CI ne peut pas stocker d’artefacts.

---

## 6) Orchestration de containers — Kubernetes (ou équivalents)

**Outils :** Kubernetes (k8s), alternatives plus simples : Docker Compose, Docker Swarm, k3s.
**Dépendances :** images conteneurisées + registre + runtime conteneur sur les nœuds.
**Pourquoi après Docker :** Kubernetes orchestre *des* containers (instances d’images) — il ne remplace pas la compréhension des images/runtimes. Important : Kubernetes utilise un *container runtime* (containerd, CRI-O, etc.) via l’interface CRI ; le support direct « dockershim » a été retiré — comprendre la différence image vs runtime est important. ([Kubernetes][4])
**Ce qui casse sans :** sans images conformes et runtime compatible, pods ne démarrent pas ; sans connaissances Docker on ne sait pas construire ou débugger l’image sous-jacente.

---

## 7) Gestion de configuration & provisionnement (IaC vs CM)

**Outils IaC / provisioning :** Terraform, CloudFormation (pour provisionner infra : VM, VPC, clusters k8s).
**Outils config-management :** Ansible, Puppet, Chef (pour configurer OS/app sur des machines).
**Ordre / dépendance :** **provisionner** l’infrastructure (Terraform) vient généralement **avant** appliquer des configurations détaillées sur les ressources (Ansible). Terraform *crée* la VM/cluster ; Ansible *configure* le système qui a été créé. ([Red Hat][5])
**Ce qui casse sans :** si vous appliquez des playbooks sur des ressources non créées, ça échoue ; inversement, laisser des ressources sans configuration empêche d’homogénéiser l’environnement.

---

## 8) Packaging K8s & GitOps

**Outils :** Helm (package manager pour k8s), Kustomize, ArgoCD / Flux (GitOps).
**Dépendance :** Kubernetes en place + images + registre + Git pour GitOps. Helm facilite déploiements répétables (charts). ([helm.sh][6])
**Ce qui casse sans :** déploiements k8s lourds et non reproductibles ; difficulté à gérer valeurs par env.

---

## 9) Réseau / sécurité / CNI

**Outils :** plugins CNI (Calico, Flannel), Ingress (NGINX, Traefik), politiques réseau, RBAC.
**Dépendance :** Kubernetes + infra réseau.
**Ce qui casse sans :** pas de communication inter-pod, pas d’accès depuis l’extérieur, problèmes de sécurité.

---

## 10) Observabilité (metrics, logs, traces)

**Outils :** Prometheus (metrics) + Grafana (dashboards), ELK / OpenSearch / Loki (logs), Jaeger (traces).
**Pourquoi après déploiement :** il faut mesurer et alerter sur ce que vous avez déployé : latence, erreurs, utilisations CPU/mémoire. ([Grafana Labs][7])
**Ce qui casse sans :** pas de visibilité sur incidents ; diagnostics longs.

---

## 11) Secret management, policies, CI/CD avancé

**Outils :** HashiCorp Vault, Sealed Secrets, Kubernetes Secrets (avec prudence).
**Dépendance :** infra et applications qui ont besoin de credentials.
**Ce qui casse sans :** fuites de credentials, difficultés à automatiser secrets en CI/CD.

---

## 12) SRE / automation avancée (service mesh, autoscaling, chaos)

**Outils :** Istio/Linkerd (service mesh), HPA/VPA (autoscaling), tools de chaos engineering.
**Dépendance :** mature k8s + observabilité + bonnes pratiques de CI/CD.
**Ce qui casse sans :** gestion difficile du trafic, pas de résilience fine.

---

# Récapitulatif schématique (ordre simple)

1. Linux / réseau / bash / Python
2. Git (version control). ([git-scm.com][2])
3. CI (Jenkins/GitHub Actions) — déclenché par Git
4. Docker (images & containers). ([Docker Documentation][3])
5. Registre d’images
6. Kubernetes (ou k3s/minikube pour commencer) + container runtime (containerd/CRI-O). ([Kubernetes][4])
7. Terraform (IaC) pour provisionner infra (ou avant k8s si vous créez le cluster) + Ansible pour config
8. Helm + GitOps (ArgoCD/Flux)
9. Observabilité (Prometheus + Grafana). ([Grafana Labs][7])
10. Sécurité / Secret management / Service mesh

*(Remarque : certains outils peuvent être appris en parallèle. Ex. : on peut apprendre Ansible et Terraform en parallèle, mais conceptuellement Terraform « crée » l’infra et Ansible la configure.)* ([Red Hat][5])

---

# Exemple concret d’un mini-projet (ordre d’exécution)

1. Créer un repo Git et workflow GitHub Actions. (push → pipeline)
2. Pipeline : build → tests → package → **build image Docker** → push vers ECR/GCR/registry.
3. Terraform : provisionne un cluster k8s (ou cloud managed EKS/GKE).
4. Helm / kubectl : déployer l’application en utilisant l’image publiée.
5. Installer Prometheus + Grafana (Helm) pour monitorer.
6. Configurer alertes + secret store (Vault).

Ce workflow montre pourquoi **Git → CI → Docker → registry → Kubernetes** est une chaîne logique : chaque étape produit ce que la suivante consomme.

---

# Quelques précisions importantes (pièges fréquents)

* **Kubernetes ≠ Docker** : Kubernetes exécute *images* conformes au format OCI via un *container runtime* (containerd/CRI-O). L’engine Docker (dockerd) et son “dockershim” historique ont été retirés dans k8s : on a besoin de comprendre les deux concepts (images vs runtime). Apprendre Docker (ou Podman) reste essentiel pour construire et tester des images localement. ([Kubernetes][4])
* **Terraform vs Ansible** : ce ne sont pas la même chose — Terraform pour *provisionner* l’infra (déclaratif), Ansible pour *configurer* l’OS/apps (idempotent, procédural). On les combine souvent. ([Red Hat][5])

---

# Conseils d’apprentissage pratiques (concret)

* **Mini-labs** :

  * Local : installe Docker Desktop (ou Podman) + Minikube/k3s, déployez une app Node/Python packagée en image.
  * CI : créez un pipeline GitHub Actions simple qui construit l’image et la pousse sur GitHub Container Registry.
  * IaC : utilisez Terraform pour créer une VM ou cluster k3s dans une VM cloud (ou local avec multipass).
  * Observabilité : déployez Prometheus + Grafana via Helm et créez un dashboard.
* **Ordre d’apprentissage recommandé** (pratique) : Linux → Git → Docker → CI → Kubernetes (minikube/k3s) → Terraform → Ansible → Helm → Observabilité.
* **Expérience réelle** : copier la chaîne complète (commit → CI → image → k8s → monitoring) vous fera comprendre les dépendances bien plus vite que des lectures seules.

---
