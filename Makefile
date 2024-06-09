api-up:
	poetry run uvicorn src.api:app --host 0.0.0.0 --port 8080 --reload
.PHONY: api-up

test-unit:
	poetry run pytest tests
.PHONY: test-unit