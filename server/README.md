# cosmic-pairing api

## Project setup

### Install pyenv and Python
1. Install pyenv, a Python version manager, to be kind to your future self. Prerequisite installation of [Homebrew](https://brew.sh/), then run:
```
brew install pyenv
```
* More [pyenv documentation here](https://github.com/pyenv/pyenv)

2. Install Python version specified in [.python-version](./.python-version) file:
```
pyenv install <specified version>
```

### Install Dependencies 
```
pip3 install -r requirements.txt
```

### Set environment variables
1.  Copy example env file
```
cp .env.example .env
```

2.  Then assign values to variables in `.env` file.

### Install virtualenv (venv) 
```
pip3 install virtualenv
python3 -m venv venv
```

### Create venv
```
virtualenv venv
```

---

## Workflow commands

### Activate venv
```
source venv/bin/activate
```

### Deactivate venv
```
deactivate
```

### Start app
From root server directory, run:
```
flask run
```
