.PHONY: bootstrap
bootstrap:
	pipenv install --dev

.PHONY: check
check:
	pipenv run black --check .
	pipenv run flake8 .
	pipenv run isort --check-only .
	pipenv run mypy .

.PHONY: fix
fix:
	pipenv run black .
	pipenv run isort .

.PHONY: test
test:
	pipenv run pytest --cov=. .
