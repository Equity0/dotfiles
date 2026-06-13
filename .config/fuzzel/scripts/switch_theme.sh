#!/usr/bin/env bash

# 定义配置文件路径
WAYBAR_CONF="$HOME/.config/waybar/style.css"
ALACRITTY_CONF="$HOME/.config/alacritty/alacritty.toml"

# 检查依赖
if ! command -v fuzzel &> /dev/null; then
    echo "错误: 未找到 fuzzel，请先安装它。"
    exit 1
fi

# 1. 通过 fuzzel 提供主题菜单
# \n 分隔选项，-p 设置提示符，-d 启用 dmenu 模式
CHOICE=$(echo -e "Latte\nMacchiato" | fuzzel -d -p "选择主题: " --width="20" -l 4)

# 如果用户按了 Esc 或没有选择，则退出
if [ -z "$CHOICE" ]; then
    exit 0
fi

# 2. 根据选择执行替换逻辑
case "$CHOICE" in
    "Latte")
        echo "正在切换到 Latte 主题..."
        # 替换 waybar 配置
        sed -i 's/macchiato\.css/latte.css/g' "$WAYBAR_CONF"
        # 替换 alacritty 配置
        sed -i 's/catppuccin-macchiato\.toml/catppuccin-latte.toml/g' "$ALACRITTY_CONF"
	# 替换 mako 配置
	cp ~/.config/mako/config-latte ~/.config/mako/config
	makoctl reload
	# 替换 fuzzel 配置
	cp ~/.config/fuzzel/THEME_Latte ~/.config/fuzzel/fuzzel.ini
	# XDG Desktop Portal 切换为浅色模式
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
	# 替换 swaylock 配置
	cp ~/.config/swaylock/latte.conf ~/.config/swaylock/config
        ;;
        
    "Macchiato")
        echo "正在切换到 Macchiato 主题..."
        # 替换 waybar 配置
        sed -i 's/latte\.css/macchiato.css/g' "$WAYBAR_CONF"
        # 替换 alacritty 配置
        sed -i 's/catppuccin-latte\.toml/catppuccin-macchiato.toml/g' "$ALACRITTY_CONF"
	# 替换 mako 配置
	cp ~/.config/mako/config-macchiato ~/.config/mako/config
	makoctl reload
	# 替换 fuzzel 配置
	cp ~/.config/fuzzel/THEME_Macchiato ~/.config/fuzzel/fuzzel.ini
	# XDG Desktop Portal 切换为深色模式 
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
	# 替换 swaylock 配置
	cp ~/.config/swaylock/macchiato.conf ~/.config/swaylock/config
        ;;
        
    *)
        echo "无效的选择"
        exit 1
        ;;
esac

# 3. 通知系统（可选）
# 如果你的 Waybar 没开启自动重载，可以取消下面这行的注释来强制刷新
# pkill -USR2 waybar

notify-send "主题切换成功" "当前主题已更改为 $CHOICE" -i ~/.config/fuzzel/icon.png 2>/dev/null || true
