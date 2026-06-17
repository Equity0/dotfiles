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
sudo pacman -S niri alacritty fuzzel waybar swaylock mako swaybg \
    wireplumber brightnessctl playerctl libnotify glib2 \
    pavucontrol blueman network-manager-applet btop nautilus \
    ttf-jetbrains-mono-nerd polkit-gnome seahorse gnome-keyring
```

### Dependencies Detail

| Category | Package | Purpose |
|----------|---------|---------|
| **Compositor** | niri | Wayland tiling compositor |
| **Terminal** | alacritty | GPU-accelerated terminal |
| **Launcher** | fuzzel | App launcher / menu |
| **Bar** | waybar | Highly customizable status bar |
| **Notification** | mako | Notification daemon |
| **Lock** | swaylock | Screen locking tool |
| **Wallpaper** | swaybg | Wallpaper setter (required for random wallpaper) |
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
| | gnome-keyring | Keyring management daemon |
| | seahorse | Keyring management GUI |

### Optional Dependencies

| Package | Description |
|---------|-------------|
| chromium | Web browser (Mod+Shift+Enter to launch) |
| brave-origin | Web browser (AUR) |
| gvfs | Nautilus WebDAV support |
| gvfs-dnssd | Nautilus network discovery/WebDAV |
| gaur | TUI package manager (AUR) |
| lowfi | Terminal music player (AUR) |
| mimocode | AI coding assistant (AUR) |

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

### Basic

| Shortcut | Action |
|----------|--------|
| `Mod + Enter` | Open terminal (Alacritty) |
| `Mod + Shift + Enter` | Open browser (Chromium) |
| `Mod + Space` | App launcher (Fuzzel) |
| `Mod + Escape` | System menu |
| `Super + Alt + L` | Lock screen |
| `Super + E` | Open file manager |
| `Mod + W` | Close window |
| `Mod + Shift + E` | Quit niri |
| `Ctrl + Alt + Delete` | Quit niri |

### Window Management

| Shortcut | Action |
|----------|--------|
| `Mod + H/J/K/L` | Focus left/down/up/right |
| `Mod + Shift + H/J/K/L` | Move window left/down/up/right |
| `Mod + Left/Right` | Adjust column width -5%/+5% |
| `Mod + Up/Down` | Adjust window height -5%/+5% |
| `Mod + Minus/Equal` | Adjust column width -10%/+10% |
| `Mod + Shift + Minus/Equal` | Adjust window height -10%/+10% |
| `Mod + R` | Cycle preset widths |
| `Mod + Shift + R` | Cycle preset widths (reverse) |
| `Mod + Ctrl + R` | Reset window height |
| `Mod + Ctrl + Shift + R` | Cycle preset heights |
| `Mod + F` | Maximize column |
| `Mod + Shift + F` | Fullscreen window |
| `Mod + M` | Maximize to edges |
| `Mod + Ctrl + F` | Expand to available width |
| `Mod + C` | Center column |
| `Mod + Ctrl + C` | Center all visible columns |
| `Mod + V` | Toggle floating |
| `Mod + Shift + V` | Switch focus between floating and tiling |

### Workspace

| Shortcut | Action |
|----------|--------|
| `Mod + 1-9` | Switch to workspace 1-9 |
| `Mod + Shift + 1-9` | Move window to workspace 1-9 |
| `Mod + U/I` | Focus workspace down/up |
| `Mod + Shift + U/I` | Move column to workspace down/up |
| `Mod + Ctrl + U/I` | Move workspace down/up |
| `Mod + Home/End` | Focus first/last column |
| `Mod + Shift + Home/End` | Move column to first/last |

### Monitor

| Shortcut | Action |
|----------|--------|
| `Mod + Ctrl + H/J/K/L` | Focus left/down/up/right monitor |
| `Mod + Shift + Ctrl + H/J/K/L` | Move column to left/down/up/right monitor |
| `Mod + Shift + Ctrl + Left/Right` | Move workspace to left/right monitor |
| `Mod + Shift + Ctrl + Up/Down` | Move workspace to up/down monitor |
| `Mod + Shift + P` | Power off monitors |

### Window Grouping

| Shortcut | Action |
|----------|--------|
| `Mod + [` | Consume or expel window left |
| `Mod + ]` | Consume or expel window right |
| `Mod + ,` | Consume window into column |
| `Mod + .` | Expel window from column |

### Overview & Scratchpad

| Shortcut | Action |
|----------|--------|
| `Mod + O` | Toggle overview |
| `Mod + S` | Show all scratchpads |
| `Mod + Shift + S` | Move window to scratchpad |

### Screenshot

| Shortcut | Action |
|----------|--------|
| `Print` | Screenshot |
| `Ctrl + Print` | Screenshot screen |
| `Alt + Print` | Screenshot window |

### Media

| Shortcut | Action |
|----------|--------|
| `XF86AudioRaiseVolume` | Volume up |
| `XF86AudioLowerVolume` | Volume down |
| `XF86AudioMute` | Mute |
| `XF86AudioMicMute` | Mute microphone |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioStop` | Stop |
| `XF86AudioPrev` | Previous track |
| `XF86AudioNext` | Next track |
| `XF86MonBrightnessUp` | Brightness up |
| `XF86MonBrightnessDown` | Brightness down |

### Other

| Shortcut | Action |
|----------|--------|
| `Mod + Shift + /` | Show hotkey overlay |
| `Mod + Shift + Escape` | Toggle keyboard shortcuts inhibit |

## 🎨 Themes

Configuration supports Catppuccin theme switching:

- **Latte** - Light theme
- **Macchiato** - Dark theme

Switch via system menu (`Mod + Escape` → THEME).

---

<div align="center">

**If you find this helpful, please give it a ⭐**

</div>
