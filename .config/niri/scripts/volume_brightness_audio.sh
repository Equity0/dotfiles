#!/usr/bin/env bash

# 获取当前播放音乐信息的函数
get_media_info() {
    # 获取播放状态 (Playing / Paused)
    STATUS=$(playerctl status 2>/dev/null)
    if [ "$STATUS" = "Playing" ]; then
        ICON="" # 播放图标 (需要安装 Nerd Fonts 字体，若显示乱码可直接换成 [播放])
    else
        ICON="" # 暂停图标
    fi

    # 获取歌名和歌手
    TITLE=$(playerctl metadata title 2>/dev/null || echo "未知曲目")
    ALBUM=$(playerctl metadata album 2>/dev/null || echo "未知专辑")
    ARTIST=$(playerctl metadata artist 2>/dev/null || echo "未知歌手")

    # 发送通知：-c "osd" 继承之前的1秒自动消失样式
    notify-send -a "Music Player"  -h string:x-canonical-private-synchronous:media \
                "$ICON  $TITLE" "$ALBUM\n$ARTIST"
}


case "$1" in
    # 音量控制
    volume-up)
	# 检查是否静音，静音的话就取消静音
        if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	else
            # 调高音量 5%，限制最大音量为 100% (1.0)
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        fi
	# 获取当前音量（输出格式如 "Volume: 0.65"）
        VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
        notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
                    -h int:value:"${VOLUME%.*}" "音量" " "
        ;;
    volume-down)
	# 检查是否静音，静音的话就取消静音
	if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	else
            # 降低音量 5%
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        fi
        VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
        notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
                    -h int:value:"${VOLUME%.*}" "音量" " "
        ;;
    volume-mute)
        # 切换静音状态
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        # 检查是否静音（输出若包含 [MUTED] 则为静音）
        if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
            notify-send -a "Volume Mute" -h string:x-canonical-private-synchronous:volume \
                        -h int:value:0 "静音" " "
        else
            VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
            notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume \
                        -h int:value:"${VOLUME%.*}" "音量" " "
        fi
        ;;
    # ===================
    # 亮度控制
    brightness-up)
        brightnessctl set +5%
        BRIGHTNESS=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
        notify-send -a "Brightness" -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:"$BRIGHTNESS" "亮度" " "
        ;;
    brightness-down)
        brightnessctl set 5%-
        BRIGHTNESS=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
        notify-send -a "Brightness" -h string:x-canonical-private-synchronous:brightness \
                    -h int:value:"$BRIGHTNESS" "亮度" " "
        ;;
   # ===================
   # 媒体控制
   audio-play-pause)
	playerctl play-pause
	get_media_info
        ;;
   audio-stop)
	playerctl stop
        ;;
   audio-next)
        playerctl next
        sleep 0.1 # 等待播放器切换下一首，以便获取准确的歌名
        get_media_info
        ;;
   audio-previous)
        playerctl previous
        sleep 0.1
        get_media_info
        ;;
esac
