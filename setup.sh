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

# tmux
#echo "----------------------"
#echo "install tmux"
#echo "----------------------"
#sudo yum -y install tmux

# install tmux2.4
git clone https://github.com/Esfahan/installer-tmux.git
bash ./installer-tmux/setup.sh

# tmux.conf
echo "----------------------"
echo "edit ~/.tmux.conf"
echo "----------------------"
cp -p ./dotfiles/tmux/tmux.conf ~/.tmux.conf
echo 'added.'

./base.sh
