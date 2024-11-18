curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Git global conifg
git config --global init.defaultBranch main
git config --global core.excludesFile ~/.config/git/.gitignore

