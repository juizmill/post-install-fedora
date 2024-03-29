# Added by Toolbox App
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# Alias Docker
alias dcu="docker-compose up -d"
alias dcs="docker-compose stop"
alias dcs="docker-compose exec $1 /bash"

# Alias Git
alias gs="git status"
alias ga="git add --all"
alias gc="git commit -am"
alias gl="git log"
alias gcz="git cz"

# Alias Laravel
alias a="php artisan"
alias as="php artisan serve"
alias akg="php artisan key:generate"
alias am="php artisan migrate"
alias ams="php artisan migrate --seed"
alias adbs="php artisan db:seed"

# Alias Laravel Sail
alias sup="sail up -d"
alias stp="sail stop"
alias s="sail artisan"
alias ss="sail serve"
alias skg="sail key:generate"
alias sm="sail migrate"
alias sms="sail migrate --seed"
alias sdbs="sail db:seed"

