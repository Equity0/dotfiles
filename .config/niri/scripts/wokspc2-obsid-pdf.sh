#!/bin/bash

if ! command -v obsidian &>/dev/null; then
    notify-send -u critical "缺少 obsidian" "正在安装..."
    alacritty --title obsidian-install -e bash -c "sudo pacman -S obsidian && echo '安装完成，按任意键退出...' && read"
fi

if ! command -v papers &>/dev/null; then
    notify-send -u critical "缺少 papers" "正在安装..."
    alacritty --title papers-install -e bash -c "sudo pacman -S papers && echo '安装完成，按任意键退出...' && read"
fi

# 切换到第二个workspace
niri msg action focus-workspace 2

# 启动 Obsidian
obsidian &

# 启动 Papers (GNOME Document Viewer) 并打开 PDF
papers ~/Documents/民法-孟宪贵-专题讲座精讲卷\(笔记）.pdf&

# 等待窗口打开后切换焦点到 Obsidian
sleep 2
niri msg action focus-window --app-id obsidian
