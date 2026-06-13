<div align="center">

# 🏠 Dotfiles

我的 Linux 桌面环境配置文件备份

[English](./README_EN.md) | 中文

</div>

## 📦 包含配置

| 组件 | 说明 |
|------|------|
| [niri](https://github.com/YaLTeR/niri) | Wayland 平铺式合成器 |
| [alacritty](https://github.com/alacritty/alacritty) | GPU 加速终端模拟器 |
| [fuzzel](https://codeberg.org/dnkl/fuzzel) | Wayland 应用启动器 |
| [waybar](https://github.com/Alexays/Waybar) | 高度可定制状态栏 |
| [mako](https://github.com/emersion/mako) | 轻量级通知守护进程 |
| [swaylock](https://github.com/swaywm/swaylock) | 屏幕锁定工具 |

## ⚙️ 依赖安装

### Arch Linux

```bash
sudo pacman -S niri alacritty fuzzel waybar swaylock mako \
    wireplumber brightnessctl playerctl libnotify glib2 \
    pavucontrol blueman network-manager-applet btop nautilus \
    ttf-jetbrains-mono-nerd polkit-gnome
```

### 依赖说明

| 分类 | 包名 | 用途 |
|------|------|------|
| **音频** | wireplumber | 音量控制 (wpctl) |
| | playerctl | 媒体播放控制 |
| | pavucontrol | 音频控制面板 |
| **显示** | brightnessctl | 亮度控制 |
| **通知** | libnotify | 发送通知 (notify-send) |
| **网络** | network-manager-applet | 网络管理 |
| | rfkill | WiFi/蓝牙开关 |
| **蓝牙** | blueman | 蓝牙管理 |
| **系统** | btop | 系统监控 |
| | nautilus | 文件管理器 |
| | glib2 | 主题切换 (gsettings) |
| **字体** | ttf-jetbrains-mono-nerd | Nerd Font 图标字体 |
| **认证** | polkit-gnome | 权限认证代理 |

### 可选依赖

| 包名 | 说明 |
|------|------|
| chromium | 浏览器 (Mod+Shift+Enter 启动) |
| gaur | TUI 包管理器 |

## 🚀 安装使用

### 克隆配置

```bash
git clone --bare git@github.com:Equity0/dotfiles.git ~/.dotfiles
```

### 定义别名

```bash
# 添加到 ~/.bashrc 或 ~/.zshrc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### 检出配置

```bash
dotfiles checkout
```

如果遇到已存在文件的冲突：

```bash
dotfiles checkout -f
```

## 📝 日常使用

```bash
dotfiles status                    # 查看状态
dotfiles add .config/xxx           # 添加指定文件
dotfiles add -u                    # 添加所有已修改的文件（不包含新文件）
dotfiles commit -m "更新说明"       # 提交更改
dotfiles push                      # 推送到 GitHub
```

**一键提交所有修改：**

```bash
dotfiles add -u && dotfiles commit -m "更新说明" && dotfiles push
```

## 🖼️ 壁纸设置

niri 配置了每 10 分钟自动更换背景图片，图片需存放在：

```
~/Pictures/Wallpapers/
```

## ⌨️ 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Mod + Enter` | 打开终端 (Alacritty) |
| `Mod + Space` | 应用启动器 (Fuzzel) |
| `Mod + Escape` | 系统菜单 |
| `Super + Alt + L` | 锁定屏幕 |
| `Mod + W` | 关闭窗口 |
| `Mod + F` | 最大化窗口 |
| `Mod + H/J/K/L` | 焦点移动 |
| `Mod + Shift + Enter` | 打开浏览器 (Chromium) |
| `Mod + Shift + H/J/K/L` | 移动窗口 |
| `Mod + 1-9` | 切换工作区 |
| `Mod + Shift + 1-9` | 移动到工作区 |
| `Mod + R` | 切换窗口宽度 |
| `Mod + V` | 切换浮动 |
| `Mod + O` | 概览视图 |

## 🎨 主题

配置支持 Catppuccin 主题切换：

- **Latte** - 浅色主题
- **Macchiato** - 深色主题

通过系统菜单 (`Mod + Escape` → THEME) 切换。

---

<div align="center">

**如果觉得有用，请给个 ⭐**

</div>
