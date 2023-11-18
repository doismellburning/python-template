.PHONY: bootstrap
bootstrap:
	pipenv install --dev

.PHONY: check
check: black flake8 isort mypy

.PHONY: black
black:
	pipenv run black --check .

.PHONY: flake8
flake8:
	pipenv run flake8 .

.PHONY: isort
isort:
	pipenv run isort --check-only .

.PHONY: mypy
mypy:
	pipenv run mypy .

.PHONY: fix
fix:
	pipenv run black .
	pipenv run isort .

.PHONY: test
test:
	pipenv run pytest --cov=. .
