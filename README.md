# README

A webapp for all the party ninjas. Uses Ruby on Rails, Sidekiq, Postgres and Redis.

Run using normal rails s (will use Puma).

Run a worker process with `COUNT=1 rake resque:workers`