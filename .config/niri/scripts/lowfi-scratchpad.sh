#!/bin/bash

if ! command -v lowfi &>/dev/null; then
    if command -v paru &>/dev/null; then
        alacritty --title lowfi-install -e bash -c "paru -S lowfi && echo '安装完成，按任意键退出...' && read"
    elif command -v yay &>/dev/null; then
        alacritty --title lowfi-install -e bash -c "yay -S lowfi && echo '安装完成，按任意键退出...' && read"
    else
        alacritty --title lowfi-install -e bash -c "echo '错误: 缺少 paru 或 yay，请先安装其中之一'; read"
    fi
    exit 0
fi

alacritty --title lofi-player -e lowfi -w 1 &
for i in $(seq 1 30); do
    sleep 0.2
    if niri msg --json windows | grep -q '"lofi-player"'; then
        sleep 0.3
        nirius scratchpad-toggle --title lofi-player
        notify-send -i multimedia-audio-player "lowfi" "已在后台启动，Mod+S 切换显示"
        break
    fi
done
