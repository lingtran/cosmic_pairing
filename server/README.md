# cosmic-pairing servier

This is the server-side app for Cosmic Pairing. See [/client/README.md](/client/README.md) for client-side app for Cosmic Pairing

## Rails version
`Rails 7.1.2`

## Ruby version
`ruby-3.0.5`

See `.ruby-version` file for info

## RVM version
`1.29.12`

---
## Project Setup

### Prerequisite: Homebrew
Install Homebrew at [https://brew.sh/](https://brew.sh/)

### Install ruby
`rvm install ${RUBY_VERSION}`

Run if using rvm or substitute with appropriate ruby version manager as needed

### Install postgres
#### `brew install postgresql`
Install postgresql server

#### `brew services start postgresql`
Start server

Or run `brew services run postgresql` if do not want restart at boot time

#### `psql postgres`
Test connection from directory root `/server/cosmic_pairing_api/`

Run `\q` to quit exit psql

### Install project dependencies
#### `bundle install`
Installs dependencies listed in Gemfile

#### `bin/rails db:create`
Create database. Run from directory root `/server/cosmic_pairing_api/`

---
## Workflow commands

### `bin/rails s`
Start server. Runs on `localhost:3000/`

### Brew commands: postgresql
```
brew services start postgresql  # to start the service at boot time

brew services stop postgresql  # to stop the service immediately

brew services run postgresql  # to not restart service at boot time

brew services restart postgresql  # if want to just restart
```

### Create Postgres database
```
psql postgres  # to connect/use psql as your user

postgres=# \l  #to get list of databases

postgres=# CREATE DATABASE <see env file for name>;  #if database does not exist

postgres=# \l  #to verify database created successfully
```

### `bin/rails db:migrate`
Migrate schema only

### `bin/rails data:migrate`
Migrate database data only

### `bin/rails db:migrate:with_data`
Migrate both schema and database data

See rake tasks available [here](https://github.com/ilyakatz/data-migrate#rake-tasks)

### `bin/rails db:version`
Get current schema version

### `bin/rails data:version`
Get current schema version for data migrations

### `bin/rails db:version:with_data`
Get both schema and data migration versions

### `standardrb`
Linter

### `standardrb --fix`
Lint and apply fixes

### Run tests

### `bin/rspec`*
Run all spec files

If for some reason `Rails.env.test?` returns `false`, the quickest workaround is passing in the env as such `RAILS_ENV='test' bin/rspec`

### *May need to generate a binstub
Run `bundle binstubs rspec-core` to enable using `bin/rspec`

This is an **optional** alternative to default `bundle exec rspec`

### `bin/rspec ${relative file path}`
Run single spec file

See more [commands for running specs](https://github.com/rspec/rspec-rails#running-specs)


---
## Workflow tips

### Create controller only

`bin/rails g controller api/v1/${RESOURCE_NAME} ${action} -T -j=false -y=false --skip-template-engine --no-helper`

---

## Routes
### `/test`
Hello, world! page
> Should see text "Hello, world! Let the cosmos pair"

---
## HOLD: services

---
## HOLD: deployment instructions
