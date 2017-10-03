# demo-sinatra-puma-activerecord

## Setting up environment

### The Clever Cloud application environment

Create a ruby application, a postgresql addon and link the addon to your application.

Tell Clever Cloud to deploy the API using puma (the default is uwsgi as of now) by adding this environment variable:
`CC_RACKUP_SERVER="puma"`

Tell Clever Cloud to run database migrations before launching the API by adding this environment variable:
`CC_PRE_RUN_HOOK="bundle exec rake db:migrate"`. You can also run this locally as long as you import the correct
environment to connect to your addon.

Specify the maximum number of PG connections your application will use (depending on the selected plan)
by adding an environment variable like `DB_POOL=5` if you want to use 5 connections.

### The local ruby environment (not needed if running on Clever Cloud)

First, you need to install postgresql, ruby and bundler.

The required version of ruby is specified at the top of `gems.rb`.

If you haven't already, setup `~/.bundle/config` as such:

```
BUNDLE_PATH: .bundle
BUNDLE_DISABLE_SHARED_GEMS: "1"
```

This will cause bundle not to use system gems, and to install the local ones in the `.bundle`
directory of the applicaiton, which is `.gitignore`'d.

### The local application environment (not needed if running on Clever Cloud)

Just create a `.env` file (which is `.gitignore`'d) as such:

```
export POSTGRESQL_ADDON_HOST=localhost
export POSTGRESQL_ADDON_PORT=5432
export POSTGRESQL_ADDON_USER=user
export POSTGRESQL_ADDON_PASSWORD=secret
export POSTGRESQL_ADDON_DB=demo
```

You can also add

```
export DB_POOL=<the pool size>
```

For production, you should also add:
```
export RACK_ENV=production
export RAILS_ENV=production
```

## Start the API on Clever Cloud

Just run `git push` or hit the redeploy button if you run it from a github fork, nothing else to do.

## Start the API locally (not needed if running on Clever Cloud)

```
source .env
bundle install
bundle exec rake db:migrate
bundle exec rackup
```

## Coding style

- run `bundle exec rake`
- fix the warnings :-)
