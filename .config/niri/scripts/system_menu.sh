#!/usr/bin/env bash

# 定义你之前写好的主题切换脚本路径（请根据你的实际路径修改）
STUDY_SCRIPT="$HOME/open-workspace2.sh"
THEME_SCRIPT="$HOME/.config/fuzzel/scripts/switch_theme.sh"
POWER_SCRIPT="$HOME/.config/fuzzel/scripts/powermenu.sh"

# 1. 定义菜单选项
# 用 \n 分隔每个选项
OPTIONS="STUDY\nGAUR\nTHEME\nPOWER"

# 2. 通过 fuzzel 展现菜单
CHOICE=$(echo -e "$OPTIONS" | fuzzel -d --width="20" --lines="4")

# 如果用户按了 Esc 或没有选择，则退出
if [ -z "$CHOICE" ]; then
  exit 0
fi

# 3. 根据选择执行对应的操作
case "$CHOICE" in
*"STUDY"*)
  # 在 alacritty 中启动 gaur TUI 包管理器
  bash "$STUDY_SCRIPT" &
  ;;
*"GAUR"*)
  # 在 alacritty 中启动 gaur TUI 包管理器
  alacritty --class "gaur" -e gaur &
  ;;
*"THEME"*)
  # 异步调用你的主题切换脚本
  bash "$THEME_SCRIPT" &
  ;;
*"POWER"*)
  # 使用 systemctl 重启
  bash "$POWER_SCRIPT" &
  ;;
*)
  exit 0
  ;;
esac
