if [ $(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}') == "fr(bepo)"]; then
  xmodmap ~/.Xmodmap
fi
