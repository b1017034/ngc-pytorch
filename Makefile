.PHONY: up down

init:
	git submodule update --init

up:
	docker-compose up -d
	docker-compose exec nvidia bash
	
build:
	docker-compose up -d --build
	docker-compose exec nvidia bash

down:
	docker-compose down
