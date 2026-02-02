############################################################
# HISTÓRICO
############################################################
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="(%d/%m/%y - %H:%M:%S) -> "
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

############################################################
# FUNÇÃO PRE_PROMPT (ORIGINAL)
############################################################
function pre_prompt {

    newPWD="${PWD}"
    user="$(whoami)"
    host=$(echo -n "$HOSTNAME" | sed -e "s/[\.].*//")
    datenow=$(date "+%a, %d %b %y")

    let promptsize=$(echo -n "┌($user@$host ddd., DD mmm YY)(`date \"+%H:%M\"`)┐" \
        | wc -c | tr -d " ")

    let fillsize=${COLUMNS}-${promptsize}
    fill=""

    while [ "$fillsize" -gt "0" ]
    do
        fill="${fill}─"
        let fillsize=${fillsize}-1
    done

    if [ "$fillsize" -lt "0" ]
    then
        let cutt=3-${fillsize}
        newPWD="...$(echo -n "$PWD" | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
    fi
}

PROMPT_COMMAND=pre_prompt

############################################################
# CORES (AZUL MÉDIO)
############################################################
export black="\[\033[0;38;5;0m\]"
export red="\[\033[0;38;5;1m\]"
export orange="\[\033[0;38;5;130m\]"
export green="\[\033[0;38;5;2m\]"
export yellow="\[\033[0;38;5;3m\]"
export blue="\[\033[0;38;5;25m\]"
export bblue="\[\033[0;38;5;26m\]"
export magenta="\[\033[0;38;5;55m\]"
export cyan="\[\033[0;38;5;6m\]"
export white="\[\033[0;38;5;6m\]"
export coldblue="\[\033[0;38;5;25m\]"
export smoothblue="\[\033[0;38;5;26m\]"
export iceblue="\[\033[0;38;5;26m\]"
export turqoise="\[\033[0;38;5;50m\]"
export smoothgreen="\[\033[0;38;5;42m\]"
export myred="\[\033[01;31m\]"

############################################################
# PS1 (LINHA CONTÍNUA NO FINAL)
############################################################
PS1="\n \n\
┌─\[$(tput bold)\]\[\033[38;5;25m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \
\[$(tput bold)\]\u\[$(tput sgr0)\] \
\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;26m\]@\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \
\[$(tput bold)\]\h\[$(tput sgr0)\] \
\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;26m\]]\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \
\${fill}\033[38;5;11m\][\t]\[$(tput sgr0)\] \n\
├─\[$(tput bold)\]\[\033[38;5;26m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \
\[$(tput bold)\]\w\[$(tput sgr0) \]\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;26m\]]\[$(tput sgr0)\] \
\[$(tput bold)\]\[\033[38;5;26m\][\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \
\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \
\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')  \
\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;26m\]]\[$(tput sgr0)\]     \n\
│\n\
└\[\033[38;5;25m\]───\[$(tput sgr0)\]\[\033[38;5;15m\] \
\[$(tput sgr0)\]\[\033[38;5;25m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] : \[$(tput sgr0)\]"
