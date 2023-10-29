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
	wget
	zoxide
	zsh-autosuggestions
	zsh-syntax-highlighting
)

casks=(
	adoptopenjdk11
	brave-browser
	cryptomator
	ferdium
	insomnia
	iterm2
	java
	keepassxc
	keybase
	meld
	ngrok
	osxfuse
	paw
	rectangle
	secretive
	steam
	superproductivity
	uhk-agent
	virtualbox
	wireshark
	zoom
)

for f in "${formulae[@]}"; do
	brew install "$f"
done

for c in "${casks[@]}"; do
	brew install --cask "$c"
done
