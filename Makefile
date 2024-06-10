api-up:
	poetry run uvicorn serving.api:app --host 0.0.0.0 --port 8080 --reload
.PHONY: api-up

lint-fix:
	poetry run isort src tests
	poetry run black src tests
.PHONY: lint-fix

test:
	poetry run pytest tests
.PHONY: test

docker-build:
	docker build -t serving  -f Dockerfile .
.PHONY: docker-build 

docker-start:
	docker run -p 8080:8080 serving serve-dev
.PHONY: docker-start
