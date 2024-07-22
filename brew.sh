#!/usr/bin/env bash

set -euo pipefail

formulae=(
	anchore/grype/grype
	bazel
	exercism
	exiftool
	ffmpeg
	gradle
	highlight
	httpie
	hyperfine
	kind
	kubebuilder
	kubernetes-cli
	maven
	noahgorstein/tap/jqp
	ncdu
	pdfgrep
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
