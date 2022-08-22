return {
  theme = "dracula",
  background = "ship.png",
  default_programs = {
    terminal = "alacritty",
    editor = "alacritty -e nvim",
    browser = "google-chrome-stable",
    file_manager = "alacritty -e ranger",
    lock = 'i3lock-fancy-multimonitor',
    email = "thunderbird",
    chat = "discord-canary",
    screenshot = "flameshot gui",
  },
  profile_picture = "dracula.svg",
  bar = {
    left = {
      {"menu","color1"}, 
      {"focused","color2"},
    },
    center = {
      {"tags",{"color2", "color8"}},
    },
    right = {
      {"volume","color7"},
      {"battery","color5"},
      {"network","color4"},
      {"notifications-bar","color3"},
      {"bluetooth","color8"},
      {"clock","color2"},
      {"end-session","color1"},
    }
  },
  window_gaps = 4,
  window_border_size = 7

}
