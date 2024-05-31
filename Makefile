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
