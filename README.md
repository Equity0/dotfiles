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
sudo pacman -S niri alacritty fuzzel waybar swaylock mako swaybg \
    wireplumber brightnessctl playerctl libnotify glib2 \
    pavucontrol blueman network-manager-applet btop nautilus \
    ttf-jetbrains-mono-nerd polkit-gnome seahorse gnome-keyring
```

### 依赖说明

| 分类 | 包名 | 用途 |
|------|------|------|
| **合成器** | niri | Wayland 平铺式合成器 |
| **终端** | alacritty | GPU 加速终端 |
| **启动器** | fuzzel | 应用启动器/菜单 |
| **状态栏** | waybar | 高度可定制状态栏 |
| **通知** | mako | 通知守护进程 |
| **锁屏** | swaylock | 屏幕锁定工具 |
| **壁纸** | swaybg | 壁纸设置（随机壁纸必需） |
| **音频** | wireplumber | 音量控制 (wpctl) |
| | playerctl | 媒体播放控制 |
| | pavucontrol | 音频控制面板（右键音量或麦克风图标打开） |
| **显示** | brightnessctl | 亮度控制 |
| **通知** | libnotify | 发送通知 (notify-send) |
| **网络** | network-manager-applet | 网络管理（右键网络图标打开） |
| | rfkill | WiFi/蓝牙开关 |
| **蓝牙** | blueman | 蓝牙管理（右键蓝牙图标打开） |
| **系统** | btop | 系统监控（左键 CPU 图标或 Mod+Esc 系统菜单打开） |
| | nautilus | 文件管理器 |
| | glib2 | 主题切换 (gsettings) |
| **字体** | ttf-jetbrains-mono-nerd | Nerd Font 图标字体 |
| **认证** | polkit-gnome | 权限认证代理 |
| | gnome-keyring | 密钥管理守护进程 |
| | seahorse | 密钥管理图形界面 |

### 可选依赖

| 包名 | 说明 |
|------|------|
| chromium | 浏览器 (Mod+Shift+Enter 启动) |
| brave-origin | 浏览器 (AUR) |
| gvfs | Nautilus WebDAV 支持 |
| gvfs-dnssd | Nautilus 网络发现/WebDAV |
| gaur | TUI 包管理器 (AUR) |
| lowfi | 终端音乐播放器 (AUR) |
| mimocode | AI 编程助手 (AUR) |
| [dockur/windows](https://github.com/dockur/windows) | 通过 Docker 运行 Windows |

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

### 基本操作

| 快捷键 | 功能 |
|--------|------|
| `Mod + Enter` | 打开终端 (Alacritty) |
| `Mod + Shift + Enter` | 打开浏览器 (Chromium) |
| `Mod + Space` | 应用启动器 (Fuzzel) |
| `Mod + Escape` | 系统菜单 |
| `Super + Alt + L` | 锁定屏幕 |
| `Super + E` | 打开文件管理器 |
| `Mod + W` | 关闭窗口 |
| `Mod + Shift + E` | 退出 niri |
| `Ctrl + Alt + Delete` | 退出 niri |

### 窗口管理

| 快捷键 | 功能 |
|--------|------|
| `Mod + H/J/K/L` | 焦点左/下/上/右 |
| `Mod + Shift + H/J/K/L` | 移动窗口左/下/上/右 |
| `Mod + Left/Right` | 调整列宽 -5%/+5% |
| `Mod + Up/Down` | 调整窗口高度 -5%/+5% |
| `Mod + Minus/Equal` | 调整列宽 -10%/+10% |
| `Mod + Shift + Minus/Equal` | 调整窗口高度 -10%/+10% |
| `Mod + R` | 切换预设宽度 |
| `Mod + Shift + R` | 反向切换预设宽度 |
| `Mod + Ctrl + R` | 重置窗口高度 |
| `Mod + Ctrl + Shift + R` | 切换预设高度 |
| `Mod + F` | 最大化列 |
| `Mod + Shift + F` | 全屏窗口 |
| `Mod + M` | 最大化到边缘 |
| `Mod + Ctrl + F` | 扩展到可用宽度 |
| `Mod + C` | 居中列 |
| `Mod + Ctrl + C` | 居中所有可见列 |
| `Mod + V` | 切换浮动 |
| `Mod + Shift + V` | 在浮动和平铺间切换焦点 |

### 工作区

| 快捷键 | 功能 |
|--------|------|
| `Mod + 1-9` | 切换到工作区 1-9 |
| `Mod + Shift + 1-9` | 移动窗口到工作区 1-9 |
| `Mod + U/I` | 切换到上/下个工作区 |
| `Mod + Shift + U/I` | 移动列到上/下个工作区 |
| `Mod + Ctrl + U/I` | 移动工作区上/下 |
| `Mod + Home/End` | 跳到第一个/最后一个列 |
| `Mod + Shift + Home/End` | 移动列到第一个/最后 |

### 显示器

| 快捷键 | 功能 |
|--------|------|
| `Mod + Ctrl + H/J/K/L` | 焦点左/下/上/右显示器 |
| `Mod + Shift + Ctrl + H/J/K/L` | 移动列到左/下/上/右显示器 |
| `Mod + Shift + Ctrl + Left/Right` | 移动工作区到左/右显示器 |
| `Mod + Shift + Ctrl + Up/Down` | 移动工作区到上/下显示器 |
| `Mod + Shift + P` | 关闭显示器 |

### 窗口组合

| 快捷键 | 功能 |
|--------|------|
| `Mod + [` | 向左合并/弹出窗口 |
| `Mod + ]` | 向右合并/弹出窗口 |
| `Mod + ,` | 合并窗口到列 |
| `Mod + .` | 从列弹出窗口 |

### 概览与 Scratchpad

| 快捷键 | 功能 |
|--------|------|
| `Mod + O` | 切换概览视图 |
| `Mod + S` | 显示所有 scratchpad |
| `Mod + Shift + S` | 移动窗口到 scratchpad |

### 截图

| 快捷键 | 功能 |
|--------|------|
| `Print` | 截图 |
| `Ctrl + Print` | 截取整个屏幕 |
| `Alt + Print` | 截取当前窗口 |

### 多媒体

| 快捷键 | 功能 |
|--------|------|
| `XF86AudioRaiseVolume` | 增加音量 |
| `XF86AudioLowerVolume` | 降低音量 |
| `XF86AudioMute` | 静音 |
| `XF86AudioMicMute` | 麦克风静音 |
| `XF86AudioPlay` | 播放/暂停 |
| `XF86AudioStop` | 停止 |
| `XF86AudioPrev` | 上一曲 |
| `XF86AudioNext` | 下一曲 |
| `XF86MonBrightnessUp` | 增加亮度 |
| `XF86MonBrightnessDown` | 降低亮度 |

### 其他

| 快捷键 | 功能 |
|--------|------|
| `Mod + Shift + /` | 显示快捷键帮助 |
| `Mod + Shift + Escape` | 切换快捷键抑制 |

## 🎨 主题

配置支持 Catppuccin 主题切换：

- **Latte** - 浅色主题
- **Macchiato** - 深色主题

通过系统菜单 (`Mod + Escape` → THEME) 切换。

---

<div align="center">

**如果觉得有用，请给个 ⭐**

</div>
