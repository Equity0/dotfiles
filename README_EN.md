<div align="center">

# 🏠 Dotfiles

My Linux Desktop Environment Configuration Backup

English | [中文](./README.md)

</div>

## 📦 Included Configurations

| Component | Description |
|-----------|-------------|
| [niri](https://github.com/YaLTeR/niri) | Wayland tiling compositor |
| [alacritty](https://github.com/alacritty/alacritty) | GPU-accelerated terminal emulator |
| [fuzzel](https://codeberg.org/dnkl/fuzzel) | Wayland application launcher |
| [waybar](https://github.com/Alexays/Waybar) | Highly customizable status bar |
| [mako](https://github.com/emersion/mako) | Lightweight notification daemon |
| [swaylock](https://github.com/swaywm/swaylock) | Screen locking tool |

## ⚙️ Dependencies Installation

### Arch Linux

```bash
sudo pacman -S niri alacritty fuzzel waybar swaylock mako \
    wireplumber brightnessctl playerctl libnotify glib2 \
    pavucontrol blueman network-manager-applet btop nautilus \
    ttf-jetbrains-mono-nerd polkit-gnome
```

### Dependencies Detail

| Category | Package | Purpose |
|----------|---------|---------|
| **Audio** | wireplumber | Volume control (wpctl) |
| | playerctl | Media playback control |
| | pavucontrol | Audio control panel |
| **Display** | brightnessctl | Brightness control |
| **Notification** | libnotify | Send notifications (notify-send) |
| **Network** | network-manager-applet | Network management |
| | rfkill | WiFi/Bluetooth toggle |
| **Bluetooth** | blueman | Bluetooth management |
| **System** | btop | System monitor |
| | nautilus | File manager |
| | glib2 | Theme switching (gsettings) |
| **Font** | ttf-jetbrains-mono-nerd | Nerd Font with icons |
| **Auth** | polkit-gnome | Authentication agent |

### Optional Dependencies

| Package | Description |
|---------|-------------|
| chromium | Web browser (Mod+Shift+Enter to launch) |
| gaur | TUI package manager |

## 🚀 Installation

### Clone Configuration

```bash
git clone --bare git@github.com:Equity0/dotfiles.git ~/.dotfiles
```

### Define Alias

```bash
# Add to ~/.bashrc or ~/.zshrc
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### Checkout Configuration

```bash
dotfiles checkout
```

If you encounter conflicts with existing files:

```bash
dotfiles checkout -f
```

## 📝 Daily Usage

```bash
dotfiles status                    # Check status
dotfiles add .config/xxx           # Add specific file
dotfiles add -u                    # Add all modified files (not new files)
dotfiles commit -m "description"   # Commit changes
dotfiles push                      # Push to GitHub
```

**Commit all changes at once:**

```bash
dotfiles add -u && dotfiles commit -m "description" && dotfiles push
```

## 🖼️ Wallpaper Setup

niri is configured to change wallpaper every 10 minutes. Place your images in:

```
~/Pictures/Wallpapers/
```

## ⌨️ Keybindings

| Shortcut | Action |
|----------|--------|
| `Mod + Enter` | Open terminal (Alacritty) |
| `Mod + Space` | App launcher (Fuzzel) |
| `Mod + Escape` | System menu |
| `Super + Alt + L` | Lock screen |
| `Mod + W` | Close window |
| `Mod + F` | Maximize window |
| `Mod + H/J/K/L` | Focus movement |
| `Mod + Shift + Enter` | Open browser (Chromium) |
| `Mod + Shift + H/J/K/L` | Move window |
| `Mod + 1-9` | Switch workspace |
| `Mod + Shift + 1-9` | Move to workspace |
| `Mod + R` | Toggle window width |
| `Mod + V` | Toggle floating |
| `Mod + O` | Overview |

## 🎨 Themes

Configuration supports Catppuccin theme switching:

- **Latte** - Light theme
- **Macchiato** - Dark theme

Switch via system menu (`Mod + Escape` → THEME).

---

<div align="center">

**If you find this helpful, please give it a ⭐**

</div>
