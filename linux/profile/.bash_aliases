# Colorize output
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto' 

# Shortcuts
alias c='clear'
alias f='free -h'
alias h='history'
alias j='jobs'
alias n='nano'
alias sun='sudo nano'
alias update='apt-get update && apt-get dist-upgrade --yes'
alias bashrc='. ~/.bashrc'
alias bashal='nano ~/.bash_aliases'
alias bashfn='nano ~/.bash_functions'

# I/O
alias ll='ls -la'
alias ld='ls -d .*'
alias mkdir='mkdir -pv'

# Stats
alias netp='netstat -tulanp'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias df='df -H'
alias du='du -ch'

# fzf
alias hzf='history | fzf | cut -d" " -f4-`\e\C-e"'
alias pzf='fzf --preview="bat --color=always {}"'
alias xzf='fzf | xclip -selection clipboard'
