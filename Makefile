all: vim tmux omz p10k

tmux:
	@echo "Installing TPM for tmux config"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -sf $$(pwd)/tmux.conf ~/.tmux.conf

vim:
	@echo "Installing Neovim and setting up config"
	# Link system Neovim config to your ./nvim folder
	mkdir -p ~/.config
	ln -sf $$(pwd)/nvim ~/.config/nvim

omz:
	@echo "Installing Oh My Zsh"
	# Install Oh My Zsh
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# Install custom zsh plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	# Link custom config files
	ln -sf $$(pwd)/zshrc.conf ~/.zshrc

p10k:
	@echo "Install powerlevel10k theme"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	ln -sf $$(pwd)/p10k.conf ~/.p10k.zsh

conda:
	@echo "Install miniconda for macos arm64 and intialize for zsh"
	mkdir -p ~/miniconda3
	curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
	bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
	rm -rf ~/miniconda3/miniconda.sh

conda_zsh:
	@echo "Initialize conda zsh completions"
	~/miniconda3/bin/conda init zsh

poetry:
	@echo "Install poetry system-wide for python project management"
	curl -sSL https://install.python-poetry.org | python3 -
	mkdir $ZSH_CUSTOM/plugins/poetry
	poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

pylsp:
	@echo "Install pylsp-related module configs"
	mkdir -p ~/.config
	ln -sf $$(pwd)/pycodestyle.conf ~/.config/.pycodestyle
