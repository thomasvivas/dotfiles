# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To load from a custom file you can use:
# source ($nu.default-config-dir | path join 'custom.nu')

$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend '/opt/homebrew/bin'
    | prepend '/Users/thomasvivas/.cargo/bin'
    | prepend '/Library/TeX/texbin/'
    | prepend '/opt/homebrew/opt/node/bin'
    | prepend '/usr/local/bin'
    | prepend '/Users/thomasvivas/.local/bin'
)

# FML
$env.GPG_TTY = ( tty )
$env.EDITOR = "hx"
$env.LS_COLORS = "di=1;34:fi=0;32:ln=1;36:pi=1;33:so=1;35:bd=1;33;41:cd=1;33;43:or=1;31;41:mi=0;37;41:ex=1;32:*.txt=0;33:*.md=0;35"

$env.MANPAGER = "hx"

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
