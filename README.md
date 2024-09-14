# 🌙✨ My Dotfiles: Themeable and Customizable!
Tired of manually switching themes for your dotfiles every day? I was too! That's why I created a seamless solution that lets me effortlessly toggle between a dark theme for the night and a light theme for the day. Using a simple Makefile and the Mustache templating engine, I can replace colors across all my configurations in one go—no more tedious adjustments! Each theme is stored in its own file, making it super easy to create new themes without diving into every single dotfile.

## 🌈 Change Color Themes for Everything at Once
Easily switch between day and night color themes with a single command! This command applies a dark theme to all your programs and restarts those that do not automatically reload their configuration files:


```bash
DESTDIR=$HOME THEME=theme_dark_red.json make install -B ; i3-msg "restart"; tmux source-file ~/.tmux.conf; fish
```
## Demotime
### Dark Red Theme:
<img src="https://github.com/clemensmanert/dotfiles/blob/master/theme_dark_red.png" alt="dark demo" />

### Light Blue Theme:
<img src="https://github.com/clemensmanert/dotfiles/blob/master/theme_light_blue.png" alt="light demo" />

## 🛠️ Implementation
I utilize [{{ Mustache }}](http://mustache.github.io/) as a templating engine to theme my dotfiles. To create a theme, either design your own color file or choose one from the provided options. Then, invoke the template engine with:


```bash
DESTDIR=$HOME THEME=THE_THEME_FILE.json make install -B
```

This command searches for all files ending with `.mustache`, replaces the placeholders with the corresponding colors, and copies the files to their installed location under `$DESTDIR` (in this case, `$HOME`).
### Naming Conventions
The theme files follow naming conventions inspired by [Material](https://m3.material.io/). Colors are typically named based on their intentions and are organized in foreground/background pairs.
### Installation Structure
The installed file paths are inspired by [GNU Stow](https://www.gnu.org/software/stow/). Each directory contains the configuration files for a program, detailing how they should be moved to `$DESTDIR`.

### Dependencies
- A compatible implementation of [Mustache](http://mustache.github.io/) 
- Make

## 🖥️ What I Use Right Now
Here’s a list of the tools and applications I currently use:
- i3: Window compositor
- i3status-rust: Status bar generator
- Alacritty: Terminal emulator
- tmux: Terminal multiplexer
- fish: Shell
- tide: Prompt for fish
- rofi: Selector for clipboard, passwords, music, etc.
- zathura: Document viewer
- Emacs: Text editor
