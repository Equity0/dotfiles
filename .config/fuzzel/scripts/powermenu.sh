#!/usr/bin/env bash

# 定义选项，使用 \n 换行
options="Suspend\nPoweroff\nReboot\nLogout"

# 调用 fuzzel 作为菜单，并获取选择
chosen=$(echo -e "$options" | fuzzel --dmenu --prompt="Power > " --width="20" --lines="4")

# 根据选择执行相应的命令
case "$chosen" in
    Suspend)
        systemctl suspend
        ;;
    Poweroff)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Logout)
        niri msg action quit --skip-confirmation
        ;;
esac

