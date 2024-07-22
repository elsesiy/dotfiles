#!/usr/bin/env bash

set -euo pipefail

formulae=(
	ncdu
	postgresql@14
	protobuf
	python@3.10
	python@3.11
	python@3.8
	rustup-init
	vault
	vercel-cli
)

for f in "${formulae[@]}"; do
	brew install "$f"
done
