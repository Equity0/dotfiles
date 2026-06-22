#!/usr/bin/env bash

# 1. 壁纸文件夹路径（支持命令行参数，否则使用默认值）
WALLPAPER_DIR="${1:-$HOME/Pictures/WallpapersNatural}"

# 2. 检查工具是否存在
if ! command -v swaybg &> /dev/null || ! command -v shuf &> /dev/null; then
    echo "swaybg or shuf not found, exiting."
    exit 1
fi

# 3. 无限循环（若不需要定时更换，去掉 while 循环即可）
while true; do
    # 随机挑选一张图片
    RANDOM_BG=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)

    if [ -n "$RANDOM_BG" ]; then
        # 启动新的 swaybg 实例
        swaybg -i "$RANDOM_BG" -m fill &
        NEW_PID=$!

        # 等待一段时间后更换（例如 10 分钟 = 600 秒）
        sleep 600

        # 杀死旧实例以实现平滑切换（防止白屏/闪烁）
        if [ -n "$OLD_PID" ]; then
            kill "$OLD_PID" 2>/dev/null
        fi
        
        OLD_PID=$NEW_PID
    else
        sleep 60
    fi
done

