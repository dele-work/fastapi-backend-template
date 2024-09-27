#!/usr/bin/make

include .env

help:
	@echo "make"
	@echo "    install"
	@echo "        Install all packages of poetry project locally."
	@echo "    run-app"
	@echo "        Run app locally without docker."
	@echo "    run-dev-build"
	@echo "        Run development docker compose and force build containers."
	@echo "    run-dev"
	@echo "        Run development docker compose."
	@echo "    stop-dev"
	@echo "        Stop development docker compose."
	@echo "    run-prod"
	@echo "        Run production docker compose."
	@echo "    stop-prod"
	@echo "        Run production docker compose."
	@echo "    formatter"
	@echo "        Apply black formatting to code."
	@echo "    mypy"
	@echo "        Check typing."
	@echo "    lint"
	@echo "        Lint code with ruff, and check if black formatter should be applied."
	@echo "    lint-watch"
	@echo "        Lint code with ruff in watch mode."
	@echo "    lint-fix"
	@echo "        Lint code with ruff and try to fix."

install:
	cd src && poetry install && cd ../..

run-app:
	cd src && poetry run uvicorn app.main:app --host 0.0.0.0 --port 8000 && cd ..

run-dev-build:
	$(MAKE) find-port
	docker-compose up --build

run-dev:
	$(MAKE) find-port
	docker-compose up

stop-dev:
	docker-compose down

stop-prod:
	docker-compose down

formatter:
	cd src && \
	poetry run black app

mypy:
	cd src && \
	poetry run mypy .

lint:
	cd src && \
	poetry run ruff app && poetry run black --check app

lint-watch:
	cd src && \
	poetry run ruff app --watch

lint-fix:
	cd src && \
	poetry run ruff app --fix

find-port:
	@echo "Finding available port..."
	@PORT=8000; \
	while lsof -Pi :$$PORT -sTCP:LISTEN -t >/dev/null ; do \
		PORT=$$((PORT+1)); \
	done; \
	echo "\033[0;32mUsing available port: $$PORT\033[0m"; \
	sed -i.bak "s/8000:8000/$$PORT:8000/g" docker-compose.yml
