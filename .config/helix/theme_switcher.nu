let config_location = $env.HOME | path join ".config/helix/config.toml"
let themes = open ($env.HOME | path join ".config/helix/themes.toml")

def update_theme [] {
    mut config = open $config_location
    let system_theme = (^defaults read -g AppleInterfaceStyle | complete)
    let new_theme = if $system_theme.stdout =~ "Dark" {
        $themes.dark
    } else {
        $themes.light
    }

    if $new_theme != $config.theme {
        $config.theme = $new_theme
        $config | to toml | save -f $config_location
    }

}

let check_interval = 2sec
loop {
    update_theme
    sleep $check_interval
}
