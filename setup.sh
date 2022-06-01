#!/bin/sh

# Install oh-my-zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins that don't come pre-installed
cd ~/.oh-my-zsh/plugins
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth 1 https://github.com/zsh-users/zsh-completions.git
git clone --depth 1 https://github.com/zsh-users/zsh-history-substring-search.git
cd ../..

# Change theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/g' .zshrc
# Change plugins and add the fpath for zsh-completions
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-completions zsh-history-substring-search docker docker-compose colorize cp encode64 npm nvm python pyenv rsync systemd tmux virtualenv yarn)\n\nfpath+=${ZSH_CUSTOM:-${ZSH:-~\/.oh-my-zsh}\/custom}\/plugins\/zsh-completions\/src/g' .zshrc
# Don't syntax highlight when pasting since it can take too long
echo "\n# Don't syntax highlight when pasting" >> .zshrc
echo 'zle_highlight+=(paste:none)' >> .zshrc

zsh