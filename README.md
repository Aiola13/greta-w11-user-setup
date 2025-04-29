# greta-w11-user-setup

Ce projet contient un script batch pour Windows 11 permettant de réinitialiser proprement le compte utilisateur "Formation" et de configurer certains paramètres système pour un environnement de formation.

## Fonctionnalités du script

- Vérifie l'existence du compte "Formation"
- Supprime le compte et son profil utilisateur si nécessaire
- Crée un nouveau compte "Formation" avec mot de passe non expirant
- Ajoute le compte au groupe "Utilisateurs"
- Configure certains paramètres Windows 11 (affichage des extensions, désactivation de suggestions, etc.)
- Copie les raccourcis Office (Word, Excel, PowerPoint) sur le bureau public

## Prérequis

- Windows 11
- Droits administrateur

## Utilisation

1. Faites un clic droit sur `w11-user-setup.bat` et sélectionnez **Exécuter en tant qu'administrateur**.
2. Suivez les instructions affichées dans la console.
3. À la fin du script, ouvrez une session avec le compte "Formation" pour finaliser la personnalisation.

1. Vous pouvez aussi executer cette ligne :

```batch
powershell -Command "iwr -useb https://raw.githubusercontent.com/aiola13/greta-w11-user-setup/main/w11-user-setup.bat -OutFile %TEMP%\w11-user-setup.bat; cmd /c %TEMP%\w11-user-setup.bat"
```

## Détails techniques

Le script effectue les opérations suivantes :

- Supprime le compte "Formation" s'il existe, ainsi que son profil utilisateur.
- Crée un nouveau compte "Formation" et désactive l'expiration du mot de passe.
- Configure certains paramètres du registre pour améliorer l'expérience utilisateur.
- Place les raccourcis Office sur le bureau public pour tous les utilisateurs.

## Avertissement

- Sauvegardez les données importantes du compte "Formation" avant d'exécuter ce script, car toutes les données du profil seront supprimées.
- Ce script est fourni à titre d'exemple et doit être adapté selon vos besoins spécifiques.

## Fichiers

- [`w11-user-setup.bat`](w11-user-setup.bat) : Script principal d'installation et de configuration.

---