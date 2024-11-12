Dans l'objectif de simplifier le développement collaboratif, il est commode de mettre en place un environnement de travail reposant sur l'utilisation de Git et Docker.
Pour faciliter l'intégration de ces deux outils, il est conseillé d'utiliser Visual Studio Code.

Ce dépôt distant contient les fichiers de configuration nécessaires à l'installation de cet environnement.
En bref, Git, allié à GitHub.com, permet de programmer en collaboration sans risquer d'écraser les modifications des autres lors des synchronisations avec le dépôt contenant le code source.
Docker, quant à lui, permet d'isoler notre environnement de programmation de notre système d'exploitation, en le confinant à l'intérieur d'un conteneur préconfiguré, de telle sorte à mettre en commun l'architecture sur laquelle est développée le code source.
Enfin, Visual Studio Code dispose d'extensions pour intégrer aisément Git et GitHub.com, ainsi que pour se connecter au conteneur de développement Docker.

# Installation
Pour commencer, téléchargez le contenu de ce dépôt distant directement depuis GitHub.com (bouton vert "Code", puis ".zip"), ce qui évite de mettre en place un dépôt local.
Une fois le dossier compressé téléchargé, extrayez-le dans un répertoire quelconque, puis référez-vous à la section appropriée à votre système d'exploitation :

## Windows
Sur Windows, il est nécessaire d'installer [Winget](https://learn.microsoft.com/fr-fr/windows/package-manager/winget/) pour exécuter le script de configuration.
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

## MacOS
Sur MacOS, il est nécessaire d'installer [Homebrew](https://brew.sh) pour utiliser le script de configuration.
Vous pouvez aussi utiliser 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
```

## Linux
Sur les distributions Linux usuelles, le script de configuration peut être lancé sans installation préalable.

# Démarrer l'environnement de développement
Une fois VS Code installé, créé un dossier de travail, attachez-y un terminal, et clonez-y le répertoire distant du projet Ecosysteme avec :
```
git clone https://github.com/esteban-peregrina/polytech-s5-ige-ecosysteme.git .
```
Ensuite, installez-y le dossier '.devcontainer.json', ici encore directemment depuis [ce dépôt distant](https://github.com/esteban-peregrina/.devcontainer.git).

Renommez le dossier pour que le nom corresponde à celui présent dans le fichier '.gitignore'.

Puis dans VS Code, ajoutez l'extension "Dev Containers".
Enfin, cliquez sur l'option "><" en bas a droite de VS Code, et dans le menu, sélectionnez "Reopen in container".