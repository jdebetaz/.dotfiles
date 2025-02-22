#!/bin/bash

# Install Dev Tools
dnf groupinstall "Development Tools" -y

# Install rust
command -v cargo >/dev/null 2>&1 || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
[[ ! -d "$HOME/.cargo/bin"  ]] || . "$HOME/.cargo/env"

# Install eza
command -v eza > /dev/null 2>&1 || cargo install eza

# Install bat
command -v bat > /dev/null 2>&1 || dnf install bat -y

# Install fzf
command -v fzf > /dev/null 2>&1 || dnf isntall fzf -y
