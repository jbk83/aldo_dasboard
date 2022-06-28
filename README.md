# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby version
3.1.0

* Configuration
Everything can be started with docker-compose:

`docker-compose build`
`docker-compose up -d`

The first time run:
`docker-compose exec -T web rails db:setup`

* How to run the test suite
docker-compose up -d
docker-compose exec -T web rspec

