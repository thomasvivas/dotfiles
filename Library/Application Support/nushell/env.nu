# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
# 
# See https://www.nushell.sh/book/configuration.html
# Also see `help config env` for more options.

$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend '/opt/homebrew/bin'
    | prepend '~/.cargo/bin'
)

$env.EDITOR = "hx"
$env.LS_COLORS = "di=1;34:fi=0;32:ln=1;36:pi=1;33:so=1;35:bd=1;33;41:cd=1;33;43:or=1;31;41:mi=0;37;41:ex=1;32:*.txt=0;33:*.md=0;35"
$env.config.show_banner = false

$env.GPG_TTY = ( tty )

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
