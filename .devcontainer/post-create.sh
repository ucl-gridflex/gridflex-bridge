#!/usr/bin/env bash
set -euo pipefail

export PATH="$HOME/.local/bin:$PATH"
mkdir -p "$HOME/.local/bin"

echo "[postCreate] Installing base deps..."
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends ca-certificates curl tar git
sudo rm -rf /var/lib/apt/lists/*

install_just() {
  if command -v just >/dev/null 2>&1; then
    echo "[postCreate] just already present: $(command -v just)"
    return
  fi
  echo "[postCreate] Installing just -> $HOME/.local/bin"
  curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh \
    | bash -s -- --to "$HOME/.local/bin"
}

install_gum() {
  local ver="0.17.0"
  local arch tgz sha_url base tmp
  arch="$(uname -m)"
  case "$arch" in
    aarch64|arm64) tgz="gum_${ver}_Linux_arm64.tar.gz" ;;
    x86_64|amd64)  tgz="gum_${ver}_Linux_x86_64.tar.gz" ;;
    *) echo "Unsupported arch: $arch" >&2; exit 1 ;;
  esac

  base="https://github.com/charmbracelet/gum/releases/download/v${ver}"
  sha_url="${base}/checksums.txt"

  tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' RETURN
  curl -LsSf "${base}/${tgz}" -o "$tmp/$tgz"
  curl -LsSf "$sha_url" -o "$tmp/checksums.txt"

  (cd "$tmp" && grep " ${tgz}\$" checksums.txt | sha256sum -c -)

  tar -xzf "$tmp/$tgz" -C "$tmp"
  install -m 0755 "$(find "$tmp" -type f -name gum -perm -111 | head -n1)" "$HOME/.local/bin/gum"
}

install_uv_tools() {
  if ! command -v uv >/dev/null 2>&1; then
    echo "[postCreate] Installing uv -> $HOME/.local/bin"
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi

  export PATH="$HOME/.local/bin:$PATH"

  echo "[postCreate] Installing uv tools (pre-commit, ruff, import-linter)..."
  uv tool install --upgrade pre-commit
  uv tool install --upgrade ruff
  uv tool install --upgrade import-linter
}

setup_precommit() {
  # pre-commit can error if not a git repo yet; don't brick container
  if [[ -d .git ]]; then
    echo "[postCreate] Installing pre-commit hooks..."
    pre-commit install --install-hooks || true
  else
    echo "[postCreate] No .git directory; skipping pre-commit hook install."
  fi
}

install_just
install_gum
install_uv_tools
setup_precommit

echo "[postCreate] Done. Versions:"
just --version || true
gum --version || true
uv --version || true
ruff --version || true
pre-commit --version || true
