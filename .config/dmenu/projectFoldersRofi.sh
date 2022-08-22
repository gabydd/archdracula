chosen=$(echo $(find ~/Documents/Projects -type d -print && find ~/Documents/School -type d -print && find ~/.config -type d -print) | tr " " "\n" | sed 's/\/home\/gaby/~/' | rofi -dmenu -p "Which folder" -theme centered.rasi -columns 1 | sed 's/~/\/home\/gaby/') || exit 1
codium $chosen
