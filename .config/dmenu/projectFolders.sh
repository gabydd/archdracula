chosen="$HOME/$(echo $(find ~/dev -type d -print && find ~/school -type d -print && find ~/.config -type d -print) | tr " " "\n" | sed 's/\/home\/gaby/~/' | dmenu -i -l 5 -p "Which folder" | sed 's/~\///')" || exit 1
alacritty -c nvim $chosen
