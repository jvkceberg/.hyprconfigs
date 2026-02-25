# Spotify Application

Configurations for [Spotify](https://www.spotify.com/) in [Hyprland](https://hypr.land/) using [librespot](https://github.com/librespot-org/librespot/) and [ncspot](https://github.com/hrkfdn/ncspot/).

## Introduction

| Tool | Version |
| :--- | :------ |
| [Hyprland](https://hypr.land/) | `0.53.3` |
| [librespot](https://github.com/librespot-org/librespot/) | `0.8.0` |
| [ncspot](https://github.com/hrkfdn/ncspot/) | `1.3.3` |
| [aplay(ALSA)](https://archlinux.org/packages/extra/x86_64/alsa-utils/) | `1.2.15.2` |

> ALSA is awsome, use it!
> ```sh
> pacman -S alsa-utils
> ```

### Why not GUI

There is a [Official Spotify Client](https://aur.archlinux.org/packages/spotify) available for Arch Linux. However, GUI applications are often not a best fit for [Tiling Window Manager](https://en.wikipedia.org/wiki/Tiling_window_manager) like Hyprland.

Potential issues with using a GUI in TWM:

- **Window Managment Overhead**: You cannot easily hide or "close" the GUI without stopping the playback or losing your place.
- **Screen Real Estate**: A GUI app occupies a constant tile, which can be restrictive when multitasking in a tiled layout.

Why a BE + FE setup is preferable:

- **Decoupled Control**: You can close FE while the BE continues to play music in the background.
- **Efficiency**: The Backend runs as a lightweight process without being tied to a specific window, allowing distraction-free workflow.

> [!IMPORTANT]
> Both `librespot` and `ncspot` require **premium account**!

## Installation

1. Install `librespot` and `ncspot`.
   
    ```sh
    sudo pacman -S librespot ncspot
    ```

    or with `yay` 

    ```sh
    yay -S librespot ncspot
    ```

    or with `paru`

    ```sh
    paru -S librespot ncspot
    ```

2. Clone this repository and execute [`scripts/install.sh`](./scripts/install.sh)

    ```sh
    git clone https://github.com/jvkceberg/.hyprconfigs.git
    cp -r .hyprconfigs/.config/spotify/* ~/.config/spotify/
    cd ~/.config/spotify/
    chmod +x ./scripts/install.sh
    ./scripts/install.sh
    ```
    
    Or, you can just use my whole project.

3. Reload hyprland.

    ```sh
    hyprctl reload
    ```

