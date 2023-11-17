.PHONY: bootstrap
bootstrap:
	pipenv install --dev

.PHONY: check
check:
	pipenv run black --check .
	pipenv run flake8 .

.PHONY: fix
fix:
	pipenv run black .
