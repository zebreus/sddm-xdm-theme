# sddm-xdm-theme

A sddm theme that looks like xdm

## install

Just copy everything to your sddm themes directory (usually `/usr/share/sddm/themes/xdm` ) and set the theme to `xdm` in your `sddm.conf`

### install on nixos

Add the following to your nixos config.

```
# Enable plasma and sddm
services.xserver = {
  enable = true;
  desktopManager.plasma5.enable = true;
  displayManager.sddm.enable = true;
}

# Enable this theme
services.xserver.displayManager.sddm.theme = "xdm";
environment.systemPackages = [ pkgs.sddm-xdm-theme ];
```

## configuration

There are options to disable animations and to set the background and the logo image in `theme.conf`.

The xorg image is taken from the xdm git
https://github.com/freedesktop/xorg-xdm/blob/master/config/xorg.xpm
