{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
		atuin
		brave
		catppuccin-cursors.mochaDark
		cava
		discord
		gh
		gimp
		gnome-calculator
		inputs.claude-desktop.packages.${pkgs.stdenv.hostPlatform.system}.claude-desktop
		inputs.DTUConnect.packages.${pkgs.stdenv.hostPlatform.system}.default
		kdePackages.kdeconnect-kde
		librewolf-bin
		obsidian
		qFlipper
		rustup
		spicetify-cli
		spotify
		steam
		thunderbird
	];
}
