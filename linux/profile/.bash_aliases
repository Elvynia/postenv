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
alias bashal='nano ~/.bash_aliases'
alias bashed='nano ~/.bashrc'
alias bashfn='nano ~/.bash_functions'
alias bashrc='. ~/.bashrc'

# I/O
alias ll='ls -la'
alias ld='ls -d .*'
alias mkdir='mkdir -pv'
alias csync='rsync -avh --info=progress2'
alias msync='csync --remove-source-files '

# Stats
alias netp='netstat -tulanp'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'
alias df='df -H'
alias du='du -ch'

# fzf
alias hzf='history | xzf'
alias pzf='fzf --preview="bat --color=always {}"'
alias xzf='fzf | printf "\e]52;c;%s\a" "$(base64 -w0)"'

# Dev on nanny
alias postenv='curl -fsSL https://raw.githubusercontent.com/Elvynia/postenv/main/linux/install.sh | bash \
    && . ~/.bashrc'
alias postbash='. /opt/lv/postenv/linux/profile/index.sh'
