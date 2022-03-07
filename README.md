# Configurateur WSL pour ansible

## Utilisation
Depuis un bash Ubuntu WSL

```bash
git clone git@git-cloud.nci.fr:mat/ansible-wsl-installer.git
cd ansible-wsl-installer
bash install.sh
sudo ansible-playbook local.yml
```

## Liste des outils installés
- Git + Configuration Git
- Zsh
- Oh-My-Zsh avec le thème agnoster
- Docker
- Git-Flow + alias `git-deploy`
- Alias Laravel `artisan` au lieu de `php artisan`
- NodeJS v14
- PHP 8.1
