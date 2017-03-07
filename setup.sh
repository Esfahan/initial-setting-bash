#!/bin/bash

# WIP
#set_lang() {
#  echo "----------------------"
#  echo "localectl"
#  echo "----------------------"
#
#  # is_exists
#  ADDED_COMMENT='added my settings for locale'
#  cat ~/.bash_profile | grep -w "${ADDED_COMMENT}" > /dev/null 2>&1
#  if [ $? = 1 ]; then
#    SET_LANG=$1
#    echo ${SET_LANG}
#    # localectl
#    CMD="localectl set-locale LANG=${SET_LANG}"
#    echo $CMD
#    $CMD
#
#    # set LC_CTYPE
#    echo "----------------------"
#    echo "edit ~/.bash_profile"
#    echo "----------------------"
#    SET_LC="\n# ${ADDED_COMMENT}\nexport LC_CTYPE='${SET_LANG}'"
#    echo -e ${SET_LC}
#    echo -e $SET_LC >> ~/.bash_profile;
#    source ~/.bash_profile
#
#    # set timezone
#    echo "----------------------"
#    echo "set timezone as Japan"
#    echo "----------------------"
#    cmd="sudo cp /usr/share/zoneinfo/Japan /etc/localtime"
#    echo $cmd
#    $cmd
#
#    date
#    sudo cat /etc/locale.conf
#  else
#    echo 'already exists.'
#  fi
#
#}
#
## set LANG
#while read -p "Do you want to run localectl to set LANG as utf8?[y/n] " yn ; do
#  case $yn in
#    [Yy]* ) {
#      while read -p "1: en_US.utf8, 2: ja_JP.utf8[1/2] " lang ; do
#        case $lang in
#          [1]* ) {
#            set_lang "en_US.utf8"
#            break
#          };;
#          [2]* ) {
#            set_lang "ja_JP.utf8"
#            break
#          };;
#          * ) echo "Please answer 1 or 2.";;
#        esac
#
#      done
#      break
#    };;
#    [Nn]* ) break;;
#    * ) echo "Please answer yes or no.";;
#  esac
#done


# set timezone
echo "----------------------"
echo "set timezone as Japan"
echo "----------------------"
cmd="sudo cp /usr/share/zoneinfo/Japan /etc/localtime"
echo $cmd
$cmd
date

# tmux
echo "----------------------"
echo "install tmux"
echo "----------------------"
sudo yum -y install tmux

# tmux.conf
echo "----------------------"
echo "edit ~/.tmux.conf"
echo "----------------------"
cp -p ./dotfiles/tmux/tmux.conf ~/.tmux.conf
echo 'added.'

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
  tmux
fi
