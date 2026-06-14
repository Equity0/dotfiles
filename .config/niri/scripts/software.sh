#!/bin/bash

if ! command -v gaur &>/dev/null; then
    if command -v paru &>/dev/null; then
        alacritty --title gaur-install -e bash -c "paru -S gaur-bin && echo '安装完成，按任意键退出...' && read"
    elif command -v yay &>/dev/null; then
        alacritty --title gaur-install -e bash -c "yay -S gaur-bin && echo '安装完成，按任意键退出...' && read"
    else
        alacritty --title gaur-install -e bash -c "echo '错误: 缺少 paru 或 yay，请先安装其中之一'; read"
    fi
    exit 0
fi

OPTIONS="Install\nUpdate\nRemove"
CHOICE=$(echo -e "$OPTIONS" | fuzzel -d --width="20" --lines="3")

if [ -z "$CHOICE" ]; then
    exit 0
fi

case "$CHOICE" in
*"Install"*)
    alacritty --title gaur -e gaur -i &
    ;;
*"Update"*)
    alacritty --title gaur -e gaur -u &
    ;;
*"Remove"*)
    alacritty --title gaur -e gaur -r &
    ;;
esac
