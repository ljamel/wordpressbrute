# WordPress Authentication Security Scanner

Ce projet automatise le processus d'énumération des utilisateurs et de test de mots de passe faibles pour les instances WordPress via Metasploit Framework. Il est conçu à des fins de test d'intrusion et d'audit de sécurité dans des environnements contrôlés.

## Fonctionnalités
* **Énumération d'utilisateurs :** Identification des noms d'utilisateurs valides via l'exploitation de l'énumération des logins WordPress.
* **Audit de mots de passe :** Test de force brute/dictionnaire via le protocole XML-RPC sur WordPress pour valider l'exposition aux mots de passe faibles.
* **Automatisation :** Utilisation de fichiers de ressources (.rc) Metasploit pour un enchaînement fluide des opérations.

## Prérequis
* Metasploit Framework installé et configuré.
* Accès en écriture dans le répertoire `/tmp/`.
* Liste de mots de passe disponible (par défaut, le script pointe vers `/usr/share/metasploit-framework/data/wordlists/http_default_pass.txt`).

## Installation et Utilisation
1. Clonez ce dépôt sur votre machine locale :
```bash
git clone https://github.com/ljamel/wordpressbrute.git
cd wordpressbrute
```
2. Rendez le script exécutable :
```bash
chmod +x wordpressbrute.sh
```
3. Lancez le script avec des privilèges appropriés :
```bash
./script.sh
```
4. Suivez les instructions à l'écran en entrant l'adresse IP ou le nom de domaine de la cible.
## Fonctionnement des fichiers générés
* `/tmp/wpattack.rc` : Configuration pour l'énumération des utilisateurs.
* `/tmp/wpusers.txt` : Liste des utilisateurs extraits après l'exécution du premier module.
* `/tmp/wpattack2.rc` : Configuration pour l'attaque par force brute sur les utilisateurs identifiés.
* `/tmp/msf_password_found.log` : Journal contenant les identifiants compromis si l'attaque réussit.

## Avertissement légal
Cet outil est fourni à des fins éducatives et de tests de sécurité autorisés uniquement. L'utilisation de ce script contre des cibles sans autorisation explicite est illégale. L'auteur décline toute responsabilité quant à une utilisation malveillante.
## Contribution

Les contributions sont les bienvenues. N'hésitez pas à ouvrir des *Issues* pour rapporter des bugs ou proposer des améliorations.

---

Souhaitez-vous que j'ajoute une section spécifique sur la manière de sécuriser une instance WordPress contre ce type d'attaques afin de rendre le README plus informatif ?
