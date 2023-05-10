#update Neovim to lastest from master
upnvim() {
  cd ~/robando-githings/neovim
  git pull
  make distclean
  make CMAKE_BUILD_TYPE=RelWithDebInfo -j4
  sudo make install
  #maybe here put the password
}

notevim(){
  local note
  note=$(fd . ~/notes | fzf)
  if [[ -n $note ]] then
    nvim $note
  fi
}

test(){
  printf 'hello world'
}

