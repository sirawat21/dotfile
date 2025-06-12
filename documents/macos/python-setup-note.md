# Setup Python version manager, version venv (MAC OS)

## Installation
```
brew install pyenv
brew install pyenv-virtualenv
```
---

## Setup shell config file
Required adding this snippet into shell configuration file; e.g. rc, profile
```
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --no-rehash -)"
eval "$(pyenv virtualenv-init -)"
```
Installed version will be stored in ~/.pyenv/versions
```
Example:
.pyenv
├── shims
├── version
└── versions
    ├── 3.13.0
    └── 3.13.4
```
---

## How use Pyenv

### Install versions
```
pyenv versions                  # Check installed versions
pyenv install --list            # Show avaliable versions
pyenv install <version>         # e.g. pyenv install 3.13.0

```
### Apply, Unset, Active versions
```
pyenv global <version> # e.g. pyenv global e.g. 3.13.0 - set a default globally
pyenv global --unset
pyenv local <version> # e.g. pyenv local e.g. 3.13.0 - set a working dir
pyenv local --unset

pyenv shell <version> # e.g. pyenv shell 3.13.0 - active specifically
```
---

## How to use Virtualenv

### Create virtual environment
```
pyenv virtualenv <version> <virtual_environment_name> # e.g. pyenv virtualenv 3.13.0 my-app-py
pyenv activate <virtual_environment_name> # Active e.g. pyenv activate my-app-py
pyenv deactivate # Deactive
```

---
## Cmd Summary
### Other cmds:
Check current applied Python version
```
which python
which pip
```
Update pyenv pip
```
pyenv exec pip3 install --upgrade pip

```

### pyenv cmds:
`pyenv install <version>` : Installs a specific Python version.
`pyenv versions` : Lists all installed Python versions and indicates the active one.
`pyenv global <version>` : Sets the default Python version for your user.
`pyenv local <version>` : Sets the Python version for the current directory.
`pyenv shell <version>` : Sets the Python version for the current shell session (temporary).
`pyenv uninstall <version>` : Uninstalls a specific Python version.
`pyenv rehash` : (Rarely needed with pyenv init --path but good to know) Rehashes shims, updating Python commands.