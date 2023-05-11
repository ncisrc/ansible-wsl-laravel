# NodeJS & Laravel Sail development environnement for Windows WSL 2 & VS Code

## What do you need ?
- Ansible Playbook
  - `sudo apt install ansible`

- A WSL2 already installed :
  - EN : https://docs.microsoft.com/en-us/windows/wsl/install
  - FR : https://docs.microsoft.com/fr-fr/windows/wsl/install

- Docker for Windows (option) :
  - https://docs.docker.com/desktop/windows/install/

  > Why it's an option : _It's not really important to install Docker for Windows unless you have to deal with native windows application listening on specific ports on you computer._
  **But if you install Docker for Windows be sure to enable the WSL2 option !**

## Installation
From a Ubuntu WSL Shell

```bash
git clone https://github.com/ncisrc/ansible-wsl-laravel.git
cd ansible-wsl-installer
bash install.sh
# You will be asked to provide your GIT identity
# (name & email to use in your commits)
sudo ansible-playbook local.yml
# reboot you PC
```

## After installation you get :
- Git + .gitconfig
- Zsh
- Oh-My-Zsh with Agnoster Theme
- Docker
- Git-Flow + alias `git-deploy`
- Laravel `artisan` alias instead of `php artisan`
- Laravel `sail` alias.
- NVM
- PHP 8.2
- Integration of `p4merge`.

## Configuration of NodeJS:
```bash
nvm install node # Install latest version of NodeJS
nvm install lts # Install latest LTS version of NodeJS
nvm install v16.18 # Install specific version of NodeJS

nvm use v16.18 # Set this version as default version
```

## Configuration of NodeJS version by project
You can create a `.nvmrc` file at the root of your project with a specific node version for you project :
```bash
echo "v16.18" > .nvmrc
```
Then inside you project, you can use the defined version with this command :
```bash
nvm use
```



## Notes :

### About GIT Conflics :

The .gitconfig file is configured to use the `p4merge` tool. It's a free, must have, mergin tool.
You can download it for free here : https://www.perforce.com/downloads/visual-merge-tool

You ONLY have to install `p4merge` on Windows ;)

Then all you have to do is a `git mergetool` inside a WSL terminal to manage conflics and magic should happen.

### About Debug inside WSL using VS Code & Laravel Sail :

#### Make a `.vscode/launch.json` file inside you project and copy theses lines inside :
```json
{
  // Utilisez IntelliSense pour en savoir plus sur les attributs possibles.
  // Pointez pour afficher la description des attributs existants.
  // Pour plus d'informations, visitez : https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Laravel XDebug on WSL Docker",
      "type": "php",
      "request": "launch",
      "port": 9003,
      "hostname": "localhost",
      "pathMappings": {
        "/var/www/html": "${workspaceFolder}"
      },

    }
  ]
}

```

#### Then change the `XDEBUG_CONFIG` param inside your "docker-compose.yml" as follow

```yaml
...
  XDEBUG_CONFIG: 'client_host=host.docker.internal start_with_request=yes idekey=VSCODE discover_client_host=true log_level=0'
...
```
