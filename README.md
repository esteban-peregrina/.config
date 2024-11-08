# Prérequis
Pour collaborer sur les projets, il est nécessaire d'installer Git, Docker et Visual Studio Code.
En effet, Git permettra de collaborer sans conflits, Docker sera utilisé pour modifier et 
executer le code dans un environnement controlé préconfiguré,
et Visual Studio Code, qui en plus de disposer d'extensions pour integrer Git / Github, 
permettra de se connecter au conteneur de développement Docker.

Téléchargez le fichier de configuration approprié directement depuis GitHub.com (bouton vert "Code", puis ".zip"), et suivez les instructions ci-dessous.
Une fois VS Code installé, ouvrez un nouveau dossier, attachez-y un terminal, et clonez-y le répertoire distant avec :
```
git clone git@github.com:esteban-peregrina/polytech-s5-ige-ecosysteme.git .
```
Ensuite, installez-y le dossier '.devcontainer.json' depuis [ce lien](https://github.com/esteban-peregrina/.devcontainer.json.git)
Renommez le dossier pour que le nom corresponde à celui présent dans le fichier '.gitignore'
Puis dans VS Code, ajoutez l'extension "Dev Containers".
Enfin, cliquez sur l'option "><" en bas a droite de VS Code, et dans le menu, sélectionnez "Reopen in container".

## Windows
Sur Windows, il est nécessaire d'installer [Winget](https://learn.microsoft.com/fr-fr/windows/package-manager/winget/) pour utiliser le script de configuration.
Aujourd'hui, ce gestionnaire de paquets est installé automatiquement avec le *Programme d'installation d'Applications*, lui-même installé avec les dernières versions de Windows.
Une fois le script `windows.ps1` téléchargé, **éxécutez Powershell en tant qu'administrateur**, puis jouez :
```powershell
Get-ExecutionPolicy
```
Notez la valeur renvoyez, puis jouez :
```powershell
Set-ExecutionPolicy Unrestricted
```
Naviguez jusqu'au fichier de configuration, puis exécutez-le avec :
```powershell
.\windows.ps1
```
Une fois les installations terminées, jouez (remplacez `Restricted` par la valeur notée précédemment) :
```powershell
Set-ExecutionPolicy Restricted
```
## MacOS
Sur MacOS, il est nécessaire d'installer [Homebrew](https://brew.sh) pour utiliser le script de configuration.
Vous pouvez aussi utiliser 
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
```

## Linux
Sur les distributions Linux usuelles, le script de configuration peut être lancé sans installation préalable.