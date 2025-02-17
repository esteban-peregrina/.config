Dans l'objectif de simplifier le développement collaboratif, il est commode de mettre en place un environnement de travail reposant sur l'utilisation de Git et Docker.
Par ailleurs, pour faciliter l'intégration de ces deux outils, il est conseillé d'utiliser Visual Studio Code.

Ce dépôt distant contient les fichiers de configuration nécessaires à l'installation de cet environnement.
En bref, Git, allié à GitHub.com, permet de programmer en collaboration sans risquer d'écraser les modifications des autres lors des synchronisations avec le dépôt contenant le code source.
Docker, quant à lui, permet d'isoler notre environnement de programmation de notre système d'exploitation, en le confinant à l'intérieur d'un conteneur préconfiguré, de telle sorte à mettre en commun l'architecture sur laquelle est développée le code source.
Enfin, Visual Studio Code dispose d'extensions pour intégrer aisément Git et GitHub.com, ainsi que pour se connecter au conteneur de développement Docker.

# Installation
Pour commencer, téléchargez le contenu de ce dépôt distant directement depuis GitHub.com (bouton vert "Code", puis ".zip"), ce qui évite de mettre en place un dépôt local.
Une fois le dossier compressé téléchargé, extrayez-le dans un répertoire quelconque, puis référez-vous à la section appropriée à votre système d'exploitation :

## Windows
Avant toute chose, assurez-vous que votre système d'exploitation supporte le [Sous-système Windows pour Linux](https://learn.microsoft.com/fr-fr/windows/wsl/install).
Si c'est le cas, lancez dans un terminal les commandes suivantes :
```powershell
wsl --install
```
> ⚠️ Remarque
>
> Il est parfois nécessaire d'activer la virtualisation dans le BIOS de votre système pour permettre à WSL 2 de fonctionner.

Une fois WSL installé, redémarrez votre machine puis, dans un terminal, vérifiez qu'une distribution Linux a bien été installée avec :
```powershell
wsl -l -v
```

Vous pouvez désormais passer aux étapes ci-dessous.

Pour exécuter le script de configuration, il est d'abord nécessaire d'installer [Winget](https://learn.microsoft.com/fr-fr/windows/package-manager/winget/).
Aujourd'hui, ce gestionnaire de paquets est installé automatiquement avec le *Programme d'installation d'applications*, lui-même compris dans les dernières versions de Windows.
Exécutez Powershell **en tant qu'administrateur**, naviguez jusqu'au dossier de configuration contenant le fichier `windows.ps1`, puis entrez :
```powershell
Get-ExecutionPolicy
```
Notez la valeur renvoyée, puis entrez :
```powershell
Set-ExecutionPolicy Unrestricted
```
Naviguez jusqu'au fichier de configuration, puis exécutez-le avec :
```powershell
.\windows.ps1
```
L'installation doit débuter, une fois terminée lancez (remplacez `Restricted` par la valeur notée précédemment) :
```powershell
Set-ExecutionPolicy Restricted
```

> ⏳ Remarque
>
> L'installation de Docker s'est révélée parfois particulièrement longue. Patientez autour de 15 minutes maximum.

Si tout s'est bien passé, vous pouvez passer à la section suivante.

## MacOS
Sur MacOS, il est nécessaire d'installer [Homebrew](https://brew.sh) pour utiliser le script de configuration.
Vous pouvez pour se faire lancer dans un terminal : 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Ensuite, naviguez jusqu'au fichier de configuration `macos.rb`, ouvrez un terminal depuis ce dossier, et lancez :
```bash
brew bundle --file macos.rb
```
Si tout s'est bien passé, vous pouvez passer à la section suivante.

## Linux
Sur les distributions Linux usuelles, le script de configuration peut être lancé sans installation préalable.

Si tout s'est bien passé, vous pouvez passer à la section suivante.

# Démarrer l'environnement de développement
Pour commencer, redémarrez votre machine pour appliquer les modifications.

Puis, lancez Docker Desktop, désormais installé sur votre système d'exploitation.
Ensuite, ouvrez Visual Studio Code, et dans l'onglet `Fichier`, sélectionnez "Ouvrir le dossier...", puis créez un dossier de travail.
Attachez un terminal au dossier depuis l'onglet `Terminal`, et clonez-y le répertoire distant du projet d'ecosysteme avec :
```
git clone https://github.com/esteban-peregrina/polytech-s5-ige-ecosysteme.git .
```
Ensuite, installez le dossier '.devcontainer.json', ici encore directemment depuis [ce dépôt distant](https://github.com/esteban-peregrina/.devcontainer.git).

Renommez le dossier pour que le nom corresponde à celui présent dans le fichier '.gitignore', et déplacez le dans votre dossier de travail (à côté des dossiers `headers` et `sources` entre-autres).

Puis dans VS Code, ajoutez l'extension "Dev Containers".
Enfin, cliquez sur l'option bleue "><" en bas a gauche de VS Code, et dans le menu, sélectionnez "Reopen in container". VS Code vous proposera d'afficher les logs.

Dans VS Code, Pour vérifier que vous êtes bien dans un Ubuntu, ajouter un terminal au conteneur, puis lancez :
```bash
lsb_release -a
```
La commande devrait renvoyer le nom ainsi que la version de la distribution.

Vous pouvez désormais compiler le projet avec :
```bash
make setup
make rebuild
````
Puis lancer l'éxécutable créé avec :
```bash
.\program
```