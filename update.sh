cp README.template.md _README.md

_star_icon='<img src="https://img.icons8.com/material-outlined/14/christmas-star.png"/>'
_fork_icon='<img src="https://img.icons8.com/external-royyan-wijaya-detailed-outline-royyan-wijaya/13/null/external-code-development-royyan-wijaya-detailed-outline-royyan-wijaya-4.png"/>'

_stat() {
    repo=$1
    r=$(curl -s "https://api.github.com/repos/$repo?page=$i&per_page=1")
    star=$(echo $r | jq '.stargazers_count')
    fork=$(echo $r | jq '.forks')
    echo "$repo,$star,$fork"
    [ "$star" -ge 0 ] && sed -i "s|{$repo/star}|$_star_icon$star|g" _README.md || exit 0
    [ "$fork" -ge 0 ] && sed -i "s|{$repo/fork}|$_fork_icon$fork|g" _README.md || exit 0
}

_stat yaocccc/dwm
_stat yaocccc/st
_stat yaocccc/tabbed
_stat yaocccc/scripts
_stat yaocccc/omz
_stat yaocccc/wallpaper
_stat yaocccc/rime
_stat yaocccc/yaocccc
_stat yaocccc/nvim
_stat yaocccc/nvim-hlchunk
_stat yaocccc/nvim-hl-mdcodeblock.lua
_stat yaocccc/nvim-lines.lua
_stat yaocccc/vim-comment
_stat yaocccc/vim-surround
_stat yaocccc/vim-showmarks
_stat yaocccc/vim-echo
_stat yaocccc/nvim-foldsign
mv _README.md README.md
