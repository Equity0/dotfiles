# Dotfiles

我的配置文件备份，包含：

- alacritty
- fuzzel
- mako
- waybar
- swaylock
- niri

## 安装

```bash
git clone --bare git@github.com:Equity0/dotfiles.git ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

如果遇到已存在文件的冲突：

```bash
dotfiles checkout -f
```

## 注意事项

niri 会每十分钟随机更换背景图片，图片需存放在 `~/Pictures/Wallpapers` 目录中。

## 使用

```bash
dotfiles status          # 查看状态
dotfiles add .config/xx  # 添加新配置
dotfiles commit -m "xxx" # 提交更改
dotfiles push            # 推送到 GitHub
```
