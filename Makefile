SRCDIR=src
TESTDIR=test
CODEDIRS=$(SRCDIR) $(TESTDIR)

.PHONY: bootstrap
bootstrap:
	uv sync --dev

.PHONY: check
check: format lint ty

.PHONY: format
format:
	uv run ruff format --check $(CODEDIRS)

.PHONY: lint
lint:
	uv run ruff check $(CODEDIRS)

.PHONY: ty
ty:
	uv run ty check

.PHONY: fix
fix:
	uv run ruff format $(CODEDIRS)
	uv run ruff check --fix $(CODEDIRS)

.PHONY: test
test:
	uv run coverage run --source $(SRCDIR) --module pytest test
	uv run coverage report
	uv run coverage html
