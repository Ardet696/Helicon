# Helicon

Arch Linux + Hyprland rice. Catppuccin Mocha base, near-black panels, blue accents.

## What's in here

| Path | What it is |
| --- | --- |
| `config/hypr` | Hyprland (`hyprland.lua`), `hypridle.conf`, `hyprlock.conf`, monitor layout |
| `config/waybar` | Mechabar fork: workspaces module removed, power button wired to the wofi menu |
| `config/wofi` | Shared menu theme (`config` + `style.css`) and the compact power menu (`power.conf` + `power.css`) |
| `config/kitty` | Terminal + theme |
| `config/mako` | Notifications |
| `config/btop` | System monitor |
| `config/hyprmoncfg` | Monitor profiles |
| `config/gtk-3.0` | GTK bits |
| `config/starship.toml` | Prompt |
| `bin/` | `hypr-*` helper scripts (app manager, power menu, wallpaper picker, screenshot OCR, waybar toggle, dim ramp) |

## Install

```bash
git clone <repo> ~/Projects/Helicon
~/Projects/Helicon/install.sh
```

`install.sh` symlinks `config/*` into `~/.config/` and `bin/*` into `~/.local/bin/`, moving anything already there to `*.helicon-bak`.

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
| `SUPER + CTRL + W` | Wallpaper picker |
| `SUPER + SHIFT + Space` | Toggle waybar |
| `SUPER + SHIFT + S` | Region screenshot to satty |
| `SUPER + CTRL + Print` | Screenshot OCR |

Power menu: click the waybar power icon, or run `hypr-power-menu`.

## Dependencies

`hyprland hyprlock hypridle waybar wofi kitty mako btop starship grim slurp satty wl-clipboard` plus a Nerd Font (`CommitMono Nerd Font`).

## Credit

Waybar config started from [mechabar](https://github.com/sejjy/mechabar) (MIT, `config/waybar/LICENSE`).
