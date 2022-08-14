# README

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
* curl --header "Content-Type: application/json" --request POST --data '{"author" : "James", "title" : "a book"}' http://localhost:3000/api/v1/books -
* curl http://localhost:3000/api/v1/books
* curl --header "Content-Type: application/json" --request POST --data '{"book":{"title" :"Eloquent Ruby"}, "author": {"first_name": "Russ","last_name": "Olse" , "age":30}}' http://localhost:3000/api/v1/books
* curl -X POST http://localhost:3000/api/v1/authenticate -H "Content-Type: application/json" -d '{"username": "baothi", "password": "Password1"}'

* curl --header "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSJ9.M1vu6qDej7HzuSxcfbE6KAMekNUXB3EWtxwS0pg4UGg" --header "Content-Type: application/json" --request POST --data '{"book":{"title" :"Eloquent Ruby"}, "author": {"first_name": "Russ","last_name": "Olse" , "age":30}}' http://localhost:3000/api/v1/books -v