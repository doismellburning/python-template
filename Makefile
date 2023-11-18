SRCDIR=.

.PHONY: bootstrap
bootstrap:
	pipenv install --dev

.PHONY: check
check: black flake8 isort mypy

.PHONY: black
black:
	pipenv run black --check $(SRCDIR)

.PHONY: flake8
flake8:
	pipenv run flake8 $(SRCDIR)

.PHONY: isort
isort:
	pipenv run isort --check-only $(SRCDIR)

.PHONY: mypy
mypy:
	pipenv run mypy $(SRCDIR)

.PHONY: fix
fix:
	pipenv run black $(SRCDIR)
	pipenv run isort $(SRCDIR)

.PHONY: test
test:
	pipenv run pytest --cov=$(SRCDIR) $(SRCDIR)
