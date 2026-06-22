#!/usr/bin/env bash

# 定义你之前写好的主题切换脚本路径（请根据你的实际路径修改）
STUDY_SCRIPT="$HOME/.config/niri/scripts/wokspc2-obsid-pdf.sh"
THEME_SCRIPT="$HOME/.config/fuzzel/scripts/switch_theme.sh"
POWER_SCRIPT="$HOME/.config/fuzzel/scripts/powermenu.sh"
LOWFI_SCRIPT="$HOME/.config/niri/scripts/lowfi-scratchpad.sh"
SOFTWARE_SCRIPT="$HOME/.config/niri/scripts/software.sh"
RAND_BG_SCRIPT="$HOME/.config/niri/scripts/rand-bg.sh"

# 1. 定义菜单选项
# 用 \n 分隔每个选项
OPTIONS="STUDY\nSOFTWARE\nLOFI\nMIMO\nWALLPAPERS\nTHEME\nBTOP\nPOWER"

# 2. 通过 fuzzel 展现菜单
CHOICE=$(echo -e "$OPTIONS" | fuzzel -d --width="20" --lines="8")

# 如果用户按了 Esc 或没有选择，则退出
if [ -z "$CHOICE" ]; then
  exit 0
fi

# 3. 根据选择执行对应的操作
case "$CHOICE" in
*"STUDY"*)
  bash "$STUDY_SCRIPT" &
  ;;
*"SOFTWARE"*)
  # 在 alacritty 中启动 gaur TUI 包管理器
  bash "$SOFTWARE_SCRIPT" &
  ;;
*"LOFI"*)
  bash "$LOWFI_SCRIPT" &
  ;;
*"MIMO"*)
  mkdir -p "$HOME/Projects"
  if command -v mimo &>/dev/null; then
    alacritty --title mimo --working-directory "$HOME/Projects" -e mimo &
  else
    xdg-open "https://mimo.xiaomi.com/coder" &
  fi
  ;;
*"WALLPAPERS"*)
  WP_CHOICE=$(echo -e "Natural\nComic" | fuzzel -d --width="15" --lines="2")
  if [ -n "$WP_CHOICE" ]; then
    case "$WP_CHOICE" in
    *"Natural"*)
      WP_DIR="$HOME/Pictures/WallpapersNatural"
      ;;
    *"Comic"*)
      WP_DIR="$HOME/Pictures/WallpapersComic"
      ;;
    *)
      exit 0
      ;;
    esac
    pkill -f "rand-bg.sh" 2>/dev/null
    pkill swaybg 2>/dev/null
    bash "$RAND_BG_SCRIPT" "$WP_DIR" &
  fi
  ;;
*"THEME"*)
  # 异步调用你的主题切换脚本
  bash "$THEME_SCRIPT" &
  ;;
*"BTOP"*)
  # 使用 systemctl 重启
  alacritty --title btop -e btop &
  ;;
*"POWER"*)
  # 使用 systemctl 重启
  bash "$POWER_SCRIPT" &
  ;;
*)
  exit 0
  ;;
esac
