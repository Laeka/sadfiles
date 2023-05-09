alias v="nvim"
alias v.="nvim ."
alias zshrc="nvim ~/.config/zsh/.zshrc"
alias ezsh="exec zsh"
alias cnv="cd ~/.config/nvim"
alias cnf="cd ~/.config/"
alias pstudy="cd ~/PROG/s/"
alias pwork="cd ~/PROG/w/"
alias pproject="cd ~/PROG/p/"
alias dstudy="cd ~/Dropbox/laeka-laptop/PROG/s/"
alias ilua="nvim ~/.config/nvim/init.lua"
alias plua="nvim ~/.config/nvim/lua/plugins.lua"
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
#GIT 
alias gdotc='git -C ~/dotfiles commit -a -m'
alias gdots='git -C ~/dotfiles status'
alias gijs='git init && echo "node_modules" >> .gitignore'
alias ghweb='gh repo view --web'
alias gu='gitui'
alias ng='npm init -y && git init && echo "node_modules" >> .gitignore'
#TMUX
alias txnew='tmux new -s $SESSION'
alias txls='tmux ls'
alias txa='tmux a -t $SESSION'
alias txk='tmux kill-session -t $SESSION'
