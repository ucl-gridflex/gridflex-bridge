set shell := ["bash", "-euo", "pipefail", "-c"]

default: list

list:
    just --list

fmt:
    @gum spin --title "Ruff format" -- uv tool run ruff format .;

lint:
    @gum spin --title "Ruff check" -- uv tool run ruff check .;

pre-commit:
    @gum spin --title "pre-commit (all files)" -- uv tool run pre-commit run --all-files;

hooks:
    uv tool run pre-commit install --install-hooks

check: fmt lint
    just pre-commit
