```
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣠⡶⠒⠒⠶⣄⣠⡴⠚⠉⠁⠀⠀⠀⠀⠀⠉⠙⠳⢦⡀⠀⠀⠀⠀⠀⠀
⢠⡏⠀⠀⠀⠀⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢧⡀⠀⠀⠀⠀
⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⢱⠀⠀⢠⠉⢡⠀⠀⠀⠀⠀⠻⡄⠀⠀⠀
⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⣾⠄⠀⢸⣦⣾⠀⠀⠀⠀⠀⠀⢻⡄⠀⠀
⠀⠘⢧⡀⠀⠀⠀⠀⠀⠀⠈⣿⣿⠀⠀⠸⣿⡿⠀⠀⠀⠀⠀⠀⠈⠳⣄⠀
⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠈⠁⡴⠶⡆⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠹⡄
⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷
⠀⠀⠀⠸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠇
⠀⠀⠀⠀⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡽⣿⡛⠁⠀
⠀⣠⢾⣭⠀⠈⠳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠊⠀⢠⣝⣷⡀
⢠⡏⠘⠋⠀⠀⠀⠈⠑⠦⣄⣀⠀⠀⠀⠀⠀⣀⡠⠔⠋⠀⠀⠀⠈⠛⠃⢻
⠈⠷⣤⣀⣀⣀⣀⣀⣀⣀⣀⣤⡽⠟⠛⠿⣭⣄⣀⣀⣀⣀⣀⣀⣀⣀⣤⠞
⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠀⠀⠀
```

# Zima

My personal NixOS configuration, built around **Hyprland** on Wayland with a fully pywal-driven theming system. Everything is declared with Nix flakes and managed through Home Manager.

---

## Features

- **Hyprland** - tiling Wayland compositor with smooth animations and blur
- **pywal** - wallpaper-driven color theming applied globally across Hyprlock, Waybar, Wofi, and Kitty
- **Waybar** - modular status bar with live music visualizer, color picker, and multiple switchable themes
- **Wofi** - app launcher styled to match the current pywal palette
- **Hyprlock** - themed lock screen with large clock overlay
- **Kitty** - terminal with translucent background
- **Yazi** - terminal file manager
- **Suspend-then-hibernate** on lid close with a 20-minute delay
- **LUKS** full-disk encryption + **TPM2** support
- **Tailscale** VPN with full routing
- **KDE Connect** for phone integration
- **Atuin** for fuzzy shell history search
- All **Nerd Fonts** included

---

## 📁 Structure

```
.
├── flake.nix                   # Flake inputs & NixOS system definition
├── flake.lock
├── configuration.nix           # System-level config (boot, networking, services, packages)
├── hardware-configuration.nix  # Auto-generated hardware config
├── home.nix                    # Home Manager entry point
└── home_modules/
    ├── packages.nix            # User packages (Brave, Discord, Spotify, Steam …)
    ├── hyprland.nix            # Hyprland settings, keybinds & Hyprlock config
    ├── waybar.nix              # Waybar layout, modules & style
    ├── wofi.nix                # Wofi launcher config & style
    ├── shell.nix               # Shell configuration (Starship, Atuin …)
    ├── fastfetch.nix           # Fastfetch config
    ├── waybar/
    │   ├── style.css           # Default Waybar stylesheet (pywal-sourced)
    │   ├── caway.sh            # Cava audio visualizer piped into the music module
    │   ├── colorpicker.sh      # hyprpicker wrapper with waybar signal integration
    │   ├── refresh.sh          # Toggle Waybar on/off
    │   └── select.sh          # Wofi-based Waybar theme switcher
    └── theme_update.sh         # Apply a new wallpaper and regenerate pywal colors
```

---

## ⌨️ Keybindings

| Binding | Action |
|---|---|
| `Super + Return` | Open terminal (Kitty) |
| `Super + Space` | Open app launcher (Wofi) |
| `Super + F` | Open browser (LibreWolf) |
| `Super + E` | Open file manager (Yazi) |
| `Super + L` | Lock screen (Hyprlock) |
| `Super + C` | Close active window |
| `Super + V` | Toggle floating |
| `Super + J` | Toggle split layout |
| `Super + P` | Pseudo-tile window |
| `Super + Escape` | Exit Hyprland |
| `Print` | Screenshot region → `~/Pictures/screenshots/` |
| `Super + 1–0` | Switch to workspace 1–10 |
| `Super + Shift + 1–0` | Move window to workspace 1–10 |
| `Super + Tab` | Next workspace |
| `Super + S` | Toggle scratchpad |
| `Super + Mouse drag` | Move window |
| `Super + Right-click drag` | Resize window |
| `XF86Audio*` | Media controls (playerctl) |
| `XF86Brightness*` | Screen brightness (brillo) |

---

## Theming

Zima uses **pywal** to generate a color palette from the current wallpaper. Colors are exported as variables consumed by Hyprland, Hyprlock, Waybar, and Wofi automatically.

To change the wallpaper and regenerate all colors:

```bash
~/.config/theme_update.sh /path/to/image.jpg
```

Waybar also ships with four switchable layout themes (default, experimental, line, zen), selectable from a Wofi menu:

```bash
~/.config/waybar/scripts/select.sh
```

---

## Installation

> **Requires**: NixOS with flakes enabled.

1. Clone the repo:
   ```bash
   git clone https://github.com/SpicyGengu/Zima.git /etc/nixos
   ```

2. Update hardware configuration to match your machine:
   ```bash
   nixos-generate-config --show-hardware-config > /etc/nixos/hardware-configuration.nix
   ```

3. Edit `configuration.nix` and `home.nix` to swap in your username and any hardware-specific tweaks (LUKS UUID, display names, etc.).

4. Build and switch:
   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos#zima
   ```

---

## Updating

Flake inputs can be updated from within the Waybar UI by clicking the **cloud download** icon, or manually:

```bash
cd /etc/nixos
sudo nix flake update
sudo nixos-rebuild switch --flake /etc/nixos#zima
```

Nix garbage collection runs automatically daily, keeping only the 5 most recent generations.

---

## Key Packages

| Category | Tools |
|---|---|
| Browser | LibreWolf, Brave |
| Terminal | Kitty |
| Editor | VSCodium |
| File manager | Yazi |
| Music | Spotify, spicetify-cli |
| Notes | Obsidian |
| Mail | Thunderbird |
| Chat | Discord |
| Gaming | Steam |
| Hacking | qFlipper |
| Dev | Rust (rustup), GCC, Git, GitHub CLI |
| AI | Claude Desktop |
| DTU | DTUConnect |

---

## Credits

- https://github.com/elifouts/Dotfiles
- https://github.com/PROxZIMA/caway
- https://github.com/MikaelFangel/DTUConnect.git
- https://github.com/k3d3/claude-desktop-linux-flake
