SRCDIR=.

.PHONY: bootstrap
bootstrap:
	uv sync --dev

.PHONY: check
check: black lint mypy

.PHONY: black
black:
	uv run black --check $(SRCDIR)

.PHONY: lint
lint:
	uv run ruff check $(SRCDIR)

.PHONY: mypy
mypy:
	uv run mypy $(SRCDIR)

.PHONY: fix
fix:
	uv run black $(SRCDIR)
	uv run ruff check --fix $(SRCDIR)

.PHONY: test
test:
	uv run coverage run --module pytest test
	uv run coverage report
	uv run coverage html
