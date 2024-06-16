#!/usr/bin/env bash

set -euo pipefail

formulae=(
	anchore/grype/grype
	bat
	bazel
	cosign
	crane
	exercism
	exiftool
	eza
	fd
	ffmpeg
	fizz
	fzf
	git
	gradle
	grpcurl
	highlight
	httpie
	hyperfine
	jq
	kind
	kubebuilder
	kubernetes-cli
	lsd
	maven
	noahgorstein/tap/jqp
	ncdu
	neovim
	nghttp2
	openjdk@17
	pdfgrep
	perl
	postgresql@14
	procs
	protobuf
	python@3.10
	python@3.11
	python@3.8
	rbenv
	ripgrep
	ruby
	ruby@3.1
	rustup-init
	starship
	stow
	tldr
	tmux
	tokei
	vault
	vercel-cli
	yazi
	wget
	zoxide
	zsh-autosuggestions
	zsh-syntax-highlighting
)

casks=(
	brave-browser
	cryptomator
	ferdium
	insomnia
	java
	keepassxc
	keybase
	meld
	osxfuse
	paw
	rectangle
	steam
	superproductivity
	uhk-agent
	virtualbox
	wezterm
	wireshark
	zoom
)

for f in "${formulae[@]}"; do
	brew install "$f"
done

for c in "${casks[@]}"; do
	brew install --cask "$c"
done
