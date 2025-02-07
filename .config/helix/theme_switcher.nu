let config_location = $env.HOME | path join ".config/helix/config.toml"
let themes = open ($env.HOME | path join ".config/helix/themes.toml")

def update_theme [] {
  let system_theme = (^defaults read -g AppleInterfaceStyle | complete)
  let theme = if $system_theme.stdout =~ "Dark" {
      "\"" + $themes.dark + "\""
  } else {
      "\"" + $themes.light + "\""
  }
  

  let unmodified_content = (cat $config_location) | lines | range 1.. | str join "\n"
  [("theme = " + $theme), $unmodified_content] | str join "\n" | save -f $config_location
}

update_theme

let check_interval = 2sec
loop {
    sleep $check_interval
    update_theme
}
