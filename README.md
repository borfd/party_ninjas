# README

A webapp for all the party ninjas. Uses Ruby on Rails, Sidekiq, Postgres and Redis.

Currently it is hosted on Pivotal Web Services, product decisions happen on PivotalTracker https://www.pivotaltracker.com/n/projects/1991487

Run using normal rails s (will use Puma).

Run a worker process with `COUNT=1 rake resque:workers`

