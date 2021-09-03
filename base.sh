#!/bin/bash

# set timezone
echo "----------------------"
echo "set timezone as Japan"
echo "----------------------"
cmd="sudo cp /usr/share/zoneinfo/Japan /etc/localtime"
echo $cmd
$cmd
date

# vim
echo "----------------------"
echo "install vim-enhanced"
echo "----------------------"
sudo yum -y install vim-enhanced
sudo mv /bin/vi /bin/vim-tiny
sudo ln -s /usr/bin/vim /bin/vi

# vimrc
echo "----------------------"
echo "edit ~/.vimrc"
echo "----------------------"
if [ ! -e ~/.vimrc ]; then
  touch ~/.vimrc
  echo 'touch ~/.vimrc'
fi

ADDED_COMMENT='added my settings for vim'
cat ~/.vimrc | grep -w "${ADDED_COMMENT}" > /dev/null 2>&1
if [ $? = 1 ]; then
  cat ./dotfiles/vim/vimrc >> ~/.vimrc
  echo 'added.'

  echo "----------------------"
  echo "copy ~/.vim/ftplugin"
  echo "----------------------"
  if [ ! -d ~/.vim/ftplugin/ ]; then
    mkdir -p ~/.vim/ftplugin/
    echo 'mkdir -p ~/.vim/ftplugin/'
  fi

  cp -p ./dotfiles/vim/ftplugin/* ~/.vim/ftplugin/
  echo 'added.'

else
  echo 'alreday exists.'
fi

# bash_profile
echo "----------------------"
echo "edit ~/.bash_profile"
echo "----------------------"
if [ ! -e ~/.bash_profile ]; then
  touch ~/.bash_profile
  echo 'touch ~/.bash_profile'
fi
if [ ! -e ~/.git-prompt.sh ]; then
  touch ~/.git-prompt.sh
  echo 'touch ~/.git-prompt.sh'
fi
if [ ! -e ~/.git-completion.bash ]; then
  touch ~/.git-completion.bash
  echo 'touch ~/.git-completion.bash'
fi

# my_profile
cp ./dotfiles/my_profile ~/.my_profile

ADDED_COMMENT_BP='added my settings'
cat ~/.bash_profile | grep -w "${ADDED_COMMENT_BP}" > /dev/null 2>&1
if [ $? = 1 ]; then
  # https://github.com/git/git/tree/master/contrib/completion
  cat ./dotfiles/git/git-prompt.sh > ~/.git-prompt.sh
  cat ./dotfiles/git/git-completion.bash > ~/.git-completion.bash
  cat ./dotfiles/bash_profile >> ~/.bash_profile
  echo 'added.'
else
  echo 'alreday exists.'
fi

tmux list-client > /dev/null 2>&1
if [ $? = 1 ]; then
  cd ~
  tmux
fi

if [ ! -d ~/.vim/bundle/vim-vue/ ]; then
  git clone https://github.com/posva/vim-vue.git ~/.vim/bundle/vim-vue
fi

if [ ! -d ~/.vim/bundle/typescript-vim/ ]; then
  git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim
fi
