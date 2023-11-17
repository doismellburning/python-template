.PHONY: bootstrap
bootstrap:
	pipenv install --dev

.PHONY: check
check:
	pipenv run black --check .

.PHONY: fix
fix:
	pipenv run black .
