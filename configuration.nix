# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];

  boot.initrd.luks.devices."luks-9638fbfe-1426-4903-bf85-68eb5ffeefe6".device = "/dev/disk/by-uuid/9638fbfe-1426-4903-bf85-68eb5ffeefe6";
  networking.hostName = "zima"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney"; #"Europe/Copenhagen";

  services.getty.autologinUser = "lovro";
  services.udisks2.enable = true;
  services.udev.packages = [ pkgs.qFlipper ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_DK.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "dk";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "dk-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lovro = {
    isNormalUser = true;
    description = "lovro";
    extraGroups = [ "networkmanager" "wheel" "storage" "video" "tss" "dialout" ];
    packages = with pkgs; [
      tree
    ];
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
    ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/actual_brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/actual_brightness"
  '';

  security.sudo.extraConfig = ''
    lovro ALL=(ALL) NOPASSWD: ${pkgs.brillo}/bin/brillo -qA 5
    lovro ALL=(ALL) NOPASSWD: ${pkgs.brillo}/bin/brillo -qU 5
  '';

  security.sudo.extraRules = [
    {
      users = [ "lovro" ];  # Replace with your username
      commands = [
        {
          command = "${pkgs.brillo}/bin/brillo";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  security.tpm2.enable = true;
  security.tpm2.pkcs11.enable = true;
  security.tpm2.tctiEnvironment.enable = true;

  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    blueman
    brillo
    dunst
    dysk
    electron
    eza
    fastfetch
    fzf
    gcc
    git
    htop
    hyprlock
    hyprpaper
    hyprpicker
    hyprshot
    jq
    kitty
    libnotify
    nix-search-tv
    playerctl
    psmisc
    pywal
    starship
    swaynotificationcenter
    tailscale
    udiskie
    unzip
    vim
    vscodium
    wget
    waybar
    wofi
    yazi
    zip
  ];

  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than +5";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  # Add Avahi service
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  networking.firewall = { 
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    
    # SSH port
    allowedTCPPorts = [ 22 7003 ];
    
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPorts = [ 5353 ];
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  }; 

  # Enable hibernation support
  boot.resumeDevice = "/dev/disk/by-label/swap"; # Adjust to your swap partition
  
  # Configure systemd sleep settings
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "20min";
  };
  
  # Configure logind to suspend-then-hibernate on lid close
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "suspend-then-hibernate";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
