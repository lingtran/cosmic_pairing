# Cosmic Pairing API

## Rails version
`Rails 7.1.2`

## Ruby version
`ruby-3.0.0`
See `.ruby-version` file for info.

## Database: Postgres

### Install dependency

#### `brew install postgresql`
Install postgresql server

#### `brew services start postgresql`
Start server. Or `brew services run postgresql` if do not want restart at boot time.

#### `psql postgres`
Test connection from `/server/cosmic_pairing_api`

### Create database
From root of api directory

#### `bin/rails db:create`

## Start API server

### `bin/rails s`

### visit `localhost:3000/test`
> Should see text "Hello, world! Let the cosmos pair"

===

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
