#!/bin/sh
# Script to setup VIM and ZSH
# SUMMARY:
# This downloads my repo of configuration files like ZSHRC and VIMRC
# Creates VIMRC and ZSHRC that will just source the corresponding files in REPO
# For VIM this also installs plugins  (using Vundle plugin)


###########################################################{ init_files repo setup
#Directory which will contain the local GIT repo, 
#which will contain all the configuration files
init_file_repo_dir="$HOME/.init_files.git"

if [ -d "$init_file_repo_dir" ]; then
    echo "Directory $init_file_repo_dir exists; Removing it"
    rm -rf "$init_file_repo_dir"
fi

echo "Cloning Github repo swarnaprakash/init_files into $init_file_repo_dir"
git clone http://github.com/swarnaprakash/init_files.git "$init_file_repo_dir"
##########################################################} init_files repo setup


##############################################################{ VIM setup
echo "Setting up VIM"

vim_dir="$HOME/.vim"
mkdir -p "$vim_dir"

#vimrc expect vundle dir in this location
vundle_dir="$vim_dir/vundle.git"
if [ -d "$vundle_dir" ]; then
    echo "Directory "$vundle_dir" exists; Removing it"
    rm -rf "$vundle_dir"
fi

echo "Cloning Gtihub repo gmarik/vundle into $vundle_dir"
git clone http://github.com/gmarik/vundle.git "$vundle_dir"

vimrc_file="$HOME/.vimrc"
if [ -f "$vimrc_file" ]; then
    echo "$vimrc_file exists. Moving it to $vimrc_file.bak"
    mv "$vimrc_file" "$vimrc_file.bak"
fi

vimrc="
source $init_file_repo_dir/vim/vimrc
autocmd! BufNewFile * silent! 0r $init_file_repo_dir/vim/skeletons/template.%:e
"

echo "Creating $vimrc_file"
echo "$vimrc" > "$vimrc_file"

echo "Installing Plugins"
#Open Vim, run BundleInstall! (new plugin/update plugin), run BundleClean (remove deleted plugin), then quit (via q).
vim +BundleInstall! +BundleClean +q /dev/zero

echo "VIM setup complete"
############################################################} End VIM setup


###############################################################{ ZSH setup
echo "Setting up ZSH"

zshrc_file="$HOME/.zshrc"
if [ -f "$zshrc_file" ]; then
    echo "$zshrc_file exists. Moving it to $zshrc_file.bak"
    mv "$zshrc_file" "$zshrc_file.bak"
fi

zshrc="
source $init_file_repo_dir/zsh/zshrc
"

echo "Creating $zshrc_file"
echo "$zshrc" > "$zshrc_file"

echo "ZSH setup complete"
###############################################################} ZSH setup

