# Projet mettaant en oeuvre mon framework personnel :

## Détails :

### 1. Antécédents médicaux

Le système doit permettre au médecin de prescrire des ordonnances sans avoir à ressaisir toutes les informations médicales du patient.

Chaque patient reçoit un **identifiant unique** auquel est associé un **QR code**.

#### Fonctionnement du QR code

Le QR code contient une URL construite à partir de l'identifiant unique du patient.

- Le QR code n'est pas généré en Java, mais en **PHP**.
- Lorsqu'il est scanné, il redirige vers une URL contenant l'identifiant du patient.
- Cette URL appelle un **Web Service développé en Java** afin de récupérer les informations relatives au patient.

#### Sécurisation

Le système doit être sécurisé : l'accès aux informations médicales ne doit pas être autorisé à tout le monde.

**Fonctionnement attendu :**

- Lorsqu'un médecin se connecte à l'application Java, il peut consulter les informations de l'ensemble des patients.
- Les autres personnes ne doivent pas avoir automatiquement accès à ces informations.

### 2. Prédiction des maladies *(fonctionnalité facultative)*

Lorsqu'un médecin saisit les symptômes d'un patient, le système pourrait proposer une maladie probable.

**Exemple :**

1. Le médecin renseigne les symptômes du patient.
2. Le système analyse les symptômes.
3. Il propose une hypothèse : « Il pourrait s'agir d'une tuberculose ».

Cette fonctionnalité nécessiterait l'intégration d'un modèle de prédiction.

> **Remarque :** cette fonctionnalité constitue une possibilité supplémentaire. Elle n'est pas obligatoirement à réaliser dans son intégralité.

> **Délai de livraison : fin du semestre S6.**

---

## Sprint 0

### 1. Base de données

Pour le Sprint 0, seule la table `patient` est nécessaire.

Structure initiale :

**Patient**

| Colonne | Description                        |
|---------|------------------------------------|
| `id`    | Identifiant généré par le système. |

### 2. Architecture

Une architecture **MVC** simple est envisagée pour commencer.

Cependant, le projet doit utiliser une **architecture microservices**.

### 3. Architecture microservices

Le principe consiste à découper les grandes fonctionnalités de l'application en plusieurs services indépendants.

Chaque microservice possède son propre bundle déployable (par exemple, plusieurs fichiers WAR).

Ces microservices communiquent entre eux à travers des API.

Ils peuvent avoir :

- des bases de données différentes ;
- des langages de programmation différents ;
- des déploiements indépendants.

> **Attention :** il n'est pas forcément pertinent de transformer toutes les fonctionnalités d'une application en microservices. Il faut choisir judicieusement les fonctionnalités à séparer.

### 4. Architecture monolithique

Dans une architecture monolithique, toute l'application est regroupée dans un seul bundle déployable (par exemple, un seul fichier WAR).

Toutes les fonctionnalités sont regroupées au sein de la même application.

### 5. Pourquoi ne pas choisir une architecture monolithique pour ce projet ?

L'architecture monolithique peut devenir problématique lorsque l'application doit supporter une forte montée en charge (*scalabilité*).

Par exemple, imaginons que seul le module de gestion des patients nécessite davantage de ressources.

- Avec une architecture **monolithique**, il faudrait potentiellement redéployer plusieurs instances de toute l'application pour augmenter la capacité de ce module.
- Avec une architecture **microservices**, il serait possible de multiplier uniquement les instances du microservice concerné.

Cela permet une **montée en charge indépendante de chaque fonctionnalité (scalabilité horizontale)**.

---

## TODO :

- [ ] Initialiser le projet
    - [ ] Les fichiers nécessaires au déploiement
    - [ ] `Deploy.sh`
    - [ ] Les jar
- [ ] Créer la base de données
- [ ] Créer la première page
- [ ] Créer une page qui va appeler la base

### 1 - CRUD Patients