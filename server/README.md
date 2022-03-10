# cosmic-pairing api

## Project setup

### Install pyenv and Python
1. Install pyenv, a Python version manager, to be kind to your future self. Prerequisite installation of [Homebrew](https://brew.sh/), then run:
```
$ brew install pyenv
```
* More [pyenv documentation here](https://github.com/pyenv/pyenv)

2. Install Python version specified in [.python-version](./.python-version) file:
```
pyenv install <specified version>
```

3. Test Python versions match
```
$ pyenv version
  # should return number specified in `.python-version` file
$ which python3
  # path should reflect pyenv shims path
```
* If using shims path is not set, and using zsh, make sure in ~/.zshrc this line is added:
  * `eval "$(pyenv init --path)"`.
  * See [thread here](https://github.com/pyenv/pyenv/issues/849#issuecomment-863456765).

### Set environment variables
1.  Copy example env file
```
$ cp .env.example .env
```

2.  Then assign values to variables in `.env` file.

### Install virtualenv (venv) 
```
$ pip3 install virtualenv
```

### Create venv
```
$ virtualenv venv
# OR
$ python3 -m venv venv
```

### Install Dependencies
```
$ pip3 install -r requirements.txt
```

### Install psql (Postgres CLI)
```
$ brew install postgresql
```

---

## Workflow commands

### Activate venv
```
$ source venv/bin/activate
```

### Deactivate venv
```
$ deactivate
```

### Brew commands for psql
```
$ brew services start postgresql # to start the service at boot time
$ brew services stop postgresql # to stop the service immediately
$ brew services run postgresql # to not restart service at boot time
```

### Create Postgres database
```
$ psql postgres # to connect/use psql as your user
$ CREATE DATABASE IF NOT EXISTS <see .env file for name>
```

### Start app
From root server directory, run:
```
$ flask run
```