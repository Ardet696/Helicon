# Helicon

Arch Linux + Hyprland rice. Catppuccin Mocha base, near-black panels, blue accents.

## What's in here

| Path | What it is |
| --- | --- |
| `config/hypr` | Hyprland (`hyprland.lua`), `hypridle.conf`, `hyprlock.conf`, monitor layout |
| `config/waybar` | Mechabar fork: workspaces module removed, power button wired to the wofi menu, `custom/claude` Claude Code session monitor |
| `config/wofi` | Shared menu theme (`config` + `style.css`) and the compact power menu (`power.conf` + `power.css`) |
| `config/kitty` | Terminal + theme |
| `config/mako` | Notifications |
| `config/btop` | System monitor |
| `config/hyprmoncfg` | Monitor profiles |
| `config/gtk-3.0` | GTK bits |
| `config/starship.toml` | Prompt |
| `extern/claude-waybar` | Submodule: [claude-waybar](https://github.com/Ardet696/claude-waybar), the Claude Code session monitor behind `custom/claude` |
| `system/logind.conf.d` | logind drop-in so the hardware power button opens the power menu instead of shutting down |
| `bin/` | `hypr-*` helper scripts (app manager, power menu, wallpaper picker, screenshot, screenshot OCR, waybar toggle, dim ramp, screensaver, lock-screen bonsai) and `hypr-bg-carousel` (GTK4 wallpaper carousel) |

## Idle and lock

- 5 min: backlight dim ramp.
- 10 min: `hypr-screensaver` opens a fullscreen kitty running `cbonsai` on every monitor; any input kills it.
- 20 min: screensaver stops, session locks.
- On the lock screen the wallpaper shows and the password field fades in on first keypress. After 30 s the background turns black and a growing `cbonsai` plays above the field (`hypr-lock-bonsai` prints pre-rendered pango frames from `hypr-bonsai-gen`, `hypr-lock-bg` swaps the background).

Requires `cbonsai`, `jq`, `kitty`, `hypridle`, `hyprlock`.

## Install

```bash
git clone --recurse-submodules <repo> ~/Projects/Helicon
~/Projects/Helicon/install.sh
```

`install.sh` symlinks `config/*` into `~/.config/` and `bin/*` into `~/.local/bin/`, moving anything already there to `*.helicon-bak`. It runs the claude-waybar installer (links its scripts into `~/.local/bin`, registers its hooks and statusLine in `~/.claude/settings.json`). It also installs the logind drop-in to `/etc/systemd/logind.conf.d/` (needs sudo).

## Palette

| Role | Hex |
| --- | --- |
| Panel | `rgba(9, 9, 15, .96)` |
| Border | `#1b2540` |
| Field | `#101019` |
| Accent | `#89b4fa` |
| Text | `#cdd6f4` |
| Muted | `#a6adc8` |

## Keybinds

`SUPER` is the mod.

| Bind | Action |
| --- | --- |
| `SUPER + Space` | App manager (wofi drun) |
| `SUPER + Return` | Terminal |
| `SUPER + W` | Close window |
| `SUPER + E` | File manager |
| `SUPER + L` | Lock |
| `SUPER + CTRL + W` | Wallpaper picker (wofi list) |
| `SUPER + CTRL + Space` | Wallpaper carousel (arrows browse, Enter applies) |
| `SUPER + ALT + Space` | Power menu |
| `SUPER + SHIFT + Space` | Toggle waybar |
| `Print` | Screenshot of the active monitor to satty |
| `SUPER + SHIFT + S` | Region screenshot to satty |
| `SUPER + CTRL + Print` | Region screenshot to satty |
| `SUPER + CTRL + SHIFT + Print` | Screenshot OCR |

Power menu: `SUPER + ALT + Space`, the hardware power button, the waybar power icon, or `hypr-power-menu`.

## Dependencies

`hyprland hyprlock hypridle waybar wofi kitty mako btop starship grim slurp satty hyprpicker jq wl-clipboard swaybg python-gobject gtk4 gtk4-layer-shell` plus a Nerd Font (`CommitMono Nerd Font`).

## Credit

Waybar config started from [mechabar](https://github.com/sejjy/mechabar) (MIT, `config/waybar/LICENSE`).
