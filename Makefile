api-up:
	poetry run uvicorn src.api:app --host 0.0.0.0 --port 8080 --reload
.PHONY: api-up

lint-fix:
	poetry run isort src tests
	poetry run black src tests
.PHONY: lint-fix

test-unit:
	poetry run pytest tests
.PHONY: test-unit