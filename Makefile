SRCDIR=.

.PHONY: bootstrap
bootstrap:
	pipenv install --dev

.PHONY: check
check: black lint mypy

.PHONY: black
black:
	pipenv run black --check $(SRCDIR)

.PHONY: lint
lint:
	pipenv run ruff check $(SRCDIR)

.PHONY: mypy
mypy:
	pipenv run mypy $(SRCDIR)

.PHONY: fix
fix:
	pipenv run black $(SRCDIR)
	pipenv run ruff check --fix $(SRCDIR)

.PHONY: test
test:
	pipenv run pytest --cov=$(SRCDIR) $(SRCDIR)
