## Overview

AllCollate it is place which makes the ability to choose hotels easily.

## Technology

* Ruby On Rails
* ReactJS
* PostgreSQL
* AWS

## Setup

In your local machine you have to install (you can use rvm if you want):

* [Ruby 2.7.1](https://www.ruby-lang.org/en/downloads/)
* [Yarn](https://yarnpkg.com)
* [PSQL](https://www.postgresql.org)

## Restore DB

Create DB
```
$ rake db:create
```

Restore DB Dump
```
$ psql -d allcollate_development < db_dump/allcollate_development_dump.sql
```

Run DB migrations
```
$ rake db:migrate
```

## Start

Install gems
```
$ bundle install
```

Install npm packages
```
$ yarn install
```

To start the server run the command in the terminal _(do not stop the server)_

```
$ rails s
```

To compile the JS (React) run the command in a **new terminal window** _(do not stop)_

```
$ bin/webpack-dev-server
```
