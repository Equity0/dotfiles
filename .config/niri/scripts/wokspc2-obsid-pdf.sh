#!/bin/bash

# 切换到第二个workspace
niri msg action focus-workspace 2

# 启动 Obsidian
obsidian &

# 启动 Papers (GNOME Document Viewer) 并打开 PDF
org.gnome.Papers &

# 等待窗口打开后切换焦点到 Obsidian
sleep 2
niri msg action focus-window --app-id obsidian
